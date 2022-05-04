import 'package:collection/collection.dart';
import 'package:convenient_test_common/convenient_test_common.dart';
import 'package:flutter/foundation.dart';
import 'package:mobx/mobx.dart';

part 'organization_store.g.dart';

class OrganizationStore = _OrganizationStore with _$OrganizationStore;

abstract class _OrganizationStore with Store {
  static var _nextId = 1000000;

  final testGroupIds = ObservableList<int>();
  final testEntryInGroup = RelationOneToMany();

  final testGroupMap = ObservableMap<int, TestGroup>();
  final testEntryMap = ObservableMap<int, TestEntry>();

  final testEntryStateMap = ObservableDefaultMap<int, TestEntryState>(
      createDefaultValue: (_) => TestEntryState(status: 'pending', result: 'success'));

  final expandTestGroupMap = ObservableDefaultMap<int, bool>(createDefaultValue: (_) => false);
  final expandTestEntryMap = ObservableDefaultMap<int, bool>(createDefaultValue: (_) => false);

  @observable
  bool enableAutoExpand = true;

  @computed
  List<int> get allTestEntryIds => testGroupIds.expand((testGroupId) => testEntryInGroup[testGroupId]!).toList();

  @observable
  int? activeTestEntryId;

  int testGroupNameToId(String name) {
    final item = testGroupMap.values.singleWhereOrNull((item) => item.name == name);
    if (item != null) return item.id;

    final id = _nextId++;
    testGroupMap[id] = TestGroup(id: id, name: name);
    testGroupIds.add(id);
    return id;
  }

  int testEntryNameToId(String name, {int? testGroupId}) {
    final item = testEntryMap.values.singleWhereOrNull((item) => item.name == name);
    if (item != null) return item.id;

    if (testGroupId == null) {
      throw Exception('need to implicitly create test entry, but no testGroupId provided name=$name');
    }
    final id = _nextId++;
    testEntryMap[id] = TestEntry(id: id, name: name, testGroupId: testGroupId);
    testEntryInGroup.addRelation(testGroupId, id);
    return id;
  }

  void clear() {
    testGroupIds.clear();
    testEntryInGroup.clear();
    testGroupMap.clear();
    testEntryMap.clear();
    expandTestGroupMap.clear();
    expandTestEntryMap.clear();
    activeTestEntryId = null;
  }
}

@immutable
class TestGroup {
  final int id;
  final String name;

  const TestGroup({required this.id, required this.name});
}

@immutable
class TestEntry {
  final int id;
  final int testGroupId;
  final String name;

  const TestEntry({required this.id, required this.testGroupId, required this.name});
}
