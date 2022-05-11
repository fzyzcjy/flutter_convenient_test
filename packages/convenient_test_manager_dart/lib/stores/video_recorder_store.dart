import 'dart:io';

import 'package:convenient_test_common_dart/convenient_test_common_dart.dart';
import 'package:convenient_test_manager_dart/services/fs_service.dart';
import 'package:convenient_test_manager_dart/services/screen_video_recorder_service.dart';
import 'package:convenient_test_manager_dart/stores/video_player_store.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';
import 'package:mobx/mobx.dart';

part 'video_recorder_store.g.dart';

class VideoRecorderStore = _VideoRecorderStore with _$VideoRecorderStore;

abstract class _VideoRecorderStore with Store {
  static const _kTag = 'VideoRecorderStore';

  @observable
  VideoInfo? recordingVideoInfo;

  void clear() {
    recordingVideoInfo = null;
  }

  @action
  Future<void> startRecord() async {
    final path = await _createVideoPath();
    recordingVideoInfo = VideoInfo(path: path, startTime: DateTime.now(), endTime: _kInvalidTime);

    Log.d(_kTag, 'startRecord call ScreenVideoRecorderService begin');
    await GetIt.I.get<ScreenVideoRecorderService>().startRecord(path);
    Log.d(_kTag, 'startRecord call ScreenVideoRecorderService end');
  }

  @action
  Future<void> stopRecord() async {
    if (recordingVideoInfo == null) {
      Log.i(_kTag, 'stopRecord skip since recordingVideoInfo==null');
      return;
    }

    Log.d(_kTag, 'stopRecord call ScreenVideoRecorderService begin');
    await GetIt.I.get<ScreenVideoRecorderService>().stopRecord();
    Log.d(_kTag, 'stopRecord call ScreenVideoRecorderService end');

    GetIt.I.get<VideoPlayerStoreBase>().handleRecorderFinished(VideoInfo(
          path: recordingVideoInfo!.path,
          startTime: recordingVideoInfo!.startTime,
          // the [recordingVideoInfo!.endTime] is dummy value
          endTime: DateTime.now(),
        ));

    recordingVideoInfo = null;
  }

  Future<String> _createVideoPath() async {
    final stem = DateFormat('yyyyMMdd_hhmmss').format(DateTime.now());
    final path =
        // ignore: prefer_interpolation_to_compose_strings
        await GetIt.I.get<FsService>().getActiveSuperRunDataSubDirectory(category: 'Video') + '$stem.mov';
    await File(path).parent.create(recursive: true);
    return path;
  }
}

final _kInvalidTime = DateTime.fromMicrosecondsSinceEpoch(-1);

@immutable
class VideoInfo {
  final String path;
  final DateTime startTime;
  final DateTime endTime;

  const VideoInfo({
    required this.path,
    required this.startTime,
    required this.endTime,
  });

  @override
  String toString() => 'VideoInfo{path: $path, startTime: $startTime, endTime: $endTime}';

  Duration absoluteToVideoTime(DateTime absoluteTime) => absoluteTime.difference(startTime);

  DateTime videoToAbsoluteTime(Duration videoTime) => startTime.add(videoTime);
}
