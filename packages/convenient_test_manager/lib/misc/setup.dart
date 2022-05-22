import 'dart:io';

import 'package:convenient_test_common/convenient_test_common.dart';
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
import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:window_size/window_size.dart' as window_size;

final getIt = GetIt.instance;

Future<void> setup() async {
  await convenient_test_manager_dart_setup.setup(
    registerMiscDartService: false,
    registerFsService: false,
    registerHighlightStoreBase: false,
    registerVideoPlayerStoreBase: false,
  );

  await DartVLC.initialize();

  await _setWindowSize();

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

Future<void> _setWindowSize() async {
  const _kTag = 'setWindowSize';

  WidgetsFlutterBinding.ensureInitialized();

  // #222
  // https://github.com/flutter/flutter/issues/30736#issuecomment-706977876
  final window = await window_size.getWindowInfo();
  final screen = window.screen;
  Log.d(_kTag, 'window=${window.customToString()} screen=${screen?.customToString()}');
  if (screen != null) {
    const width = 1350.0;
    const height = 1000.0;

    final screenFrame = screen.visibleFrame;
    final left = ((screenFrame.width - width) / 2).roundToDouble();
    final top = ((screenFrame.height - height) / 3).roundToDouble();
    final frame = Rect.fromLTWH(left, top, width, height);
    window_size.setWindowFrame(frame);
    window_size.setWindowMinSize(const Size(width, height));
    window_size.setWindowMaxSize(const Size(width, height));
    window_size.setWindowTitle('System Network Proxy (${Platform.operatingSystem})');
  }
}

extension on window_size.PlatformWindow {
  String customToString() => 'PlatformWindow{frame: $frame, scaleFactor: $scaleFactor, screen: $screen}';
}

extension on window_size.Screen {
  String customToString() => 'Screen{frame: $frame, visibleFrame: $visibleFrame, scaleFactor: $scaleFactor}';
}
