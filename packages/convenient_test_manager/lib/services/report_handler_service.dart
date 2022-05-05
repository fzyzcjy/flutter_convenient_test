import 'dart:async';
import 'dart:typed_data';

import 'package:convenient_test_common/convenient_test_common.dart';
import 'package:convenient_test_manager/stores/log_store.dart';
import 'package:convenient_test_manager/stores/organization_store.dart';
import 'package:convenient_test_manager/stores/raw_log_store.dart';
import 'package:convenient_test_manager/stores/suite_info_store.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

class ReportHandlerService {
  static const _kTag = 'ReportHandlerService';

  Future<void> handle(ReportCollection reportCollection) async {
    for (final item in reportCollection.items) {
      await _handleItem(item);
    }
  }

  Future<void> _handleItem(ReportItem item) async {
    switch (item.whichSubType()) {
      case ReportItem_SubType.suiteInfoProto:
        return _handleSuiteInfoProto(item.suiteInfoProto);
      case ReportItem_SubType.logEntry:
        return _handleLogEntry(item.logEntry);
      case ReportItem_SubType.runnerStateChange:
        return _handleRunnerStateChange(item.runnerStateChange);
      case ReportItem_SubType.runnerError:
        return _handleRunnerError(item.runnerError);
      case ReportItem_SubType.runnerMessage:
        return _handleRunnerMessage(item.runnerMessage);
      case ReportItem_SubType.snapshot:
        return _handleSnapshot(item.snapshot);
      case ReportItem_SubType.notSet:
        throw Exception('unknown $item');
    }
  }

  Future<void> _handleLogEntry(LogEntry request) async {
    Log.d(_kTag, 'handleReportLogEntry called');

    final testEntryId = _suiteInfoStore.suiteInfo!.getEntryIdFromNames(request.entryLocators);
    if (testEntryId == null) return;

    for (final subEntry in request.subEntries) {
      _logStore.logSubEntryMap.addToIdObjMap(subEntry);
    }
    (_logStore.logSubEntryInEntry[request.id] ??= ObservableList())
        .addAll(request.subEntries.map((subEntry) => subEntry.id));
    _logStore.logEntryInTest.addRelation(testEntryId, request.id);

    if (_organizationStore.enableAutoExpand) {
      _organizationStore.expandGroupEntryMap.clear();
      for (var i = 1; i <= request.entryLocators.length; ++i) {
        _organizationStore.expandGroupEntryMap[
            _suiteInfoStore.suiteInfo!.getEntryIdFromNames(request.entryLocators.sublist(0, i))!] = true;
      }
    }
  }

  Future<void> _handleRunnerError(RunnerError request) async {
    Log.d(_kTag, 'handleReportRunnerError called');

    final testEntryId = _suiteInfoStore.suiteInfo?.getEntryIdFromNames(request.entryLocators);
    if (testEntryId == null) return;

    _rawLogStore.rawLogInTest[testEntryId] += '${request.error}\n${request.stackTrace}\n';
  }

  Future<void> _handleRunnerMessage(RunnerMessage request) async {
    Log.d(_kTag, 'handleReportRunnerMessage called');

    final testEntryId = _suiteInfoStore.suiteInfo?.getEntryIdFromNames(request.entryLocators);
    if (testEntryId == null) return;

    _rawLogStore.rawLogInTest[testEntryId] += '${request.message}\n';
  }

  Future<void> _handleRunnerStateChange(RunnerStateChange request) async {
    Log.d(_kTag, 'handleReportRunnerStateChange called entryLocators=${request.entryLocators} state=${request.state}');

    final testEntryId = _suiteInfoStore.suiteInfo?.getEntryIdFromNames(request.entryLocators);
    if (testEntryId == null) return;

    _organizationStore.testEntryStateMap[testEntryId] = request.state;
  }

  Future<void> _handleSnapshot(Snapshot request) async {
    Log.d(_kTag, 'handleReportSnapshot called');

    _logStore.snapshotInLog[request.logEntryId] ??= ObservableMap();
    _logStore.snapshotInLog[request.logEntryId]![request.name] = request.image as Uint8List;
  }

  Future<void> _handleSuiteInfoProto(SuiteInfoProto request) async {
    Log.d(_kTag, 'handleReportSuiteInfo called $request');

    _suiteInfoStore.suiteInfo = SuiteInfo.fromProto(request);
  }

  final _logStore = GetIt.I.get<LogStore>();
  final _organizationStore = GetIt.I.get<OrganizationStore>();
  final _suiteInfoStore = GetIt.I.get<SuiteInfoStore>();
  final _rawLogStore = GetIt.I.get<RawLogStore>();
}

extension<T> on Map<int, T> {
  void addToIdObjMap(T obj) {
    // ignore: avoid_dynamic_calls
    this[(obj as dynamic).id as int] = obj;
  }
}
