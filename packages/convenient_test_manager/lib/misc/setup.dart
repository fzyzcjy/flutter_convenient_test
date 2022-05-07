import 'package:convenient_test_manager/services/convenient_test_manager_service.dart';
import 'package:convenient_test_manager/services/misc_flutter_service.dart';
import 'package:convenient_test_manager/services/misc_service.dart';
import 'package:convenient_test_manager/services/report_handler_service.dart';
import 'package:convenient_test_manager/services/screen_video_recorder_service.dart';
import 'package:convenient_test_manager/services/vm_service_wrapper_service.dart';
import 'package:convenient_test_manager/stores/highlight_store.dart';
import 'package:convenient_test_manager/stores/home_page_store.dart';
import 'package:convenient_test_manager/stores/log_store.dart';
import 'package:convenient_test_manager/stores/raw_log_store.dart';
import 'package:convenient_test_manager/stores/suite_info_store.dart';
import 'package:convenient_test_manager/stores/video_store.dart';
import 'package:convenient_test_manager/stores/worker_mode_store.dart';
import 'package:dart_vlc/dart_vlc.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setup() {
  DartVLC.initialize();

  getIt.registerSingleton<LogStore>(LogStore());
  getIt.registerSingleton<SuiteInfoStore>(SuiteInfoStore());
  getIt.registerSingleton<RawLogStore>(RawLogStore());
  getIt.registerSingleton<WorkerModeStore>(WorkerModeStore());
  getIt.registerSingleton<VideoStore>(VideoStore());
  getIt.registerSingleton<HighlightStore>(HighlightStore());
  getIt.registerSingleton<ConvenientTestManagerService>(ConvenientTestManagerService());
  getIt.registerSingleton<VmServiceWrapperService>(VmServiceWrapperService());
  getIt.registerSingleton<HomePageStore>(HomePageStore());
  getIt.registerSingleton<ReportHandlerService>(ReportHandlerService());
  getIt.registerSingleton<ScreenVideoRecorderService>(ScreenVideoRecorderService.create());

  final miscFlutterService = MiscFlutterService();
  getIt.registerSingleton<MiscDartService>(miscFlutterService);
  getIt.registerSingleton<MiscFlutterService>(miscFlutterService);

  GetIt.I.get<ConvenientTestManagerService>().serve();
}
