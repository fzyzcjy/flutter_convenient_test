import 'package:convenient_test_common/convenient_test_common.dart';
import 'package:convenient_test_manager/stores/log_store.dart';
import 'package:convenient_test_manager/utils/utils.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

part 'organization_store.g.dart';

class OrganizationStore = _OrganizationStore with _$OrganizationStore;

abstract class _OrganizationStore with Store {
  final testEntryStateMap = ObservableDefaultMap<int, TestEntryState>(
      createDefaultValue: (_) => TestEntryState(status: 'pending', result: 'success'));

  /// key: [GroupEntryInfo].id
  final expandGroupEntryMap = ObservableDefaultMap<int, bool>(createDefaultValue: (_) => false);

  @observable
  bool enableAutoExpand = true;

  @observable
  int? activeTestEntryId;

  SimplifiedStateEnum getSimplifiedState(int testInfoId) =>
      testEntryStateMap[testInfoId].toSimplifiedStateEnum(isFlaky: GetIt.I.get<LogStore>().isTestFlaky(testInfoId));

  void clear() {
    expandGroupEntryMap.clear();
    activeTestEntryId = null;
  }
}
