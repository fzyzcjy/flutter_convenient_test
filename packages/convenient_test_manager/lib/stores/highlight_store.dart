import 'package:collection/collection.dart';
import 'package:convenient_test_common/convenient_test_common.dart';
import 'package:convenient_test_manager/stores/log_store.dart';
import 'package:convenient_test_manager/stores/suite_info_store.dart';
import 'package:convenient_test_manager/stores/video_store.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

part 'highlight_store.g.dart';

class HighlightStore = _HighlightStore with _$HighlightStore;

abstract class _HighlightStore with Store {
  static const _kTag = 'HighlightStore';
  @observable
  bool enableAutoExpand = true;

  /// key: [GroupEntryInfo].id
  final expandGroupEntryMap = ObservableDefaultMap<int, bool>(createDefaultValue: (_) => false);

  @action
  void expandSeriesForTest({required int testInfoId}) {
    final suiteInfoStore = GetIt.I.get<SuiteInfoStore>();

    for (final entryId in suiteInfoStore.suiteInfo!.ancestors(testInfoId)) {
      expandGroupEntryMap[entryId] = true;
    }
  }

  @observable
  int? highlightTestEntryId;

  @observable
  int? highlightLogEntryId;

  @observable
  String? highlightSnapshotName;

  @computed
  String? get effectiveActiveSnapshotName {
    if (highlightSnapshotName != null) return highlightSnapshotName;
    return _logStore.snapshotInLog[highlightLogEntryId]?.keys.firstOrNull;
  }

  void clear() {
    expandGroupEntryMap.clear();
    highlightTestEntryId = null;
    highlightLogEntryId = null;
    highlightSnapshotName = null;
  }

  _HighlightStore() {
    _setupSyncVideoPositionToHighlight();
  }

  void _setupSyncVideoPositionToHighlight() {
    reaction<int?>(
      (_) => GetIt.I.get<VideoStore>().playerPositionCorrespondingLogEntryId,
      (playerPositionCorrespondingLogEntryId) {
        if (playerPositionCorrespondingLogEntryId == null) return;
        Log.d(_kTag,
            'update highlight since playerPositionCorrespondingLogEntryId=$playerPositionCorrespondingLogEntryId');

        expandGroupEntryMap[TODO] = true;
        highlightTestEntryId = testEntryId;
        highlightLogEntryId = playerPositionCorrespondingLogEntryId;

        TODO;
      },
    );
  }

  final _logStore = GetIt.I.get<LogStore>();
}
