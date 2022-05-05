import 'package:convenient_test_manager/components/misc/video_player.dart';
import 'package:convenient_test_manager/services/screen_video_recorder_service.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';
import 'package:path_provider/path_provider.dart';

part 'video_store.g.dart';

class VideoStore = _VideoStore with _$VideoStore;

abstract class _VideoStore with Store {
  @observable
  VideoInfo? recordingVideoInfo;

  @observable
  VideoInfo? displayVideoInfo;

  final mainPlayerController = VideoPlayerController();

  Duration absoluteToVideoTime(DateTime absoluteTime) {
    final displayVideoInfo = this.displayVideoInfo;
    if (displayVideoInfo == null) return Duration.zero;
    return absoluteTime.difference(displayVideoInfo.startTime);
  }

  void clear() {
    recordingVideoInfo = null;
    displayVideoInfo = null;
  }

  @action
  Future<void> startRecord() async {
    final path = await _createVideoPath();
    recordingVideoInfo = VideoInfo(path: path, startTime: DateTime.now());
    await GetIt.I.get<ScreenVideoRecorderService>().startRecord(path);
  }

  @action
  Future<void> stopRecord() async {
    await GetIt.I.get<ScreenVideoRecorderService>().stopRecord();
    displayVideoInfo = recordingVideoInfo;
    recordingVideoInfo = null;
  }

  Future<String> _createVideoPath() async {
    final stem = DateFormat('yyyyMMdd_hhmmss').format(DateTime.now());
    return '${(await getTemporaryDirectory()).path}/ConvenientTest_Video_$stem.mov';
  }
}

@immutable
class VideoInfo {
  final String path;
  final DateTime startTime;

  const VideoInfo({
    required this.path,
    required this.startTime,
  });

  @override
  String toString() => 'VideoInfo{path: $path, startTime: $startTime}';
}
