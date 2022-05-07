import 'dart:collection';
import 'dart:typed_data';

import 'package:convenient_test_common_dart/convenient_test_common_dart.dart';
import 'package:mobx/mobx.dart';

part 'log_store.g.dart';

class LogStore = _LogStore with _$LogStore;

abstract class _LogStore with Store {
  final logEntryInTest = RelationOneToMany<String>();
  final testIdOfLogEntry = ObservableMap<String, int>();

  final logSubEntryInEntry = RelationOneToMany<int>();
  final logEntryIdOfLogSubEntry = ObservableMap<int, int>();

  final logSubEntryMap = ObservableMap<int, LogSubEntry>();

  /// [LogSubEntry.time] => [LogSubEntry.id]
  final logSubEntryIdOfTime = SplayTreeMap<int, int>();

  /// `snapshotInLog[logEntryId][name] == snapshot bytes`
  final snapshotInLog = ObservableMap<int, ObservableMap<String, Uint8List>>();

  void addLogEntry({required String testName, required int logEntryId, required List<LogSubEntry> subEntries}) {
    logSubEntryInEntry[logEntryId] ??= ObservableList();

    for (final subEntry in subEntries) {
      final subEntryId = subEntry.id.toInt();
      logSubEntryMap[subEntryId] = subEntry;
      logSubEntryInEntry[logEntryId]!.add(subEntryId);
      logEntryIdOfLogSubEntry[subEntryId] = logEntryId;
      logSubEntryIdOfTime[subEntry.time.toInt()] = subEntryId;
    }

    if (!(logEntryInTest[testName]?.contains(logEntryId) ?? false)) {
      logEntryInTest.addRelation(testName, logEntryId);
      testIdOfLogEntry[logEntryId] = testName;
    }
  }

  Iterable<int> logSubEntryInTest(int testInfoId) =>
      (logEntryInTest[testInfoId] ?? <int>[]).expand((logEntryId) => logSubEntryInEntry[logEntryId] ?? <int>[]);

  bool isTestFlaky(int testInfoId) =>
      // If see multiple TEST_START, then this test is flaky
      logSubEntryInTest(testInfoId)
          .where((logSubEntryId) => logSubEntryMap[logSubEntryId]?.type == LogSubEntryType.TEST_START)
          .length >
      1;

  int? calcLogEntryAtTime(DateTime time) {
    final interestKey = logSubEntryIdOfTime.lastKeyBefore(time.microsecondsSinceEpoch);
    if (interestKey == null) return null;

    final logSubEntryId = logSubEntryIdOfTime[interestKey];
    final logEntryId = logEntryIdOfLogSubEntry[logSubEntryId];

    return logEntryId;
  }

  void clear() {
    logEntryInTest.clear();
    logSubEntryInEntry.clear();
    logSubEntryMap.clear();
    snapshotInLog.clear();
  }
}
