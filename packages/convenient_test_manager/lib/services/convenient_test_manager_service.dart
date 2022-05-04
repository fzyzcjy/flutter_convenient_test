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
  Future<Empty> reportLogEntry(ServiceCall call, LogEntry request) async {
    Log.d(_kTag, 'reportLogEntry called');

    _logStore.logEntryMap.addToIdObjMap(request);

    final testGroupId = _organizationStore.testGroupNameToId(request.testGroupName);
    final testEntryId = _organizationStore.testEntryNameToId(request.testEntryName, testGroupId: testGroupId);

    if (!(_logStore.logEntryInTest[testEntryId]?.contains(request.id) ?? false)) {
      _logStore.logEntryInTest.addRelation(testEntryId, request.id);
    }

    if (_organizationStore.enableAutoExpand) {
      _organizationStore
        ..expandTestGroupMap.clear()
        ..expandTestGroupMap[testGroupId] = true
        ..expandTestEntryMap.clear()
        ..expandTestEntryMap[testEntryId] = true;
    }

    return Empty();
  }

  @override
  Future<Empty> reportRunnerError(ServiceCall call, RunnerError request) async {
    Log.d(_kTag, 'reportRunnerError called');

    _rawLogStore.rawLogInTest[_organizationStore.testEntryNameToId(request.testEntryName)] +=
        '${request.error}\n${request.stackTrace}\n';

    return Empty();
  }

  @override
  Future<Empty> reportRunnerMessage(ServiceCall call, RunnerMessage request) async {
    Log.d(_kTag, 'reportRunnerMessage called');

    _rawLogStore.rawLogInTest[_organizationStore.testEntryNameToId(request.testEntryName)] += '${request.message}\n';

    return Empty();
  }

  @override
  Future<Empty> reportRunnerStateChange(ServiceCall call, RunnerStateChange request) async {
    Log.d(_kTag, 'reportRunnerStateChange called name=${request.testEntryName} state=${request.state}');

    if (_kIgnoreTestEntryNames.contains(request.testEntryName)) return Empty();

    final testEntryId = _organizationStore.testEntryNameToId(request.testEntryName);
    _organizationStore.testEntryStateMap[testEntryId] = request.state;

    return Empty();
  }

  @override
  Future<Empty> reportSnapshot(ServiceCall call, Snapshot request) async {
    Log.d(_kTag, 'reportSnapshot called');

    _logStore.snapshotInLog[request.logEntryId] ??= ObservableMap();
    _logStore.snapshotInLog[request.logEntryId]![request.name] = request.image as Uint8List;

    return Empty();
  }

  @override
  Future<Empty> reportSuiteInfo(ServiceCall call, SuiteInfoProto request) async {
    Log.d(_kTag, 'reportSuiteInfo called');

    _suiteInfoStore.suiteInfo = SuiteInfo.fromProto(request);

    return Empty();
  }

  @override
  Future<Empty> resetManagerCache(ServiceCall call, Empty request) async {
    Log.d(_kTag, 'resetManagerCache called');

    _organizationStore.clear();
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

const _kIgnoreTestEntryNames = ['(tearDownAll)'];
