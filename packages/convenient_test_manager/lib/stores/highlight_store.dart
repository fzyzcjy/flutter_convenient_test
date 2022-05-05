import 'package:collection/collection.dart';
import 'package:convenient_test_common/convenient_test_common.dart';
import 'package:convenient_test_manager/stores/log_store.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

part 'highlight_store.g.dart';

class HighlightStore = _HighlightStore with _$HighlightStore;

abstract class _HighlightStore with Store {
  @observable
  bool enableAutoExpand = true;

  /// key: [GroupEntryInfo].id
  final expandGroupEntryMap = ObservableDefaultMap<int, bool>(createDefaultValue: (_) => false);

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

  final _logStore = GetIt.I.get<LogStore>();
}
