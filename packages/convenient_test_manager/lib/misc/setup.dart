import 'package:convenient_test_manager/services/convenient_test_manager_service.dart';
import 'package:convenient_test_manager/services/misc_service.dart';
import 'package:convenient_test_manager/services/report_handler_service.dart';
import 'package:convenient_test_manager/services/video_recorder_service.dart';
import 'package:convenient_test_manager/services/vm_service_wrapper_service.dart';
import 'package:convenient_test_manager/stores/home_page_store.dart';
import 'package:convenient_test_manager/stores/log_store.dart';
import 'package:convenient_test_manager/stores/organization_store.dart';
import 'package:convenient_test_manager/stores/raw_log_store.dart';
import 'package:convenient_test_manager/stores/suite_info_store.dart';
import 'package:convenient_test_manager/stores/worker_mode_store.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<LogStore>(LogStore());
  getIt.registerSingleton<OrganizationStore>(OrganizationStore());
  getIt.registerSingleton<SuiteInfoStore>(SuiteInfoStore());
  getIt.registerSingleton<RawLogStore>(RawLogStore());
  getIt.registerSingleton<WorkerModeStore>(WorkerModeStore());
  getIt.registerSingleton<ConvenientTestManagerService>(ConvenientTestManagerService());
  getIt.registerSingleton<VmServiceWrapperService>(VmServiceWrapperService());
  getIt.registerSingleton<MiscService>(MiscService());
  getIt.registerSingleton<HomePageStore>(HomePageStore());
  getIt.registerSingleton<ReportHandlerService>(ReportHandlerService());
  getIt.registerSingleton<VideoRecorderService>(VideoRecorderService.create());

  GetIt.I.get<ConvenientTestManagerService>().serve();
}
