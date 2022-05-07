import 'package:convenient_test_manager_dart/services/convenient_test_manager_service.dart';
import 'package:convenient_test_manager_dart/services/misc_dart_service.dart';
import 'package:convenient_test_manager_dart/services/report_handler_service.dart';
import 'package:convenient_test_manager_dart/services/screen_video_recorder_service.dart';
import 'package:convenient_test_manager_dart/services/vm_service_wrapper_service.dart';
import 'package:convenient_test_manager_dart/stores/log_store.dart';
import 'package:convenient_test_manager_dart/stores/raw_log_store.dart';
import 'package:convenient_test_manager_dart/stores/suite_info_store.dart';
import 'package:convenient_test_manager_dart/stores/video_recorder_store.dart';
import 'package:convenient_test_manager_dart/stores/worker_mode_store.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setup({bool registerMiscDartService = true}) {
  getIt.registerSingleton<LogStore>(LogStore());
  getIt.registerSingleton<SuiteInfoStore>(SuiteInfoStore());
  getIt.registerSingleton<RawLogStore>(RawLogStore());
  getIt.registerSingleton<WorkerModeStore>(WorkerModeStore());
  getIt.registerSingleton<VideoRecorderStore>(VideoRecorderStore());
  getIt.registerSingleton<ConvenientTestManagerService>(ConvenientTestManagerService());
  getIt.registerSingleton<VmServiceWrapperService>(VmServiceWrapperService());
  getIt.registerSingleton<ReportHandlerService>(ReportHandlerService());
  getIt.registerSingleton<ScreenVideoRecorderService>(ScreenVideoRecorderService.create());

  if (registerMiscDartService) {
    getIt.registerSingleton<MiscDartService>(MiscDartService());
  }

  GetIt.I.get<ConvenientTestManagerService>().serve();
}
