import 'package:collection/collection.dart';
import 'package:convenient_test_common/convenient_test_common.dart';
import 'package:convenient_test_manager/stores/home_page_store.dart';
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

  @observable
  bool enableHoverMode = true;

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
    _setupMakeHighlightLogEntryVisible();
  }

  void _setupSyncVideoPositionToHighlight() {
    final videoStore = GetIt.I.get<VideoStore>();

    reaction<int?>(
      (_) => videoStore.playerPositionCorrespondingLogEntryId,
      _handlePlayerPositionCorrespondingLogEntryIdChange,
    );
  }

  void _handlePlayerPositionCorrespondingLogEntryIdChange(int? logEntryId) {
    final logStore = GetIt.I.get<LogStore>();

    if (logEntryId == null) return;
    Log.d(_kTag, 'update highlight since playerPositionCorrespondingLogEntryId=$logEntryId');

    final testEntryId = logStore.testIdOfLogEntry[logEntryId]!;
    expandSeriesForTest(testInfoId: testEntryId);
    highlightTestEntryId = testEntryId;
    highlightLogEntryId = logEntryId;
  }

  void _setupMakeHighlightLogEntryVisible() {
    reaction<int?>(
      (_) => highlightLogEntryId,
      _handleHighlightLogEntryIdChange,
    );
  }

  void _handleHighlightLogEntryIdChange(int? highlightLogEntryId) {
    final homePageStore = GetIt.I.get<HomePageStore>();

    if (highlightLogEntryId == null) return;

    final listViewIndexForHighlight = _calcListViewIndexForLogEntry(logEntryId: highlightLogEntryId);
    Log.d(_kTag,
        'handleHighlightLogEntryIdChange highlightLogEntryId=$highlightLogEntryId listViewIndexForHighlight=$listViewIndexForHighlight');
    if (listViewIndexForHighlight == null) return;

    final itemPositions = homePageStore.itemPositionsListener.itemPositions.value;
    final visibleIndices = itemPositions.map((e) => e.index).toList();
    final itemPositionForHighlight = itemPositions.firstWhereOrNull((e) => e.index == listViewIndexForHighlight);

    // why this logic: also see #90

    if (itemPositionForHighlight != null) {
      // It is *fully* visible
      if (itemPositionForHighlight.itemLeadingEdge >= 0.0 && itemPositionForHighlight.itemTrailingEdge <= 1.0) return;

      // There are only few elements there
      if (itemPositions.length <= 3) return;
    }

    final middleVisibleIndex = visibleIndices[visibleIndices.length ~/ 2];
    final alignment = listViewIndexForHighlight < middleVisibleIndex ? .0 : .9;
    Log.d(_kTag, 'jump to make index=$listViewIndexForHighlight at alignment=$alignment');
    homePageStore.itemScrollController.jumpTo(index: listViewIndexForHighlight, alignment: alignment);
  }

  int? _calcListViewIndexForLogEntry({required int logEntryId}) {
    final homePageStore = GetIt.I.get<HomePageStore>();

    final testInfoId = _logStore.testIdOfLogEntry[logEntryId]!;
    final listViewIndexOfFirstLogEntryOfTest = homePageStore.rdtListViewIndexOfFirstLogEntryOfTestIdMap[testInfoId]!;

    final logEntryOffset = _logStore.logEntryInTest[testInfoId]!.indexOf(logEntryId);
    assert(logEntryOffset != -1);

    return listViewIndexOfFirstLogEntryOfTest + logEntryOffset;
  }

  final _logStore = GetIt.I.get<LogStore>();
}
