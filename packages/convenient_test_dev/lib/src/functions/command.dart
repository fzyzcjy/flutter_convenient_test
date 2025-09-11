import 'package:collection/collection.dart';
import 'package:convenient_test_common/convenient_test_common.dart';
import 'package:convenient_test_dev/convenient_test_dev.dart';
import 'package:convenient_test_dev/src/functions/descriptor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

// ignore: implementation_imports
import 'package:matcher/src/expect/async_matcher.dart';

abstract class TCommand {
  @protected
  final ConvenientTest t;

  // NOTE *SHOULD NOT* *save* the `actual`, but *SHOULD* *dynamically* read it when needed
  //      This is because we need retry-ability. For example, suppose `actual` is a String. Then
  //      if we save it, we will always get that initial same string no matter how we retry.
  @protected
  Future<Object?> getCurrentActual();

  @protected
  String? get overrideActualDescription => null;

  TCommand(this.t);

  TCommand.auto() : this(ConvenientTest.activeInstance);
}

extension ExtTCommand on TCommand {
  Future<void> should(Matcher matcher, {String? reason, bool? settle}) async {
    final log = t.log('ASSERT', '', type: LogSubEntryType.ASSERT);
    await shouldRaw(
      matcher,
      logUpdate: log.update,
      logSnapshot: log.snapshot,
      snapshotWhenSuccess: true,
      settle: settle,
    );
  }

  Future<void> shouldRaw(
    Matcher matcher, {
    String? reason,
    required LogUpdate logUpdate,
    required LogSnapshot logSnapshot,
    required bool snapshotWhenSuccess,
    bool? settle,
  }) => _expectWithRetry(
    t,
    getCurrentActual,
    matcher,
    overrideActualDescription: overrideActualDescription,
    reason: reason,
    logUpdate: logUpdate,
    logSnapshot: logSnapshot,
    snapshotWhenSuccess: snapshotWhenSuccess,
    settle: settle,
  );

  // syntax sugar
  Future<void> shouldEquals(dynamic expected, {String? reason}) =>
      should(equals(expected), reason: reason);
}

// NOTE "retry-ability" methodology, please see https://docs.cypress.io/guides/core-concepts/retry-ability
Future<void> _expectWithRetry(
  ConvenientTest t,
  Future<Object?> Function() actualGetter,
  Matcher matcher, {
  required String? overrideActualDescription,
  String? reason,
  dynamic skip,
  Duration timeout = const Duration(seconds: 4),
  required LogUpdate logUpdate,
  required LogSnapshot logSnapshot,
  required bool snapshotWhenSuccess,
  bool? settle,
}) async {
  final startTime = DateTime.now();
  var failedCount = 0;
  while (true) {
    // Why need log "update": Because `actualGetter` can change
    final logMessage = Descriptor().formatLogOfExpect(
      await actualGetter(),
      matcher,
      overrideActualDescription: overrideActualDescription,
    );
    logUpdate('ASSERT', logMessage, type: LogSubEntryType.ASSERT);

    final actual = await actualGetter();
    try {
      if (matcher is AsyncMatcher) {
        await expectLater(actual, matcher, reason: reason, skip: skip);
      } else {
        expect(actual, matcher, reason: reason, skip: skip);
      }

      // happens e.g. when golden test fails, see #179 for details
      final Object? caughtException = t.tester.takeException();
      if (caughtException != null) {
        // NOTE Must *NOT* be a `TestFailure`. Otherwise, consider an exception that happens only *once* but is
        // quite fatal. If we are throwing TestFailure, we will catch that in the nearby try-catch block.
        // Then, since the next retry succeeds, we wrongly thought everything is good, but indeed we have a fatal error.
        // https://github.com/fzyzcjy/yplusplus/issues/8472#issuecomment-1531438419
        throw Exception('See caught exception: $caughtException');
      }

      if (snapshotWhenSuccess) await logSnapshot(name: 'after');
      logUpdate(
        'ASSERT',
        logMessage,
        type: LogSubEntryType.ASSERT,
        printing: true,
      ); // #8484
      return;
    } on TestFailure catch (e, s) {
      Future<void> _logFailure(String message, {String? extraError}) async {
        logUpdate(
          'ASSERT',
          message,
          type: LogSubEntryType.ASSERT_FAIL,
          error: '$extraError$e\n${_getTestFailureErrorExtraInfo(actual)}',
          stackTrace: '$s',
          printing: true,
        );
        await logSnapshot(name: 'failed');
        await EnhancedLocalFileComparator.instance.lastFailure
            ?.dumpToLogSnapshot(logSnapshot);
      }

      failedCount++;

      final duration = DateTime.now().difference(startTime);
      if (duration >= timeout) {
        await _logFailure(
          'after $failedCount retries with ${duration.inMilliseconds} milliseconds, when $logMessage',
        );
        rethrow;
      }

      try {
        await t.tester.pumpAndMaybeSettleWithRunAsync(settle: settle);
      } catch (e) {
        await _logFailure('doing pump, when $logMessage', extraError: '$e\n');
        rethrow;
      }
    }
  }
}

String _getTestFailureErrorExtraInfo(dynamic actual) {
  if (actual is Finder) {
    // ref: [Finder.toString]
    final elements = actual.evaluate().toList();

    final bboxInfos = elements
        .map((element) {
          if (!element.debugIsActive) return null;
          final renderBox = element.findRenderObject();
          if (renderBox is! RenderBox || !renderBox.hasSize) return null;
          return renderBox.localToGlobal(Offset.zero) & renderBox.size;
        })
        .mapIndexed(
          (index, bbox) => '📦 Bounding box of element #$index: $bbox',
        )
        .join('\n\n');

    final ancestorInfos = elements
        .mapIndexed((index, element) {
          final reversedAncestors = [element];
          element.visitAncestorElements((ancestorElement) {
            reversedAncestors.add(ancestorElement);
            return true;
          });
          return '🌳 Ancestors of element #$index:\n'
              '${reversedAncestors.reversed.map((e) => '-> $e').join('\n')}';
        })
        .join('\n\n');

    return 'Extra info for matched elements: \n$bboxInfos\n$ancestorInfos';
  }
  return '';
}
