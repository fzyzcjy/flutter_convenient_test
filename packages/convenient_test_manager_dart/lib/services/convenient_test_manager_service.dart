import 'dart:async';

import 'package:convenient_test_common_dart/convenient_test_common_dart.dart';
import 'package:convenient_test_manager_dart/services/report_handler_service.dart';
import 'package:convenient_test_manager_dart/services/report_saver_service.dart';
import 'package:convenient_test_manager_dart/stores/worker_super_run_store.dart';
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
    await reportInner(request);
    return Empty();
  }

  /// [report()] but without a [ServiceCall]
  Future<void> reportInner(ReportCollection request) async {
    await GetIt.I.get<ReportHandlerService>().handle(request, offlineFile: false);

    // NOTE *first* handle by ReportHandlerService, *then* by ReportSaverService,
    //      because ReportHandlerService may let ReportSaverService change target file
    await GetIt.I.get<ReportSaverService>().save(request);
  }

  @override
  Future<WorkerCurrentRunConfig> getWorkerCurrentRunConfig(grpc.ServiceCall call, Empty request) async {
    final ans = _workerSuperRunStore.calcCurrentRunConfig();
    Log.d(_kTag,
        'getWorkerCurrentRunConfig ans=$ans currSuperRunController=${_workerSuperRunStore.currSuperRunController}');
    return ans;
  }

  static void _responseErrorHandler(Object? error, Object? stackTrace) {
    Log.e(_kTag, 'error when handling grpc requests. error=$error stack=$stackTrace');
  }

  final _workerSuperRunStore = GetIt.I.get<WorkerSuperRunStore>();
}
