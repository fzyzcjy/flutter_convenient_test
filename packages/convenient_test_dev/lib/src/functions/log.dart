// ref: https://docs.cypress.io/api/cypress-api/cypress-log#Arguments

// ignore_for_file: implementation_imports
import 'dart:io';

import 'package:convenient_test_common/convenient_test_common.dart';
import 'package:convenient_test_dev/src/functions/instance.dart';
import 'package:convenient_test_dev/src/support/manager_rpc_service.dart';
import 'package:convenient_test_dev/src/support/static_config.dart';
import 'package:convenient_test_dev/src/utils/snapshot.dart';
import 'package:fixnum/fixnum.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:meta/meta.dart';
import 'package:test_api/src/backend/group.dart';
import 'package:test_api/src/backend/invoker.dart';
import 'package:test_api/src/backend/live_test.dart';

extension ConvenientTestLog on ConvenientTest {
  void section(String description) => log('SECTION', description, type: LogSubEntryType.SECTION);

  // p.s. can search emoji here - https://emojipedia.org
  LogHandle log(String title, String message, {LogSubEntryType? type}) => convenientTestLog(title, message, type: type);
}

LogHandle convenientTestLog(
  String title,
  String message, {
  LogSubEntryType? type,
  String? error,
  String? stackTrace,
  LiveTest? liveTest,
}) {
  final log = LogHandle.create(liveTest: liveTest);

  log.update(
    title,
    message,
    type: type ?? LogSubEntryType.GENERAL_MESSAGE,
    error: error,
    stackTrace: stackTrace,
    initial: true,
    printing: true, // <--
  );

  return log;
}

typedef LogUpdate = void Function(
  String title,
  String message, {
  String? error,
  String? stackTrace,
  required LogSubEntryType type,
  bool printing,
});
typedef LogSnapshot = Future<void> Function({
  String name,
  List<int>? image,
});

class LogHandle {
  static const _kTag = 'LogHandle';

  final int _id;
  final String _testName;

  LogHandle._(this._id, this._testName);

  factory LogHandle.create({
    LiveTest? liveTest,
  }) {
    return LogHandle._(
      IdGenerator.instance.nextId(),
      (liveTest ?? Invoker.current!.liveTest).test.name,
    );
  }

  Future<void> update(
    String title,
    String message, {
    String? error,
    String? stackTrace,
    LogSubEntryType type = LogSubEntryType.GENERAL_MESSAGE,
    bool printing = false,
    bool initial = false,
  }) async {
    if (printing) {
      Log.i(_kTag,
          '${_typeToLeading(type)} (#$_id, ${initial ? "create" : "update"}) $title $message $error $stackTrace');
    }

    final managerRpcService = ConvenientTestManagerRpcService.I;
    if (managerRpcService != null) {
      await managerRpcService.reportSingle(ReportItem(
          logEntry: LogEntry(
        id: _id.toInt64(),
        testName: _testName,
        subEntries: [
          LogSubEntry(
            id: IdGenerator.instance.nextId().toInt64(),
            type: type,
            time: Int64(DateTime.now().microsecondsSinceEpoch),
            title: title,
            message: message,
            error: error,
            stackTrace: stackTrace,
          ),
        ],
      )));
    }
  }

  Future<void> snapshot({String name = 'default', List<int>? image}) async {
    Future<List<int>> computeImage() async {
      final tester = ConvenientTest.maybeActiveInstance?.tester;
      return image ?? await _maybeRunAsync(tester, () => takeSnapshot(pumper: tester?.pump));
    }

    final managerRpcService = ConvenientTestManagerRpcService.I;
    if (managerRpcService != null) {
      await managerRpcService.reportSingle(ReportItem(
          snapshot: Snapshot(
        logEntryId: _id.toInt64(),
        name: name,
        image: await computeImage(),
      )));
    } else {
      if (StaticConfig.kVerbose) {
        final briefTime = DateTime.now().toLocal().toIso8601String().replaceAll(':', '').replaceAll('.', '-');
        final filename = 'convenient_test_debug_screenshots/debug_screenshot_${briefTime}_$name.png';
        File(filename).parent.createSync(recursive: true);
        File(filename).writeAsBytesSync(await computeImage());
        Log.i(_kTag, 'snapshot() saved file to disk at: $filename');
      } else {
        Log.i(_kTag, 'snapshot() is no-op; specify `${StaticConfig.kVerboseKey}` to save screenshots to disk.');
      }
    }
  }
}

Future<T> _maybeRunAsync<T extends Object>(WidgetTester? tester, Future<T> Function() f) async {
  if (tester == null) return await f();
  return (await tester.runAsync(f))!;
}

String _typeToLeading(LogSubEntryType type) {
  switch (type) {
    case LogSubEntryType.TEST_START:
    case LogSubEntryType.TEST_END:
      return '🟤';
    case LogSubEntryType.GENERAL_MESSAGE:
    default:
      return '🔵';
  }
}

String testGroupsToName(List<Group> testGroups) {
  return testGroups //
      .map((g) => g.name)
      .where((name) => name.isNotEmpty)
      .join('-');
}

// /// https://stackoverflow.com/questions/49138971/logging-large-strings-from-flutter
// void printWrapped(String text) {
//   final pattern = RegExp('.{1,800}'); // 800 is the size of each chunk
//   pattern.allMatches(text).forEach((match) => print(match.group(0))); // ignore: avoid_print
// }

@internal
void setUpLogTestStartAndEnd() {
  setUp(() async {
    convenientTestLog('START', '', type: LogSubEntryType.TEST_START);
  });
  tearDown(() async {
    convenientTestLog('END', '', type: LogSubEntryType.TEST_END);
  });
}
