import 'package:convenient_test_manager_dart/stores/video_recorder_store.dart';

abstract class VideoPlayerStoreBase {
  void handleRecorderFinished(VideoInfo info);
}

class VideoPlayerStoreDummy implements VideoPlayerStoreBase {
  @override
  void handleRecorderFinished(VideoInfo info) {}
}
