import 'package:convenient_test_manager/services/fs_service.dart';
import 'package:convenient_test_manager/services/misc_flutter_service.dart';
import 'package:convenient_test_manager/stores/golden_diff_page_store.dart';
import 'package:convenient_test_manager/stores/highlight_store.dart';
import 'package:convenient_test_manager/stores/home_page_store.dart';
import 'package:convenient_test_manager/stores/video_player_store.dart';
import 'package:convenient_test_manager_dart/misc/setup.dart' as convenient_test_manager_dart_setup;
import 'package:convenient_test_manager_dart/services/fs_service.dart';
import 'package:convenient_test_manager_dart/services/misc_dart_service.dart';
import 'package:convenient_test_manager_dart/stores/highlight_store.dart';
import 'package:convenient_test_manager_dart/stores/video_player_store.dart';
import 'package:dart_vlc/dart_vlc.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> setup({
  bool registerVmServiceWrapper = true,
  bool parseConfigFile = true,
  bool initVLC = true,
}) async {
  await convenient_test_manager_dart_setup.setup(
    registerMiscDartService: false,
    registerFsService: false,
    registerHighlightStoreBase: false,
    registerVideoPlayerStoreBase: false,
    registerVmServiceWrapper: registerVmServiceWrapper,
    parseConfigFile: parseConfigFile,
  );

  if (initVLC) DartVLC.initialize();

  getIt.registerSingleton<VideoPlayerStore>(VideoPlayerStore());
  getIt.registerSingleton<HighlightStore>(HighlightStore());
  getIt.registerSingleton<HomePageStore>(HomePageStore());
  getIt.registerSingleton<GoldenDiffPageStore>(GoldenDiffPageStore());
  getIt.registerSingleton<FsService>(FsServiceFlutter());
  getIt.registerSingleton<MiscFlutterService>(MiscFlutterService());

  getIt.registerSingleton<HighlightStoreBase>(GetIt.I.get<HighlightStore>());
  getIt.registerSingleton<VideoPlayerStoreBase>(GetIt.I.get<VideoPlayerStore>());
  getIt.registerSingleton<MiscDartService>(GetIt.I.get<MiscFlutterService>());
}
