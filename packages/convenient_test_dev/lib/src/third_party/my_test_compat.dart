// ignore_for_file: implementation_imports, omit_local_variable_types, avoid_print, comment_references, parameter_assignments

import 'dart:async';

import 'package:convenient_test_common/convenient_test_common.dart';
import 'package:convenient_test_dev/src/functions/log.dart';
import 'package:convenient_test_dev/src/support/declarer.dart';
import 'package:convenient_test_dev/src/support/get_it.dart';
import 'package:convenient_test_dev/src/support/manager_rpc_service.dart';
import 'package:convenient_test_dev/src/utils/util.dart';
import 'package:test_api/src/backend/declarer.dart';
import 'package:test_api/src/backend/group.dart';
import 'package:test_api/src/backend/group_entry.dart';
import 'package:test_api/src/backend/invoker.dart';
import 'package:test_api/src/backend/live_test.dart';
import 'package:test_api/src/backend/message.dart';
import 'package:test_api/src/backend/runtime.dart';
import 'package:test_api/src/backend/state.dart';
import 'package:test_api/src/backend/suite.dart';
import 'package:test_api/src/backend/suite_platform.dart';
import 'package:test_api/src/backend/test.dart';

Declarer collectIntoDeclarer({required void Function() body, required int defaultRetry}) {
  // NOTE use MyDeclarer instead of Declarer
  return MyDeclarer(defaultRetry: defaultRetry)..declare(body);
}

/// NOTE XXX ref: [flutter_test :: test_compat.dart :: get _declarer ]
void runTestsInDeclarer(
  Declarer declarer, {
  required ShouldSkipPredicate shouldSkip,
  required void Function(Group) onGroupBuilt,
}) {
  Invoker.guard<Future<void>>(() async {
    final _Reporter reporter = _Reporter(color: false); // disable color when run directly.
    final Group group = declarer.build();
    onGroupBuilt(group);
    final Suite suite = Suite(group, SuitePlatform(Runtime.vm));
    await _runGroup(suite, group, <Group>[], reporter, shouldSkip);
    reporter._onDone();
  });
}

// NOTE MODIFIED added
typedef ShouldSkipPredicate = Future<bool> Function(GroupEntry entry);

/// NOTE XXX ref: [flutter_test :: test_compat.dart]
Future<void> _runGroup(
  Suite suiteConfig,
  Group group,
  List<Group> parents,
  _Reporter reporter,
  ShouldSkipPredicate shouldSkip,
) async {
  parents.add(group);
  try {
    final bool skipGroup = group.metadata.skip;
    bool setUpAllSucceeded = true;
    if (!skipGroup && group.setUpAll != null) {
      final LiveTest liveTest = group.setUpAll!.load(suiteConfig, groups: parents);
      await _runLiveTest(suiteConfig, liveTest, reporter, countSuccess: false);
      setUpAllSucceeded = liveTest.state.result.isPassing;
    }
    if (setUpAllSucceeded) {
      for (final GroupEntry entry in group.entries) {
        if (entry is Group) {
          await _runGroup(suiteConfig, entry, parents, reporter, shouldSkip);
        } else if (entry.metadata.skip || /* NOTE MODIFIED add "shouldSkip" */ await shouldSkip(entry)) {
          await _runSkippedTest(suiteConfig, entry as Test, parents, reporter);
        } else {
          final Test test = entry as Test;
          await _runLiveTest(suiteConfig, test.load(suiteConfig, groups: parents), reporter);
        }
      }
    }
    // Even if we're closed or setUpAll failed, we want to run all the
    // teardowns to ensure that any state is properly cleaned up.
    if (!skipGroup && group.tearDownAll != null) {
      final LiveTest liveTest = group.tearDownAll!.load(suiteConfig, groups: parents);
      await _runLiveTest(suiteConfig, liveTest, reporter, countSuccess: false);
    }
  } finally {
    parents.remove(group);
  }
}

/// NOTE XXX ref: [flutter_test :: test_compat.dart]
Future<void> _runLiveTest(Suite suiteConfig, LiveTest liveTest, _Reporter reporter, {bool countSuccess = true}) async {
  reporter._onTestStarted(liveTest);
  // Schedule a microtask to ensure that [onTestStarted] fires before the
  // first [LiveTest.onStateChange] event.
  await Future<void>.microtask(liveTest.run);
  // Once the test finishes, use await null to do a coarse-grained event
  // loop pump to avoid starving non-microtask events.
  await null;
  final bool isSuccess = liveTest.state.result.isPassing;
  if (isSuccess) {
    reporter.passed.add(liveTest);
  } else {
    reporter.failed.add(liveTest);
  }
}

/// NOTE XXX ref: [flutter_test :: test_compat.dart]
Future<void> _runSkippedTest(Suite suiteConfig, Test test, List<Group> parents, _Reporter reporter) async {
  final LocalTest skipped = LocalTest(test.name, test.metadata, () {}, trace: test.trace);
  if (skipped.metadata.skipReason != null) {
    print('Skip: ${skipped.metadata.skipReason}');
  }
  final LiveTest liveTest = skipped.load(suiteConfig);
  reporter._onTestStarted(liveTest);
  reporter.skipped.add(skipped);
}

/// NOTE XXX ref: [flutter_test :: test_compat.dart]
/// A reporter that prints each test on its own line.
///
/// This is currently used in place of [CompactReporter] by `lib/test.dart`,
/// which can't transitively import `dart:io` but still needs access to a runner
/// so that test files can be run directly. This means that until issue 6943 is
/// fixed, this must not import `dart:io`.
class _Reporter {
  _Reporter({bool color = true, bool printPath = true})
      : _printPath = printPath,
        _green = color ? '\u001b[32m' : '',
        _red = color ? '\u001b[31m' : '',
        _yellow = color ? '\u001b[33m' : '',
        _bold = color ? '\u001b[1m' : '',
        _noColor = color ? '\u001b[0m' : '';

  final List<LiveTest> passed = <LiveTest>[];
  final List<LiveTest> failed = <LiveTest>[];
  final List<Test> skipped = <Test>[];

  /// The terminal escape for green text, or the empty string if this is Windows
  /// or not outputting to a terminal.
  final String _green;

  /// The terminal escape for red text, or the empty string if this is Windows
  /// or not outputting to a terminal.
  final String _red;

  /// The terminal escape for yellow text, or the empty string if this is
  /// Windows or not outputting to a terminal.
  final String _yellow;

  /// The terminal escape for bold text, or the empty string if this is
  /// Windows or not outputting to a terminal.
  final String _bold;

  /// The terminal escape for removing test coloring, or the empty string if
  /// this is Windows or not outputting to a terminal.
  final String _noColor;

  /// Whether the path to each test's suite should be printed.
  final bool _printPath;

  /// A stopwatch that tracks the duration of the full run.
  final Stopwatch _stopwatch = Stopwatch();

  /// The size of `_engine.passed` last time a progress notification was
  /// printed.
  int? _lastProgressPassed;

  /// The size of `_engine.skipped` last time a progress notification was
  /// printed.
  int? _lastProgressSkipped;

  /// The size of `_engine.failed` last time a progress notification was
  /// printed.
  int? _lastProgressFailed;

  /// The message printed for the last progress notification.
  String? _lastProgressMessage;

  /// The suffix added to the last progress notification.
  String? _lastProgressSuffix;

  /// The set of all subscriptions to various streams.
  final Set<StreamSubscription<void>> _subscriptions = <StreamSubscription<void>>{};

  /// A callback called when the engine begins running [liveTest].
  void _onTestStarted(LiveTest liveTest) {
    if (!_stopwatch.isRunning) {
      _stopwatch.start();
    }

    _progressLine(_description(liveTest));
    _subscriptions.add(liveTest.onStateChange.listen((State state) => _onStateChange(liveTest, state)));
    _subscriptions
        .add(liveTest.onError.listen((AsyncError error) => _onError(liveTest, error.error, error.stackTrace)));
    _subscriptions.add(liveTest.onMessage.listen((Message message) {
      _progressLine(_description(liveTest));
      String text = message.text;
      if (message.type == MessageType.skip) {
        text = '  $_yellow$text$_noColor';
      }
      print(text);

      // NOTE XXX add
      myGetIt.get<ConvenientTestManagerClient>().reportSingle(ReportItem(
              runnerMessage: RunnerMessage(
            testName: liveTest.test.name,
            message: message.text,
          )));
    }));
  }

  /// A callback called when [liveTest]'s state becomes [state].
  void _onStateChange(LiveTest liveTest, State state) {
    // NOTE XXX add
    myGetIt.get<ConvenientTestManagerClient>().reportSingle(ReportItem(
            runnerStateChange: RunnerStateChange(
          testName: liveTest.test.name,
          state: state.toProto(),
        )));

    if (state.status != Status.complete) {
      return;
    }
  }

  /// A callback called when [liveTest] throws [error].
  void _onError(LiveTest liveTest, Object error, StackTrace stackTrace) {
    // NOTE XXX add
    myGetIt.get<ConvenientTestManagerClient>().reportSingle(ReportItem(
            runnerError: RunnerError(
          testName: liveTest.test.name,
          error: error.toString(),
          stackTrace: '$stackTrace',
        )));
    // print('hi _onError e.type=${error.runtimeType} error=$error');
    // print('hi _onError errors=${liveTest.errors}');
    convenientTestLog(
      'ERROR',
      '',
      error: error.toString(),
      stackTrace: '$stackTrace',
      liveTest: liveTest,
    );

    if (liveTest.state.status != Status.complete) {
      return;
    }
    _progressLine(_description(liveTest), suffix: ' $_bold$_red[E]$_noColor');
    print(_indent(error.toString()));
    print(_indent('$stackTrace'));
  }

  /// A callback called when the engine is finished running tests.
  void _onDone() {
    final bool success = failed.isEmpty;
    if (!success) {
      _progressLine('Some tests failed.', color: _red);
    } else if (passed.isEmpty) {
      _progressLine('All tests skipped.');
    } else {
      _progressLine('All tests passed!');
    }
  }

  /// Prints a line representing the current state of the tests.
  ///
  /// [message] goes after the progress report. If [color] is passed, it's used
  /// as the color for [message]. If [suffix] is passed, it's added to the end
  /// of [message].
  void _progressLine(String message, {String? color, String? suffix}) {
    // Print nothing if nothing has changed since the last progress line.
    if (passed.length == _lastProgressPassed &&
        skipped.length == _lastProgressSkipped &&
        failed.length == _lastProgressFailed &&
        message == _lastProgressMessage &&
        // Don't re-print just because a suffix was removed.
        (suffix == null || suffix == _lastProgressSuffix)) {
      return;
    }
    _lastProgressPassed = passed.length;
    _lastProgressSkipped = skipped.length;
    _lastProgressFailed = failed.length;
    _lastProgressMessage = message;
    _lastProgressSuffix = suffix;

    if (suffix != null) {
      message += suffix;
    }
    color ??= '';
    final Duration duration = _stopwatch.elapsed;
    final StringBuffer buffer = StringBuffer();

    // \r moves back to the beginning of the current line.
    buffer.write('${_timeString(duration)} ');
    buffer.write(_green);
    buffer.write('+');
    buffer.write(passed.length);
    buffer.write(_noColor);

    if (skipped.isNotEmpty) {
      buffer.write(_yellow);
      buffer.write(' ~');
      buffer.write(skipped.length);
      buffer.write(_noColor);
    }

    if (failed.isNotEmpty) {
      buffer.write(_red);
      buffer.write(' -');
      buffer.write(failed.length);
      buffer.write(_noColor);
    }

    buffer.write(': ');
    buffer.write(color);
    buffer.write(message);
    buffer.write(_noColor);

    print(buffer);
  }

  /// Returns a representation of [duration] as `MM:SS`.
  String _timeString(Duration duration) {
    final String minutes = duration.inMinutes.toString().padLeft(2, '0');
    final String seconds = (duration.inSeconds % 60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  /// Returns a description of [liveTest].
  ///
  /// This differs from the test's own description in that it may also include
  /// the suite's name.
  String _description(LiveTest liveTest) {
    String name = liveTest.test.name;
    if (_printPath && liveTest.suite.path != null) {
      name = '${liveTest.suite.path}: $name';
    }
    return name;
  }
}

String _indent(String string, {int? size, String? first}) {
  size ??= first == null ? 2 : first.length;
  return _prefixLines(string, ' ' * size, first: first);
}

String _prefixLines(String text, String prefix, {String? first, String? last, String? single}) {
  first ??= prefix;
  last ??= prefix;
  single ??= first;
  final List<String> lines = text.split('\n');
  if (lines.length == 1) {
    return '$single$text';
  }
  final StringBuffer buffer = StringBuffer('$first${lines.first}\n');
  // Write out all but the first and last lines with [prefix].
  for (final String line in lines.skip(1).take(lines.length - 2)) {
    buffer.writeln('$prefix$line');
  }
  buffer.write('$last${lines.last}');
  return buffer.toString();
}
