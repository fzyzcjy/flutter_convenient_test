import 'dart:async';

import 'package:convenient_test_common_dart/convenient_test_common_dart.dart';
import 'package:convenient_test_manager_dart/services/report_handler_service.dart';
import 'package:convenient_test_manager_dart/stores/worker_mode_store.dart';
import 'package:get_it/get_it.dart';
import 'package:grpc/grpc.dart' as grpc;
import 'package:grpc/grpc.dart';

class ConvenientTestManagerService extends ConvenientTestManagerServiceBase {
  static const _kTag = 'ConvenientTestManagerService';

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

  @override
  Future<Empty> report(ServiceCall call, ReportCollection request) async {
    await GetIt.I.get<ReportHandlerService>().handle(request, offlineFile: false);
    return Empty();
  }

  @override
  Future<WorkerMode> getWorkerMode(grpc.ServiceCall call, Empty request) async {
    Log.d(_kTag, 'getWorkerMode active=${_workerModeStore.activeWorkerMode}');
    return _workerModeStore.activeWorkerMode;
  }

  static void _responseErrorHandler(Object? error, Object? stackTrace) {
    Log.e(_kTag, 'error when handling grpc requests. error=$error stack=$stackTrace');
  }

  final _workerModeStore = GetIt.I.get<WorkerModeStore>();
}
