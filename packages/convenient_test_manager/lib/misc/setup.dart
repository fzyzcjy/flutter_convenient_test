import 'package:convenient_test_manager/services/misc_flutter_service.dart';
import 'package:convenient_test_manager/stores/highlight_store.dart';
import 'package:convenient_test_manager/stores/home_page_store.dart';
import 'package:convenient_test_manager/stores/video_player_store.dart';
import 'package:convenient_test_manager_dart/misc/setup.dart' as convenient_test_manager_dart_setup;
import 'package:convenient_test_manager_dart/services/misc_dart_service.dart';
import 'package:dart_vlc/dart_vlc.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setup() {
  convenient_test_manager_dart_setup.setup(
    registerMiscDartService: false,
  );

  DartVLC.initialize();

  getIt.registerSingleton<VideoPlayerStore>(VideoPlayerStore());
  getIt.registerSingleton<HighlightStore>(HighlightStore());
  getIt.registerSingleton<HomePageStore>(HomePageStore());

  final miscFlutterService = MiscFlutterService();
  getIt.registerSingleton<MiscDartService>(miscFlutterService);
  getIt.registerSingleton<MiscFlutterService>(miscFlutterService);
}
