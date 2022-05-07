import 'package:convenient_test_common/convenient_test_common.dart';
import 'package:convenient_test_manager/components/misc/video_player.dart';
import 'package:convenient_test_manager_dart/stores/log_store.dart';
import 'package:convenient_test_manager_dart/stores/video_player_store.dart';
import 'package:convenient_test_manager_dart/stores/video_recorder_store.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:tuple/tuple.dart';

part 'video_player_store.g.dart';

class VideoPlayerStore = _VideoPlayerStore with _$VideoPlayerStore;

abstract class _VideoPlayerStore extends VideoPlayerStoreBase with Store {
  final videoMap = ObservableMap<int, VideoInfo>();

  @observable
  int? activeVideoId;

  @computed
  VideoInfo? get activeVideo => videoMap[activeVideoId];

  @observable
  var displayRange = const Tuple2(Duration.zero, Duration.zero);

  final mainPlayerController = VideoPlayerController();

  Duration absoluteToVideoTime(DateTime absoluteTime) {
    final activeVideo = this.activeVideo;
    if (activeVideo == null) return Duration.zero;
    return absoluteTime.difference(activeVideo.startTime);
  }

  DateTime videoToAbsoluteTime(Duration videoTime) {
    final activeVideo = this.activeVideo;
    if (activeVideo == null) return DateTime.fromMicrosecondsSinceEpoch(0);
    return activeVideo.startTime.add(videoTime);
  }

  @observable
  int? playerPositionCorrespondingLogEntryId;

  void clear() {
    activeVideoId = null;
    videoMap.clear();
    playerPositionCorrespondingLogEntryId = null;
  }

  @override
  void handleRecorderFinished(VideoInfo info) {
    videoMap[IdGenerator.instance.nextId()] = info;
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
