import 'dart:io';

import 'package:convenient_test_common_dart/convenient_test_common_dart.dart';
import 'package:convenient_test_manager_dart/services/report_handler_service.dart';
import 'package:convenient_test_manager_dart/services/vm_service_wrapper_service.dart';
import 'package:convenient_test_manager_dart/stores/log_store.dart';
import 'package:convenient_test_manager_dart/stores/raw_log_store.dart';
import 'package:convenient_test_manager_dart/stores/suite_info_store.dart';
import 'package:convenient_test_manager_dart/stores/video_recorder_store.dart';
import 'package:convenient_test_manager_dart/stores/worker_super_run_store.dart';
import 'package:get_it/get_it.dart';

class MiscDartService {
  static const _kTag = 'MiscDartService';

  void hotRestartAndRunTests({required String filterNameRegex}) {
    Log.d(_kTag, 'hotRestartAndRunTests filterNameRegex=$filterNameRegex');
    GetIt.I.get<WorkerSuperRunStore>().setControllerIntegrationTest(filterNameRegex: filterNameRegex);
    GetIt.I.get<VmServiceWrapperService>().hotRestartThrottled();
  }

  void hotRestartAndRunInAppMode() {
    Log.d(_kTag, 'hotRestartAndRunInAppMode');
    GetIt.I.get<WorkerSuperRunStore>().setControllerInteractiveApp();
    GetIt.I.get<VmServiceWrapperService>().hotRestartThrottled();
  }

  void reloadInfo() {
    GetIt.I.get<WorkerSuperRunStore>().setControllerIntegrationTest(filterNameRegex: RegexUtils.kMatchNothing);
    GetIt.I.get<VmServiceWrapperService>().hotRestartThrottled();
  }

  void haltWorker() {
    GetIt.I.get<WorkerSuperRunStore>().setControllerHalt();
    GetIt.I.get<VmServiceWrapperService>().hotRestartThrottled();
  }

  void clearAll() {
    Log.d(_kTag, 'clearAll');

    GetIt.I.get<SuiteInfoStore>().clear();
    GetIt.I.get<LogStore>().clear();
    GetIt.I.get<RawLogStore>().clear();
    GetIt.I.get<VideoRecorderStore>().clear();
  }

  Future<void> readReportFromFile(String path, {bool sync = false, bool doClear = true}) async {
    Log.d(_kTag, 'readReportFromFile start path=$path');

    clearAll();
    final file = sync ? File(path).readAsBytesSync() : await File(path).readAsBytes();

    final reportCollection = ReportCollection.fromBuffer(file);

    Log.d(_kTag, 'readReportFromFile read reportCollection');
    await GetIt.I.get<ReportHandlerService>().handle(reportCollection, offlineFile: true, doClear: doClear);

    Log.d(_kTag, 'readReportFromFile end');
  }
}
