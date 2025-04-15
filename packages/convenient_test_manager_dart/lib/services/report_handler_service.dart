import 'dart:async';
import 'dart:typed_data';

import 'package:convenient_test_common_dart/convenient_test_common_dart.dart';
import 'package:convenient_test_manager_dart/services/misc_dart_service.dart';
import 'package:convenient_test_manager_dart/services/report_saver_service.dart';
import 'package:convenient_test_manager_dart/stores/highlight_store.dart';
import 'package:convenient_test_manager_dart/stores/log_store.dart';
import 'package:convenient_test_manager_dart/stores/raw_log_store.dart';
import 'package:convenient_test_manager_dart/stores/suite_info_store.dart';
import 'package:convenient_test_manager_dart/stores/video_recorder_store.dart';
import 'package:convenient_test_manager_dart/stores/worker_super_run_store.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

class ReportHandlerService {
  static const _kTag = 'ReportHandlerService';

  /// handle a report sent by the worker.
  /// doClear: if handleSuiteInfoProto should clear the already known suite info.
  /// set to false on widget tests.
  Future<void> handle(
    ReportCollection reportCollection, {
    required bool offlineFile,
    bool doClear = true,
  }) async {
    for (final item in reportCollection.items) {
      await _handleItem(item, offlineFile: offlineFile, doClear: doClear);
    }
  }

  Future<void> _handleItem(ReportItem item,
      {required bool offlineFile, required bool doClear}) async {
    switch (item.whichSubType()) {
      case ReportItem_SubType.setUpAll:
        return _handleSetUpAll(item.setUpAll, offlineFile: offlineFile);
      case ReportItem_SubType.tearDownAll:
        return _handleTearDownAll(item.tearDownAll, offlineFile: offlineFile);
      case ReportItem_SubType.suiteInfoProto:
        return _handleSuiteInfoProto(item.suiteInfoProto, doClear: doClear);
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

  Future<void> _handleSetUpAll(SetUpAll request,
      {required bool offlineFile}) async {
    Log.d(_kTag, 'SetUpAll $request');

    if (!offlineFile) await GetIt.I.get<VideoRecorderStore>().startRecord();
  }

  Future<void> _handleTearDownAll(TearDownAll request,
      {required bool offlineFile}) async {
    Log.d(_kTag, 'TearDownAll $request');

    if (!offlineFile) await GetIt.I.get<VideoRecorderStore>().stopRecord();

    GetIt.I
        .get<WorkerSuperRunStore>()
        .currSuperRunController
        .handleTearDownAll(request.resolvedExecutionFilter);
  }

  Future<void> _handleLogEntry(LogEntry request) async {
    Log.d(_kTag, 'handleReportLogEntry called');

    final testEntryId =
        _suiteInfoStore.suiteInfo?.getEntryIdFromName(request.testName);
    if (testEntryId == null) {
      Log.i(_kTag,
          'handleReportLogEntry skipped since getEntryIdFromName failed');
      return;
    }

    final requestId = request.id.toInt();
    _logStore.addLogEntry(
        testEntryId: testEntryId,
        logEntryId: requestId,
        subEntries: request.subEntries);

    GetIt.I
        .get<HighlightStoreBase>()
        .handleLogEntry(testEntryId: testEntryId, logEntryId: requestId);
  }

  Future<void> _handleRunnerError(RunnerError request) async {
    Log.d(_kTag, 'Error: ${request.error} stack=${request.stackTrace}');

    final testEntryId =
        _suiteInfoStore.suiteInfo?.getEntryIdFromName(request.testName);
    if (testEntryId == null) return;

    _rawLogStore.rawLogInTest[testEntryId] +=
        '${request.error}\n${request.stackTrace}\n';
  }

  Future<void> _handleRunnerMessage(RunnerMessage request) async {
    Log.d(_kTag, 'Message: ${request.message}');

    final testEntryId =
        _suiteInfoStore.suiteInfo?.getEntryIdFromName(request.testName);
    if (testEntryId == null) return;

    _rawLogStore.rawLogInTest[testEntryId] += '${request.message}\n';
  }

  Future<void> _handleRunnerStateChange(RunnerStateChange request) async {
    Log.d(_kTag,
        'StateChange: testName=${request.testName} state=${request.state}');

    final testEntryId =
        _suiteInfoStore.suiteInfo?.getEntryIdFromName(request.testName);
    if (testEntryId == null) return;

    _suiteInfoStore.testEntryStateMap[testEntryId] = request.state;
  }

  Future<void> _handleSnapshot(Snapshot request) async {
    Log.d(_kTag, 'Snapshot');

    final logEntryId = request.logEntryId.toInt();
    _logStore.snapshotInLog[logEntryId] ??= ObservableMap();
    _logStore.snapshotInLog[logEntryId]![request.name] =
        request.image as Uint8List;
  }

  Future<void> _handleSuiteInfoProto(SuiteInfoProto request,
      {required bool doClear}) async {
    Log.d(_kTag, 'handleReportSuiteInfo called $request');

    Log.d(_kTag, 'handleReportSuiteInfo thus MiscDartService.clearAll');
    GetIt.I.get<MiscDartService>().clearAll();

    // in case data from previous super-run are logged into current run
    if (doClear) {
      Log.d(_kTag, 'handleReportSuiteInfo thus ReportSaverService.clear');
      await GetIt.I.get<ManagerReportSaverService>().clear();
    }

    Log.d(_kTag, 'handleReportSuiteInfo set new suitInfo');
    _suiteInfoStore.suiteInfo = SuiteInfo.fromProto(request);
  }

  final _logStore = GetIt.I.get<LogStore>();
  final _suiteInfoStore = GetIt.I.get<SuiteInfoStore>();
  final _rawLogStore = GetIt.I.get<RawLogStore>();
}
