import 'dart:io';

import 'package:convenient_test_common_dart/convenient_test_common_dart.dart';
import 'package:convenient_test_manager_dart/services/report_handler_service.dart';
import 'package:convenient_test_manager_dart/services/vm_service_wrapper_service.dart';
import 'package:convenient_test_manager_dart/stores/log_store.dart';
import 'package:convenient_test_manager_dart/stores/raw_log_store.dart';
import 'package:convenient_test_manager_dart/stores/suite_info_store.dart';
import 'package:convenient_test_manager_dart/stores/video_recorder_store.dart';
import 'package:convenient_test_manager_dart/stores/worker_mode_store.dart';
import 'package:get_it/get_it.dart';

class MiscDartService {
  static const _kTag = 'MiscDartService';

  Future<void> hotRestartAndRunTests({required String filterNameRegex}) async {
    Log.d(_kTag, 'hotRestartAndRunTests filterNameRegex=$filterNameRegex');
    GetIt.I.get<WorkerModeStore>().activeWorkerMode =
        WorkerMode(integrationTest: WorkerModeIntegrationTest(filterNameRegex: filterNameRegex, reportSuiteInfo: TODO));
    await GetIt.I.get<VmServiceWrapperService>().hotRestart();
  }

  Future<void> hotRestartAndRunInAppMode() async {
    Log.d(_kTag, 'hotRestartAndRunInAppMode');
    GetIt.I.get<WorkerModeStore>().activeWorkerMode = WorkerMode(interactiveApp: WorkerModeInteractiveApp());
    await GetIt.I.get<VmServiceWrapperService>().hotRestart();
  }

  Future<void> reloadInfo() async {
    GetIt.I.get<WorkerModeStore>().activeWorkerMode = WorkerMode(
        integrationTest: WorkerModeIntegrationTest(filterNameRegex: kRegexMatchNothing, reportSuiteInfo: TODO));
    await GetIt.I.get<VmServiceWrapperService>().hotRestart();
  }

  void clearAll() {
    Log.d(_kTag, 'clearAll');

    GetIt.I.get<SuiteInfoStore>().clear();
    GetIt.I.get<LogStore>().clear();
    GetIt.I.get<RawLogStore>().clear();
    GetIt.I.get<VideoRecorderStore>().clear();
  }

  Future<void> readReportFromFile(String path) async {
    Log.d(_kTag, 'readReportFromFile start path=$path');

    clearAll();
    final reportCollection = ReportCollection.fromBuffer(await File(path).readAsBytes());
    await GetIt.I.get<ReportHandlerService>().handle(reportCollection, offlineFile: true);

    Log.d(_kTag, 'readReportFromFile end');
  }
}
