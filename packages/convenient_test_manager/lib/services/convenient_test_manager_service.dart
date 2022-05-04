import 'dart:async';
import 'dart:typed_data';

import 'package:convenient_test_common/convenient_test_common.dart';
import 'package:convenient_test_manager/stores/log_store.dart';
import 'package:convenient_test_manager/stores/organization_store.dart';
import 'package:convenient_test_manager/stores/raw_log_store.dart';
import 'package:convenient_test_manager/stores/suite_info_store.dart';
import 'package:convenient_test_manager/stores/worker_mode_store.dart';
import 'package:get_it/get_it.dart';
import 'package:grpc/grpc.dart' as grpc;
import 'package:grpc/grpc.dart';
import 'package:mobx/mobx.dart';

class ConvenientTestManagerService extends ConvenientTestManagerServiceBase {
  static const _kTag = 'ConvenientTestManagerService';

  final managerToWorkerActionStreamController = StreamController<ManagerToWorkerAction>.broadcast();

  void serve() {
    final server = grpc.Server(
      [this],
      const [],
      null,
      _responseErrorHandler,
    );
    server.serve(
      address: '0.0.0.0',
      port: kConvenientTestManagerPort,
    );
  }

  void dispose() {
    managerToWorkerActionStreamController.close();
  }

  @override
  Future<Empty> report(ServiceCall call, ReportCollection request) async {
    for (final item in request.items) {
      await _handleReportItem(item);
    }
    return Empty();
  }

  Future<void> _handleReportItem(ReportItem item) async {
    switch (item.whichSubType()) {
      case ReportItem_SubType.suiteInfoProto:
        return _handleReportSuiteInfoProto(item.suiteInfoProto);
      case ReportItem_SubType.logEntry:
        return _handleReportLogEntry(item.logEntry);
      case ReportItem_SubType.runnerStateChange:
        return _handleReportRunnerStateChange(item.runnerStateChange);
      case ReportItem_SubType.runnerError:
        return _handleReportRunnerError(item.runnerError);
      case ReportItem_SubType.runnerMessage:
        return _handleReportRunnerMessage(item.runnerMessage);
      case ReportItem_SubType.snapshot:
        return _handleReportSnapshot(item.snapshot);
      case ReportItem_SubType.notSet:
        throw Exception('unknown $item');
    }
  }

  Future<void> _handleReportLogEntry(LogEntry request) async {
    Log.d(_kTag, 'handleReportLogEntry called entryLocators=${request.entryLocators} message=${request.message}');

    _logStore.logEntryMap.addToIdObjMap(request);

    final testEntryId = _suiteInfoStore.suiteInfo!.getEntryIdFromNames(request.entryLocators);
    if (testEntryId == null) return;

    if (!(_logStore.logEntryInTest[testEntryId]?.contains(request.id) ?? false)) {
      _logStore.logEntryInTest.addRelation(testEntryId, request.id);
    }

    if (_organizationStore.enableAutoExpand) {
      _organizationStore.expandGroupEntryMap.clear();
      for (var i = 1; i <= request.entryLocators.length; ++i) {
        _organizationStore.expandGroupEntryMap[
            _suiteInfoStore.suiteInfo!.getEntryIdFromNames(request.entryLocators.sublist(0, i))!] = true;
      }
    }
  }

  Future<void> _handleReportRunnerError(RunnerError request) async {
    Log.d(_kTag, 'handleReportRunnerError called');

    final testEntryId = _suiteInfoStore.suiteInfo?.getEntryIdFromNames(request.entryLocators);
    if (testEntryId == null) return;

    _rawLogStore.rawLogInTest[testEntryId] += '${request.error}\n${request.stackTrace}\n';
  }

  Future<void> _handleReportRunnerMessage(RunnerMessage request) async {
    Log.d(_kTag, 'handleReportRunnerMessage called');

    final testEntryId = _suiteInfoStore.suiteInfo?.getEntryIdFromNames(request.entryLocators);
    if (testEntryId == null) return;

    _rawLogStore.rawLogInTest[testEntryId] += '${request.message}\n';
  }

  Future<void> _handleReportRunnerStateChange(RunnerStateChange request) async {
    Log.d(_kTag, 'handleReportRunnerStateChange called entryLocators=${request.entryLocators} state=${request.state}');

    final testEntryId = _suiteInfoStore.suiteInfo?.getEntryIdFromNames(request.entryLocators);
    if (testEntryId == null) return;

    _organizationStore.testEntryStateMap[testEntryId] = request.state;
  }

  Future<void> _handleReportSnapshot(Snapshot request) async {
    Log.d(_kTag, 'handleReportSnapshot called');

    _logStore.snapshotInLog[request.logEntryId] ??= ObservableMap();
    _logStore.snapshotInLog[request.logEntryId]![request.name] = request.image as Uint8List;
  }

  Future<void> _handleReportSuiteInfoProto(SuiteInfoProto request) async {
    Log.d(_kTag, 'handleReportSuiteInfo called $request');

    _suiteInfoStore.suiteInfo = SuiteInfo.fromProto(request);
  }

  @override
  Future<Empty> resetManagerCache(ServiceCall call, Empty request) async {
    Log.d(_kTag, 'resetManagerCache called');

    _organizationStore.clear();
    _suiteInfoStore.clear();
    _logStore.clear();
    _rawLogStore.clear();

    return Empty();
  }

  @override
  Stream<ManagerToWorkerAction> managerToWorkerActionStream(grpc.ServiceCall call, Empty request) async* {
    Log.d(_kTag, 'managerToWorkerActionStream called');

    yield* managerToWorkerActionStreamController.stream;
  }

  @override
  Future<WorkerMode> getWorkerMode(grpc.ServiceCall call, Empty request) async {
    Log.d(_kTag, 'getWorkerMode active=${_workerModeStore.activeWorkerMode}');
    return _workerModeStore.activeWorkerMode;
  }

  static void _responseErrorHandler(Object? error, Object? stackTrace) {
    Log.e(_kTag, 'error when handling grpc requests. error=$error stack=$stackTrace');
  }

  final _logStore = GetIt.I.get<LogStore>();
  final _organizationStore = GetIt.I.get<OrganizationStore>();
  final _suiteInfoStore = GetIt.I.get<SuiteInfoStore>();
  final _rawLogStore = GetIt.I.get<RawLogStore>();
  final _workerModeStore = GetIt.I.get<WorkerModeStore>();
}

extension<T> on Map<int, T> {
  void addToIdObjMap(T obj) {
    // ignore: avoid_dynamic_calls
    this[(obj as dynamic).id as int] = obj;
  }
}
