import 'package:convenient_test_common/convenient_test_common.dart';
import 'package:mobx/mobx.dart';

part 'organization_store.g.dart';

class OrganizationStore = _OrganizationStore with _$OrganizationStore;

abstract class _OrganizationStore with Store {
  final testEntryStateMap = ObservableDefaultMap<int, TestEntryState>(
      createDefaultValue: (_) => TestEntryState(status: 'pending', result: 'success'));

  final expandTestGroupMap = ObservableDefaultMap<int, bool>(createDefaultValue: (_) => false);
  final expandTestEntryMap = ObservableDefaultMap<int, bool>(createDefaultValue: (_) => false);

  @observable
  bool enableAutoExpand = true;

  @observable
  int? activeTestEntryId;

  void clear() {
    expandTestGroupMap.clear();
    expandTestEntryMap.clear();
    activeTestEntryId = null;
  }
}
