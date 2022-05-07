import 'package:convenient_test_manager/components/misc/video_player.dart';
import 'package:convenient_test_manager_dart/stores/log_store.dart';
import 'package:convenient_test_manager_dart/stores/video_recorder_store.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:tuple/tuple.dart';

part 'video_player_store.g.dart';

class VideoPlayerStore = _VideoPlayerStore with _$VideoPlayerStore;

abstract class _VideoPlayerStore with Store {
  @observable
  VideoInfo? displayVideoInfo;

  @observable
  var displayRange = const Tuple2(Duration.zero, Duration.zero);

  final mainPlayerController = VideoPlayerController();

  Duration absoluteToVideoTime(DateTime absoluteTime) {
    final displayVideoInfo = this.displayVideoInfo;
    if (displayVideoInfo == null) return Duration.zero;
    return absoluteTime.difference(displayVideoInfo.startTime);
  }

  DateTime videoToAbsoluteTime(Duration videoTime) {
    final displayVideoInfo = this.displayVideoInfo;
    if (displayVideoInfo == null) return DateTime.fromMicrosecondsSinceEpoch(0);
    return displayVideoInfo.startTime.add(videoTime);
  }

  @observable
  int? playerPositionCorrespondingLogEntryId;

  void clear() {
    displayVideoInfo = null;
    playerPositionCorrespondingLogEntryId = null;
  }

  _VideoPlayerStore() {
    _setupSyncPlayerPositionCorrespondingLogEntryId();
  }

  void _setupSyncPlayerPositionCorrespondingLogEntryId() {
    mainPlayerController.positionStream.listen(_handlePositionStreamEvent);
  }

  void _handlePositionStreamEvent(Duration position) {
    final absoluteTime = videoToAbsoluteTime(position);
    final logEntryId = GetIt.I.get<LogStore>().calcLogEntryAtTime(absoluteTime);

    // this "if" will avoid unnecessary mobx updates
    if (logEntryId != playerPositionCorrespondingLogEntryId) playerPositionCorrespondingLogEntryId = logEntryId;
  }
}
