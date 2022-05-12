import 'package:collection/collection.dart';
import 'package:convenient_test_common_dart/convenient_test_common_dart.dart';
import 'package:convenient_test_manager/stores/home_page_store.dart';
import 'package:convenient_test_manager/stores/video_player_store.dart';
import 'package:convenient_test_manager_dart/stores/highlight_store.dart';
import 'package:convenient_test_manager_dart/stores/log_store.dart';
import 'package:convenient_test_manager_dart/stores/suite_info_store.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

part 'highlight_store.g.dart';

class HighlightStore = _HighlightStore with _$HighlightStore;

abstract class _HighlightStore extends HighlightStoreBase with Store {
  static const _kTag = 'HighlightStore';

  @observable
  bool enableAutoExpand = true;

  @observable
  bool enableAutoJump = true;

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

  @override
  void handleLogEntry({required int testEntryId, required int logEntryId}) {
    if (enableAutoExpand) {
      expandGroupEntryMap.clear();
      expandSeriesForTest(testInfoId: testEntryId);
      highlightTestEntryId = testEntryId;
      highlightLogEntryId = logEntryId;
    }
  }

  @observable
  int? highlightTestEntryId;

  @observable
  int? highlightLogEntryId;

  @observable
  LogEntryAndSnapshot? highlightSnapshot;

  void clear() {
    expandGroupEntryMap.clear();
    highlightTestEntryId = null;
    highlightLogEntryId = null;
    highlightSnapshot = null;
  }

  _HighlightStore() {
    _setupSyncVideoPositionToHighlight();
    _setupMakeHighlightLogEntryVisible();
  }

  void _setupSyncVideoPositionToHighlight() {
    final videoPlayerStore = GetIt.I.get<VideoPlayerStore>();

    reaction<int?>(
      (_) => videoPlayerStore.playerPositionCorrespondingLogEntryId,
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
    final highlightStore = GetIt.I.get<HighlightStore>();
    final homePageStore = GetIt.I.get<HomePageStore>();

    if (!highlightStore.enableAutoJump) return;
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

@immutable
class LogEntryAndSnapshot {
  final int logEntryId;
  final String snapshotName;

  const LogEntryAndSnapshot(this.logEntryId, this.snapshotName);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LogEntryAndSnapshot &&
          runtimeType == other.runtimeType &&
          logEntryId == other.logEntryId &&
          snapshotName == other.snapshotName;

  @override
  int get hashCode => logEntryId.hashCode ^ snapshotName.hashCode;

  @override
  String toString() => 'LogEntryAndSnapshot{logEntryId: $logEntryId, snapshotName: $snapshotName}';
}
