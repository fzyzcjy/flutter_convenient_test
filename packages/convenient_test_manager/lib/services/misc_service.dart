import 'package:convenient_test_common/convenient_test_common.dart';
import 'package:convenient_test_manager/services/vm_service_wrapper_service.dart';
import 'package:convenient_test_manager/stores/organization_store.dart';
import 'package:convenient_test_manager/stores/worker_mode_store.dart';
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
    GetIt.I.get<OrganizationStore>().enableAutoExpand = true;
    GetIt.I.get<WorkerModeStore>().activeWorkerMode =
        WorkerMode(integrationTest: WorkerModeIntegrationTest(filterNameRegex: kRegexMatchNothing));
    await GetIt.I.get<VmServiceWrapperService>().hotRestart();
  }

  Future<void> readReportFromFile() async {
    TODO;
  }
}
