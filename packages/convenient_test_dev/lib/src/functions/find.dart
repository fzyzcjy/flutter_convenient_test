import 'dart:async';

import 'package:convenient_test/convenient_test.dart';
import 'package:convenient_test_common/convenient_test_common.dart';
import 'package:convenient_test_dev/src/functions/command.dart';
import 'package:convenient_test_dev/src/functions/core.dart';
import 'package:convenient_test_dev/src/functions/interaction.dart';
import 'package:convenient_test_dev/src/functions/log.dart';
import 'package:convenient_test_dev/src/support/get_it.dart';
import 'package:convenient_test_dev/src/support/slot.dart';
import 'package:convenient_test_dev/src/utils/util.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:recase/recase.dart';

extension ConvenientTestFind on ConvenientTest {
  TFinderCommand get(Object arg) => TFinderCommand(this, find.get(arg));

  TCommand routeName() => TRouteNameCommand(this);

  TRawCommand raw(Object value) => TRawCommand(this, value);
}

extension ExtFinder on Finder {
  // forward methods

  Future<void> should(Matcher matcher, {String? reason}) async =>
      TFinderCommand.auto(this).should(matcher, reason: reason);

  Future<void> enterText(String text) => TFinderCommand.auto(this).enterText(text);

  Future<void> tap({bool warnIfMissed = true}) => TFinderCommand.auto(this).tap(warnIfMissed: warnIfMissed);

  Future<void> longPress() => TFinderCommand.auto(this).longPress();

  Future<void> drag(Offset offset) => TFinderCommand.auto(this).drag(offset);
}

extension ExtCommonFinders on CommonFinders {
  /// smart "get"
  Finder get(Object arg) {
    if (arg is Finder) return arg;
    if (arg is List) return byArray(arg.map((Object? e) => get(e!)).toList());
    return bySel(arg);
  }

  // ref
  // 1. cypress-realworld-app command: getBySel
  // 2. [CommonFinders.byTooltip]
  Finder bySel(Object name, {bool skipOffstage = true, bool Function(Object? markData)? predicate}) {
    var description = '$name';
    // hacky beautify things like [LoginMark.username]; only useful when code is not obfuscated
    if (_isEnum(name) && name.runtimeType.toString().endsWith('Mark')) {
      final cls = name.toString().split('.')[0];
      final modifiedCls = ReCase(cls.substring(0, cls.length - 'Mark'.length)).camelCase;
      description = '$modifiedCls#${describeEnum(name)}';
    }

    return byWidgetPredicate(
      // NOTE MarkCore, not Mark
      (widget) => widget is MarkCore && widget.name == name && (predicate?.call(widget.data) ?? true),
      description: description + (predicate == null ? '' : ' with extra predicate'),
      skipOffstage: skipOffstage,
    );
  }

  Finder byArray(List<Finder> finders) {
    assert(finders.isNotEmpty);

    final description = finders.map((f) => f.description).join(' -> ');

    var ans = finders[0];
    for (var i = 1; i < finders.length; i++) {
      ans = find.descendant(of: ans, matching: finders[i]);
    }
    ans = DelegatingFinder(ans, overrideDescription: description);

    return ans;
  }

  /// modified from [byTooltip]
  Finder myByTooltip(String message, {bool skipOffstage = true}) {
    return byWidgetPredicate(
      (Widget widget) => widget is Tooltip && widget.message == message,
      skipOffstage: skipOffstage,
      // NOTE XXX add
      description: 'Tooltip with `$message`',
    );
  }
}

class TFinderCommand extends TCommand {
  @protected
  final Finder finder;

  TFinderCommand(ConvenientTest t, this.finder) : super(t);

  TFinderCommand.auto(this.finder) : super.auto();

  @override
  Object? getCurrentActual() => finder;

  Future<void> enterText(String text) => act(
        act: () => t.tester.enterText(finder, text),
        logTitle: 'TYPE',
        logMessage: '"$text" to ${finder.description}',
      );

  Future<void> tap({bool warnIfMissed = true}) => act(
        act: () => t.tester.tap(finder, warnIfMissed: warnIfMissed),
        logTitle: 'TAP',
        logMessage: finder.description,
      );

  Future<void> longPress() => act(
        act: () => t.tester.longPress(finder),
        logTitle: 'LONG PRESS',
        logMessage: finder.description,
      );

  Future<void> drag(Offset offset) => act(
        act: () => t.tester.drag(finder, offset),
        logTitle: 'DRAG',
        logMessage: finder.description,
      );

  Future<void> act({
    required Future<void> Function() act,
    required String logTitle,
    required String logMessage,
  }) async {
    final log = t.log(logTitle, logMessage);

    await t.pump();
    await log.snapshot(name: 'before');

    // Firstly wait until the button is visible before tapping
    // ref https://docs.cypress.io/guides/core-concepts/retry-ability#Built-in-assertions
    await shouldRaw(
      findsOneWidget,
      logUpdate: (title, message, {error, stackTrace, required type, printing = false}) =>
          log.update('$logTitle ASSERT', message, type: type, error: error, stackTrace: stackTrace, printing: printing),
      logSnapshot: log.snapshot,
      // do not take snapshot if success - since we will do it later
      snapshotWhenSuccess: false,
    );
    // update log, since [should] will change logs
    unawaited(log.update(logTitle, logMessage, type: LogSubEntryType.GENERAL_MESSAGE));

    await act();

    await t.pumpAndSettle();

    await log.snapshot(name: 'after');
  }
}

class TRouteNameCommand extends TCommand {
  TRouteNameCommand(ConvenientTest t) : super(t);

  @override
  Object? getCurrentActual() {
    final context = myGetIt.get<ConvenientTestSlot>().getNavContext(t);
    if (context == null) return null;

    // https://stackoverflow.com/questions/50817086/how-to-check-which-the-current-route-is?rq=1
    late final Route<dynamic> currentRoute;
    Navigator.popUntil(context, (route) {
      currentRoute = route;
      return true;
    });
    return currentRoute.settings.name;
  }
}

class TRawCommand extends TCommand {
  final Object? value;

  TRawCommand(ConvenientTest t, this.value) : super(t);

  @override
  Object? getCurrentActual() => value;
}

// https://stackoverflow.com/questions/53924131/how-to-check-if-value-is-enum
bool _isEnum(dynamic data) {
  final split = data.toString().split('.');
  return split.length > 1 && split[0] == data.runtimeType.toString();
}
