import 'package:collection/collection.dart';
import 'package:convenient_test_common/convenient_test_common.dart';
import 'package:convenient_test_dev/src/functions/core.dart';
import 'package:convenient_test_dev/src/functions/interaction.dart';
import 'package:convenient_test_dev/src/functions/log.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

abstract class TCommand {
  @protected
  final ConvenientTest t;

  // NOTE *SHOULD NOT* *save* the `actual`, but *SHOULD* *dynamically* read it when needed
  //      This is because we need retry-ability. For example, suppose `actual` is a String. Then
  //      if we save it, we will always get that initial same string no matter how we retry.
  @protected
  Object? getCurrentActual();

  TCommand(this.t);
}

extension ExtTCommand on TCommand {
  Future<void> should(Matcher matcher, {String? reason}) async {
    final log = t.log('ASSERT', '', type: LogEntryType.ASSERT);
    await shouldRaw(matcher, logUpdate: log.update, logSnapshot: log.snapshot);
  }

  Future<void> shouldRaw(
    Matcher matcher, {
    String? reason,
    required LogUpdate logUpdate,
    required LogSnapshot? logSnapshot,
  }) =>
      _expectWithRetry(t, getCurrentActual, matcher, reason: reason, logUpdate: logUpdate, logSnapshot: logSnapshot);

  // syntax sugar
  Future<void> shouldEquals(dynamic expected, {String? reason}) => should(equals(expected), reason: reason);
}

// ignore: avoid_dynamic_calls
String _formatMatcher(dynamic matcher) => matcher.describe(StringDescription()).toString();

String _formatActual(dynamic actual) {
  if (actual is Finder) return actual.description;
  return actual.toString();
}

// NOTE "retry-ability" methodology, please see https://docs.cypress.io/guides/core-concepts/retry-ability
Future<void> _expectWithRetry(
  ConvenientTest t,
  ValueGetter<Object?> actualGetter,
  dynamic matcher, {
  String? reason,
  dynamic skip,
  Duration timeout = const Duration(seconds: 4),
  required LogUpdate logUpdate,
  required LogSnapshot? logSnapshot,
}) async {
  final startTime = DateTime.now();
  var failedCount = 0;
  while (true) {
    // Why need log "update": Because `actualGetter` can change
    // ignore: avoid_dynamic_calls
    logUpdate('ASSERT', '{${_formatActual(actualGetter())}} matches {${_formatMatcher(matcher)}}',
        type: LogEntryType.ASSERT);

    final actual = actualGetter();
    try {
      expect(actual, matcher, reason: reason, skip: skip);
      await logSnapshot?.call(name: 'after');
      return;
    } on TestFailure catch (e, s) {
      failedCount++;

      final duration = DateTime.now().difference(startTime);
      if (duration >= timeout) {
        logUpdate(
          'ASSERT',
          'after $failedCount retries with ${duration.inMilliseconds} milliseconds',
          type: LogEntryType.ASSERT_FAIL,
          error: '$e\n${_getTestFailureErrorExtraInfo(actual)}',
          stackTrace: '$s',
          printing: true,
        );
        await logSnapshot?.call(name: 'after');
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
      // ignore: prefer_interpolation_to_compose_strings
      return '[Found Element #$index]\n' + reversedAncestors.reversed.map((e) => '-> ${e.toString()}').join('\n');
    }).join('\n\n');
    // ignore: prefer_interpolation_to_compose_strings
    return 'Extra Info: matched elements are:\n' + info;
  }
  return '';
}
