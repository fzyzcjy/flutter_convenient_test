import 'package:convenient_test_manager_dart/services/fs_service.dart';
import 'package:convenient_test_manager_dart/services/screen_video_recorder_service.dart';
import 'package:convenient_test_manager_dart/stores/video_player_store.dart';
import 'package:convenient_test_manager_dart/utils/get_it_utils.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';
import 'package:mobx/mobx.dart';

part 'video_recorder_store.g.dart';

class VideoRecorderStore = _VideoRecorderStore with _$VideoRecorderStore;

abstract class _VideoRecorderStore with Store {
  @observable
  VideoInfo? recordingVideoInfo;

  void clear() {
    recordingVideoInfo = null;
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
    GetIt.I.getIfRegistered<VideoPlayerStoreBase>()?.handleRecorderFinished(recordingVideoInfo!);
    recordingVideoInfo = null;
  }

  Future<String> _createVideoPath() async {
    final stem = DateFormat('yyyyMMdd_hhmmss').format(DateTime.now());
    return '${await GetIt.I.get<FsService>().getTemporaryDirectory()}/ConvenientTest_Video_$stem.mov';
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

  Duration absoluteToVideoTime(DateTime absoluteTime) => absoluteTime.difference(startTime);

  DateTime videoToAbsoluteTime(Duration videoTime) => startTime.add(videoTime);
}
