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
  static const _kTag = 'VideoPlayerStore';

  final videoMap = ObservableMap<int, VideoInfo>();

  @observable
  int? activeVideoId;

  @computed
  VideoInfo? get activeVideo => videoMap[activeVideoId];

  @observable
  var displayRange = const Tuple2(Duration.zero, Duration.zero);

  final mainPlayerController = VideoPlayerController();

  @observable
  int? playerPositionCorrespondingLogEntryId;

  void clear() {
    activeVideoId = null;
    videoMap.clear();
    playerPositionCorrespondingLogEntryId = null;
  }

  @override
  void handleRecorderFinished(VideoInfo info) {
    final id = IdGenerator.instance.nextId();
    Log.d(_kTag, 'handleRecorderFinished info=$info id=$id');
    videoMap[id] = info;
  }

  _VideoPlayerStore() {
    _setupSyncPlayerPositionCorrespondingLogEntryId();
  }

  void _setupSyncPlayerPositionCorrespondingLogEntryId() {
    mainPlayerController.positionStream.listen(_handlePositionStreamEvent);
  }

  void _handlePositionStreamEvent(Duration position) {
    final absoluteTime = activeVideo?.videoToAbsoluteTime(position) ??
        DateTime.fromMicrosecondsSinceEpoch(0);
    final logEntryId = GetIt.I.get<LogStore>().calcLogEntryAtTime(absoluteTime);

    // this "if" will avoid unnecessary mobx updates
    if (logEntryId != playerPositionCorrespondingLogEntryId) {
      playerPositionCorrespondingLogEntryId = logEntryId;
    }
  }
}

extension ExtObservableMapVideoInfo on ObservableMap<int, VideoInfo> {
  List<int> findVideosAtTimeRange(DateTime start, DateTime end) => entries
      .where((videoEntry) =>
          videoEntry.value.startTime.isBefore(end) &&
          videoEntry.value.endTime.isAfter(start))
      .map((videoEntry) => videoEntry.key)
      .toList();
}
