import 'dart:async';

import 'package:convenient_test/convenient_test.dart';
import 'package:convenient_test_common/convenient_test_common.dart';
import 'package:convenient_test_dev/src/functions/command.dart';
import 'package:convenient_test_dev/src/functions/instance.dart';
import 'package:convenient_test_dev/src/functions/interaction.dart';
import 'package:convenient_test_dev/src/functions/log.dart';
import 'package:convenient_test_dev/src/functions/widget_controller.dart';
import 'package:convenient_test_dev/src/functions/widget_tester.dart';
import 'package:convenient_test_dev/src/support/element_hit_testable_matcher.dart';
import 'package:convenient_test_dev/src/support/get_it.dart';
import 'package:convenient_test_dev/src/support/slot.dart';
import 'package:convenient_test_dev/src/utils/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:recase/recase.dart';

extension ConvenientTestFind on ConvenientTest {
  TFinderCommand get(Object arg) => TFinderCommand(this, find.get(arg));

  TCommand routeName() => TRouteNameCommand(this);

  TRawCommand raw(Object value) => TRawCommand(this, value);

  TValueGetterCommand value(ValueGetter<Object?> valueGetter) =>
      TValueGetterCommand(this, valueGetter);

  TValueAsyncGetterCommand valueAsync(Future<Object?> Function() getter) =>
      TValueAsyncGetterCommand(this, getter);
}

extension ExtFinder on Finder {
  // forward methods

  Future<void> should(Matcher matcher, {String? reason, bool? settle}) =>
      TFinderCommand.auto(this).should(matcher, reason: reason, settle: settle);

  Future<void> replaceText(String text) =>
      TFinderCommand.auto(this).replaceText(text);

  Future<void> enterTextWithoutReplace(String text) =>
      TFinderCommand.auto(this).enterTextWithoutReplace(text);

  Future<void> tap({bool warnIfMissed = true, bool? settle}) =>
      TFinderCommand.auto(this).tap(warnIfMissed: warnIfMissed, settle: settle);

  Future<void> longPress({bool warnIfMissed = true, bool? settle}) =>
      TFinderCommand.auto(this)
          .longPress(warnIfMissed: warnIfMissed, settle: settle);

  Future<void> drag(Offset offset, {bool warnIfMissed = true, bool? settle}) =>
      TFinderCommand.auto(this)
          .drag(offset, warnIfMissed: warnIfMissed, settle: settle);

  Future<void> multiDrag({
    required Offset firstDownOffset,
    required Offset secondDownOffset,
    required List<Offset> firstFingerOffsets,
    required List<Offset> secondFingerOffsets,
    bool? logMove,
  }) =>
      TFinderCommand.auto(this).multiDrag(
        firstDownOffset: firstDownOffset,
        secondDownOffset: secondDownOffset,
        firstFingerOffsets: firstFingerOffsets,
        secondFingerOffsets: secondFingerOffsets,
        logMove: logMove,
      );
}

typedef ConvenientTestGetFinder = Finder Function(Object arg);

// ignore: avoid-global-state
ConvenientTestGetFinder convenientTestGetFinder = _defaultGetFinder;

Finder _defaultGetFinder(Object arg) {
  if (arg is Finder) return arg;
  if (arg is Type) return find.byType(arg);
  if (arg is List) {
    return find.byArray(arg.map((Object? e) => find.get(e!)).toList());
  }
  return find.bySel(arg);
}

extension ExtCommonFinders on CommonFinders {
  Finder root() => _RootFinder();

  /// smart "get"
  Finder get(Object arg) => convenientTestGetFinder(arg);

  // ref
  // 1. cypress-realworld-app command: getBySel
  // 2. [CommonFinders.byTooltip]
  Finder bySel(Object name,
      {bool skipOffstage = true, bool Function(Object? markData)? predicate}) {
    var description = '$name';
    // hacky beautify things like [LoginMark.username]; only useful when code is not obfuscated
    if (name is Enum && name.runtimeType.toString().endsWith('Mark')) {
      final cls = name.toString().split('.')[0];
      final modifiedCls =
          ReCase(cls.substring(0, cls.length - 'Mark'.length)).camelCase;
      description = '$modifiedCls#${name.name}';
    }

    return byWidgetPredicate(
      // NOTE MarkCore, not Mark
      (widget) =>
          widget is MarkCore &&
          widget.name == name &&
          (predicate?.call(widget.data) ?? true),
      description:
          description + (predicate == null ? '' : ' with extra predicate'),
      skipOffstage: skipOffstage,
    );
  }

  Finder byArray(List<Finder> finders) {
    assert(finders.isNotEmpty);

    var ans = finders[0];
    for (var i = 1; i < finders.length; i++) {
      ans = find.descendant(of: ans, matching: finders[i]);
    }
    ans = DelegatingFinder(
      ans,
      overrideDescribeMatch: (plurality) =>
          finders.map((f) => f.describeMatch(plurality)).join(' -> '),
    );

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

  TFinderCommand(super.t, this.finder);

  TFinderCommand.auto(this.finder) : super.auto();

  @override
  Future<Object?> getCurrentActual() async => finder;

  Future<void> replaceText(
    String text, {
    bool? settle,
  }) =>
      act(
        act: (log) => t.tester.enterText(finder, text),
        preCondition: null,
        logTitle: 'REPLACE TYPE',
        logMessage: '"$text" to ${finder.describeMatch(Plurality.one)}',
        settle: settle,
      );

  Future<void> enterTextWithoutReplace(
    String text, {
    bool? settle,
  }) {
    const logTitle = 'TYPE';
    final basicLogMessage = '"$text" to ${finder.describeMatch(Plurality.one)}';

    return act(
      act: (log) => t.tester.enterTextWithoutReplace(
        finder,
        text,
        logCallback: (oldValue, newValue) {
          log.update(
              logTitle, '$basicLogMessage (old text: "${oldValue.text}")');
        },
      ),
      preCondition: null,
      logTitle: logTitle,
      logMessage: basicLogMessage,
      settle: settle,
    );
  }

  Future<void> tap({
    bool warnIfMissed = true,
    bool? settle,
  }) =>
      act(
        act: (log) => t.tester.tap(finder, warnIfMissed: warnIfMissed),
        preCondition: warnIfMissed ? ElementHitTestableMatcher(t.tester) : null,
        logTitle: 'TAP',
        logMessage: finder.describeMatch(Plurality.one),
        settle: settle,
      );

  Future<void> tapAtAlignment(
    Alignment alignment, {
    bool warnIfMissed = true,
    bool? settle,
  }) =>
      act(
        act: (log) =>
            t.tester.tapAt(alignment.withinRect(t.tester.getRect(finder))),
        preCondition: warnIfMissed ? ElementHitTestableMatcher(t.tester) : null,
        logTitle: 'TAP',
        logMessage: finder.describeMatch(Plurality.one),
        settle: settle,
      );

  Future<void> longPress({
    bool warnIfMissed = true,
    bool? settle,
  }) =>
      act(
        act: (log) => t.tester.longPress(finder, warnIfMissed: warnIfMissed),
        preCondition: warnIfMissed ? ElementHitTestableMatcher(t.tester) : null,
        logTitle: 'LONG PRESS',
        logMessage: finder.describeMatch(Plurality.one),
        settle: settle,
      );

  Future<void> drag(
    Offset offset, {
    bool warnIfMissed = true,
    bool? settle,
  }) =>
      act(
        act: (log) => t.tester.drag(finder, offset, warnIfMissed: warnIfMissed),
        preCondition: warnIfMissed ? ElementHitTestableMatcher(t.tester) : null,
        logTitle: 'DRAG',
        logMessage: finder.describeMatch(Plurality.one),
        settle: settle,
      );

  Future<void> multiDrag({
    required Offset firstDownOffset,
    required Offset secondDownOffset,
    required List<Offset> firstFingerOffsets,
    required List<Offset> secondFingerOffsets,
    bool? logMove,
    bool? settle,
  }) =>
      act(
        act: (log) => t.tester.multiDrag(
          finder,
          firstDownOffset: firstDownOffset,
          secondDownOffset: secondDownOffset,
          firstFingerOffsets: firstFingerOffsets,
          secondFingerOffsets: secondFingerOffsets,
          afterMove:
              (logMove ?? false) ? (i) => log.snapshot(name: 'move #$i') : null,
        ),
        preCondition: null,
        logTitle: 'MULTI DRAG',
        logMessage: finder.describeMatch(Plurality.one),
        settle: settle,
      );

  Future<void> act({
    required Future<void> Function(LogHandle log) act,
    required Matcher? preCondition,
    required String logTitle,
    required String logMessage,
    bool? settle,
  }) async {
    final log = t.log(logTitle, logMessage);

    await t.pump();
    await log.snapshot(name: 'before');

    // Firstly wait until the button is visible before tapping
    // ref https://docs.cypress.io/guides/core-concepts/retry-ability#Built-in-assertions
    await shouldRaw(
      allOf(findsOneWidget, preCondition),
      logUpdate: (title, message,
              {error, stackTrace, required type, printing = false}) =>
          log.update('$logTitle ASSERT', message,
              type: type,
              error: error,
              stackTrace: stackTrace,
              printing: printing),
      logSnapshot: log.snapshot,
      // do not take snapshot if success - since we will do it later
      snapshotWhenSuccess: false,
      settle: settle,
    );
    // update log, since [should] will change logs
    unawaited(log.update(logTitle, logMessage,
        type: LogSubEntryType.GENERAL_MESSAGE));

    await act(log);

    try {
      await t.tester.pumpAndMaybeSettleWithRunAsync(settle: settle);
    } catch (e, s) {
      await log.update(logTitle, 'doing pump, when $logMessage',
          type: LogSubEntryType.ASSERT_FAIL,
          error: '$e',
          stackTrace: '$s',
          printing: true);
      await log.snapshot(name: 'failed');
      rethrow;
    }

    await log.snapshot(name: 'after');
  }
}

class TRouteNameCommand extends TCommand {
  TRouteNameCommand(super.t);

  @override
  Future<String?> getCurrentActual() async {
    final context = myGetIt.get<ConvenientTestSlot>().getNavContext(t);
    if (context == null) return null;

    // https://stackoverflow.com/questions/50817086/how-to-check-which-the-current-route-is?rq=1
    // it can be null, e.g. https://github.com/fzyzcjy/yplusplus/issues/9037#issuecomment-1573561445
    Route<dynamic>? currentRoute;
    Navigator.popUntil(context, (route) {
      currentRoute = route;
      return true;
    });
    return currentRoute?.settings.name;
  }

  @override
  String? get overrideActualDescription => 'route "${getCurrentActual()}"';
}

class TRawCommand extends TCommand {
  final Object? value;

  TRawCommand(super.t, this.value);

  @override
  Future<Object?> getCurrentActual() async => value;
}

class TValueGetterCommand extends TCommand {
  final ValueGetter<Object?> valueGetter;

  TValueGetterCommand(super.t, this.valueGetter);

  @override
  Future<Object?> getCurrentActual() async => valueGetter();
}

class TValueAsyncGetterCommand extends TCommand {
  final Future<Object?> Function() getter;

  TValueAsyncGetterCommand(super.t, this.getter);

  @override
  Future<Object?> getCurrentActual() => getter();
}

class _RootFinder extends Finder {
  _RootFinder();

  @override
  String get description => 'root widget';

  @override
  Iterable<Element> apply(Iterable<Element> candidates) => candidates.take(1);
}
