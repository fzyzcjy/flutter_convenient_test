import 'dart:typed_data';

import 'package:convenient_test_common/convenient_test_common.dart';
import 'package:mobx/mobx.dart';

part 'log_store.g.dart';

class LogStore = _LogStore with _$LogStore;

abstract class _LogStore with Store {
  final logEntryInTest = RelationOneToMany();
  final logSubEntryInEntry = RelationOneToMany();

  final logSubEntryMap = ObservableMap<int, LogSubEntry>();

  /// `snapshotInLog[logEntryId][name] == snapshot bytes`
  final snapshotInLog = ObservableMap<int, ObservableMap<String, Uint8List>>();

  Iterable<int> logSubEntryInTest(int testInfoId) =>
      (logEntryInTest[testInfoId] ?? <int>[]).expand((logEntryId) => logSubEntryInEntry[logEntryId] ?? <int>[]);

  bool isTestFlaky(int testInfoId) =>
      // If see multiple TEST_START, then this test is flaky
      logSubEntryInTest(testInfoId)
          .where((logSubEntryId) => logSubEntryMap[logSubEntryId]?.type == LogSubEntryType.TEST_START)
          .length >
      1;

  int calcLogEntryAtTime(DateTime time) {
    return TODO;
  }

  void clear() {
    logEntryInTest.clear();
    logSubEntryInEntry.clear();
    logSubEntryMap.clear();
    snapshotInLog.clear();
  }
}
