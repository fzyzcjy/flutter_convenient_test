import 'package:collection/collection.dart';
import 'package:convenient_test_common/convenient_test_common.dart';
import 'package:convenient_test_dev/src/functions/core.dart';
import 'package:convenient_test_dev/src/functions/descriptor.dart';
import 'package:convenient_test_dev/src/functions/goldens.dart';
import 'package:convenient_test_dev/src/functions/interaction.dart';
import 'package:convenient_test_dev/src/functions/log.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

// ignore: implementation_imports
import 'package:test_api/src/expect/async_matcher.dart';

abstract class TCommand {
  @protected
  final ConvenientTest t;

  // NOTE *SHOULD NOT* *save* the `actual`, but *SHOULD* *dynamically* read it when needed
  //      This is because we need retry-ability. For example, suppose `actual` is a String. Then
  //      if we save it, we will always get that initial same string no matter how we retry.
  @protected
  Object? getCurrentActual();

  @protected
  String? get overrideActualDescription => null;

  TCommand(this.t);

  TCommand.auto() : this(ConvenientTest.activeInstance);
}

extension ExtTCommand on TCommand {
  Future<void> should(Matcher matcher, {String? reason}) async {
    final log = t.log('ASSERT', '', type: LogSubEntryType.ASSERT);
    await shouldRaw(
      matcher,
      logUpdate: log.update,
      logSnapshot: log.snapshot,
      snapshotWhenSuccess: true,
    );
  }

  Future<void> shouldRaw(
    Matcher matcher, {
    String? reason,
    required LogUpdate logUpdate,
    required LogSnapshot logSnapshot,
    required bool snapshotWhenSuccess,
  }) =>
      _expectWithRetry(
        t,
        getCurrentActual,
        matcher,
        overrideActualDescription: overrideActualDescription,
        reason: reason,
        logUpdate: logUpdate,
        logSnapshot: logSnapshot,
        snapshotWhenSuccess: snapshotWhenSuccess,
      );

  // syntax sugar
  Future<void> shouldEquals(dynamic expected, {String? reason}) => should(equals(expected), reason: reason);
}

// NOTE "retry-ability" methodology, please see https://docs.cypress.io/guides/core-concepts/retry-ability
Future<void> _expectWithRetry(
  ConvenientTest t,
  ValueGetter<Object?> actualGetter,
  Matcher matcher, {
  required String? overrideActualDescription,
  String? reason,
  dynamic skip,
  Duration timeout = const Duration(seconds: 4),
  required LogUpdate logUpdate,
  required LogSnapshot logSnapshot,
  required bool snapshotWhenSuccess,
}) async {
  final startTime = DateTime.now();
  var failedCount = 0;
  while (true) {
    // Why need log "update": Because `actualGetter` can change
    // ignore: avoid_dynamic_calls
    logUpdate(
      'ASSERT',
      Descriptor().formatLogOfExpect(actualGetter(), matcher, overrideActualDescription: overrideActualDescription),
      type: LogSubEntryType.ASSERT,
    );

    final actual = actualGetter();
    try {
      if (matcher is AsyncMatcher) {
        await expectLater(actual, matcher, reason: reason, skip: skip);
      } else {
        expect(actual, matcher, reason: reason, skip: skip);
      }

      // happens e.g. when golden test fails, see #179 for details
      final Object? caughtException = t.tester.takeException();
      if (caughtException != null) {
        // TODO add more details like stacktrace after https://github.com/flutter/flutter/pull/103486 is implemented
        throw TestFailure('See caught exception: $caughtException');
      }

      if (snapshotWhenSuccess) await logSnapshot(name: 'after');
      return;
    } on TestFailure catch (e, s) {
      failedCount++;

      final duration = DateTime.now().difference(startTime);
      if (duration >= timeout) {
        logUpdate(
          'ASSERT',
          'after $failedCount retries with ${duration.inMilliseconds} milliseconds',
          type: LogSubEntryType.ASSERT_FAIL,
          error: '$e\n${_getTestFailureErrorExtraInfo(actual)}',
          stackTrace: '$s',
          printing: true,
        );
        await logSnapshot(name: 'failed');
        await EnhancedLocalFileComparator.instance.lastFailure?.dumpToLogSnapshot(logSnapshot);
        rethrow;
      }

      await t.pumpAndSettle();
      // TODO Not sure whether to add `Future.delayed`. Be careful: Future "delay" may be fake in test environment
    }
  }
}

String _getTestFailureErrorExtraInfo(dynamic actual) {
  if (actual is Finder) {
    // ref: [Finder.toString]
    final elements = actual.evaluate().toList();
    final info = elements.mapIndexed((index, Element element) {
      final reversedAncestors = [element];
      element.visitAncestorElements((ancestorElement) {
        reversedAncestors.add(ancestorElement);
        return true;
      });
      return '[Found Element #$index]\n'
          '${reversedAncestors.reversed.map((e) => '-> $e').join('\n')}';
    }).join('\n\n');
    return 'Extra Info: matched elements are:\n'
        '$info';
  }
  return '';
}
