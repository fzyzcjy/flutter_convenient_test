import 'dart:collection';
import 'dart:typed_data';

import 'package:convenient_test_common/convenient_test_common.dart';
import 'package:mobx/mobx.dart';

part 'log_store.g.dart';

class LogStore = _LogStore with _$LogStore;

abstract class _LogStore with Store {
  final logEntryInTest = RelationOneToMany();
  final testIdOfLogEntry = ObservableMap<int, int>();

  final logSubEntryInEntry = RelationOneToMany();
  final logEntryIdOfLogSubEntry = ObservableMap<int, int>();

  final logSubEntryMap = ObservableMap<int, LogSubEntry>();

  /// [LogSubEntry.time] => [LogSubEntry.id]
  final logSubEntryIdOfTime = SplayTreeMap<int, int>();

  /// `snapshotInLog[logEntryId][name] == snapshot bytes`
  final snapshotInLog = ObservableMap<int, ObservableMap<String, Uint8List>>();

  void addLogEntry({required int testEntryId, required int logEntryId, required List<LogSubEntry> subEntries}) {
    logSubEntryInEntry[logEntryId] ??= ObservableList();

    for (final subEntry in subEntries) {
      logSubEntryMap[subEntry.id] = subEntry;
      logSubEntryInEntry[logEntryId]!.add(subEntry.id);
      logEntryIdOfLogSubEntry[subEntry.id] = logEntryId;
      logSubEntryIdOfTime[subEntry.time.toInt()] = subEntry.id;
    }

    if (!(logEntryInTest[testEntryId]?.contains(logEntryId) ?? false)) {
      logEntryInTest.addRelation(testEntryId, logEntryId);
      testIdOfLogEntry[logEntryId] = testEntryId;
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
    final logSubEntryId = logSubEntryIdOfTime.lastKeyBefore(time.microsecondsSinceEpoch);
    if (logSubEntryId == null) return null;

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
