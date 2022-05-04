// ref: https://docs.cypress.io/api/cypress-api/cypress-log#Arguments

// ignore_for_file: implementation_imports
import 'package:convenient_test_common/convenient_test_common.dart';
import 'package:convenient_test_dev/src/functions/core.dart';
import 'package:convenient_test_dev/src/support/suite_info_converter.dart';
import 'package:convenient_test_dev/src/utils/snapshot.dart';
import 'package:convenient_test_dev/src/utils/util.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';
import 'package:test_api/src/backend/group.dart';
import 'package:test_api/src/backend/invoker.dart';
import 'package:test_api/src/backend/live_test.dart';

extension ConvenientTestLog on ConvenientTest {
  void section(String description) => log('SECTION', description, type: LogEntryType.SECTION);

  // p.s. can search emoji here - https://emojipedia.org
  LogHandle log(String title, String message, {LogEntryType? type}) => convenientTestLog(title, message, type: type);
}

LogHandle convenientTestLog(
  String title,
  String message, {
  LogEntryType? type,
  String? error,
  String? stackTrace,
  LiveTest? liveTest,
}) {
  type ??= LogEntryType.GENERAL_MESSAGE;
  liveTest ??= Invoker.current!.liveTest;

  final log = LogHandle(
    ConvenientTestIdGen.nextId(),
    SuiteInfoUtils.entryLocatorsFromLiveTest(liveTest),
  );

  log.update(
    title,
    message,
    type: type,
    error: error,
    stackTrace: stackTrace,
    printing: true, // <--
  );

  return log;
}

typedef LogUpdate = void Function(
  String title,
  String message, {
  String? error,
  String? stackTrace,
  required LogEntryType type,
  bool printing,
});
typedef LogSnapshot = Future<void> Function({
  String name,
});

class LogHandle {
  static const _kTag = 'LogHandle';

  final int _id;
  final List<String> _entryLocators;

  LogHandle(this._id, this._entryLocators);

  void update(
    String title,
    String message, {
    String? error,
    String? stackTrace,
    required LogEntryType type,
    bool printing = false,
  }) {
    GetIt.I.get<ConvenientTestManagerClient>().reportLogEntry(LogEntry(
          id: _id,
          entryLocators: _entryLocators,
          type: type,
          title: title,
          message: message,
          error: error,
          stackTrace: stackTrace,
        ));

    if (printing) {
      Log.i(_kTag, '${_typeToLeading(type)} $title $message $error $stackTrace');
    }
  }

  Future<void> snapshot({String name = 'default', List<int>? image}) async {
    image ??= await takeSnapshot();
    await GetIt.I.get<ConvenientTestManagerClient>().reportSnapshot(Snapshot(
          logEntryId: _id,
          name: name,
          image: image,
        ));
  }
}

String _typeToLeading(LogEntryType type) {
  switch (type) {
    case LogEntryType.TEST_START:
    case LogEntryType.TEST_END:
      return '🟤';
    case LogEntryType.GENERAL_MESSAGE:
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
    convenientTestLog('START', '', type: LogEntryType.TEST_START);
  });
  tearDown(() async {
    convenientTestLog('END', '', type: LogEntryType.TEST_END);
  });
}
