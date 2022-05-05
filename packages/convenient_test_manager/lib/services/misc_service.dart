import 'dart:io';

import 'package:convenient_test_common/convenient_test_common.dart';
import 'package:convenient_test_manager/services/report_handler_service.dart';
import 'package:convenient_test_manager/services/vm_service_wrapper_service.dart';
import 'package:convenient_test_manager/stores/highlight_store.dart';
import 'package:convenient_test_manager/stores/log_store.dart';
import 'package:convenient_test_manager/stores/organization_store.dart';
import 'package:convenient_test_manager/stores/raw_log_store.dart';
import 'package:convenient_test_manager/stores/suite_info_store.dart';
import 'package:convenient_test_manager/stores/video_store.dart';
import 'package:convenient_test_manager/stores/worker_mode_store.dart';
import 'package:file_picker/file_picker.dart';
import 'package:get_it/get_it.dart';

class MiscService {
  static const _kTag = 'MiscService';

  Future<void> hotRestartAndRunTests({required String filterNameRegex}) async {
    Log.d(_kTag, 'hotRestartAndRunTests filterNameRegex=$filterNameRegex');
    GetIt.I.get<WorkerModeStore>().activeWorkerMode =
        WorkerMode(integrationTest: WorkerModeIntegrationTest(filterNameRegex: filterNameRegex));
    await GetIt.I.get<VmServiceWrapperService>().hotRestart();
  }

  Future<void> hotRestartAndRunInAppMode() async {
    Log.d(_kTag, 'hotRestartAndRunInAppMode');
    GetIt.I.get<WorkerModeStore>().activeWorkerMode = WorkerMode(interactiveApp: WorkerModeInteractiveApp());
    await GetIt.I.get<VmServiceWrapperService>().hotRestart();
  }

  Future<void> reloadInfo() async {
    GetIt.I.get<HighlightStore>().enableAutoExpand = true;
    GetIt.I.get<WorkerModeStore>().activeWorkerMode =
        WorkerMode(integrationTest: WorkerModeIntegrationTest(filterNameRegex: kRegexMatchNothing));
    await GetIt.I.get<VmServiceWrapperService>().hotRestart();
  }

  void clearAll() {
    Log.d(_kTag, 'clearAll');

    GetIt.I.get<OrganizationStore>().clear();
    GetIt.I.get<SuiteInfoStore>().clear();
    GetIt.I.get<LogStore>().clear();
    GetIt.I.get<RawLogStore>().clear();
    GetIt.I.get<VideoStore>().clear();
    GetIt.I.get<HighlightStore>().clear();
  }

  Future<void> pickFileAndReadReport() async {
    final result = await FilePicker.platform.pickFiles(allowMultiple: true);
    if (result == null) return;

    final path = result.paths.single!;

    await readReportFromFile(path);
  }

  Future<void> readReportFromFile(String path) async {
    Log.d(_kTag, 'readReportFromFile start path=$path');

    clearAll();
    final reportCollection = ReportCollection.fromBuffer(await File(path).readAsBytes());
    await GetIt.I.get<ReportHandlerService>().handle(reportCollection, offlineFile: true);

    Log.d(_kTag, 'readReportFromFile end');
  }
}
