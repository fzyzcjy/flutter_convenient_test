import 'package:collection/collection.dart';
import 'package:convenient_test_common/convenient_test_common.dart';
import 'package:flutter/foundation.dart';
import 'package:mobx/mobx.dart';

part 'organization_store.g.dart';

class OrganizationStore = _OrganizationStore with _$OrganizationStore;

abstract class _OrganizationStore with Store {
  static var _nextId = 1000000;

  @observable
  SuiteInfo? suiteInfo;

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

@deprecated
@immutable
class TestGroup {
  final int id;
  final String name;

  const TestGroup({required this.id, required this.name});
}

@deprecated
@immutable
class TestEntry {
  final int id;
  final int testGroupId;
  final String name;

  const TestEntry({required this.id, required this.testGroupId, required this.name});
}

@immutable
class SuiteInfo {
  final GroupInfo group;

  const SuiteInfo({
    required this.group,
  });

  factory SuiteInfo.fromProto(SuiteInfoProto proto) => SuiteInfo(
        group: GroupInfo.fromProto(proto.group),
      );
}

@immutable
abstract class GroupEntryInfo {
  final String name;

  const GroupEntryInfo({
    required this.name,
  });

  factory GroupEntryInfo.fromProto(GroupEntryInfoProto proto) {
    switch (proto.whichSubType()) {
      case GroupEntryInfoProto_SubType.group:
        return GroupInfo.fromProto(proto.group);
      case GroupEntryInfoProto_SubType.test:
        return TestInfo.fromProto(proto.test);
      case GroupEntryInfoProto_SubType.notSet:
        throw Exception('unknown $proto');
    }
  }
}

@immutable
class GroupInfo extends GroupEntryInfo {
  final List<GroupEntryInfo> entries;

  const GroupInfo({
    required String name,
    required this.entries,
  }) : super(name: name);

  factory GroupInfo.fromProto(GroupInfoProto proto) => GroupInfo(
        name: proto.name,
        entries: proto.entries.map(GroupEntryInfo.fromProto).toList(),
      );
}

@immutable
class TestInfo extends GroupEntryInfo {
  const TestInfo({
    required String name,
  }) : super(name: name);

  factory TestInfo.fromProto(TestInfoProto proto) => TestInfo(
        name: proto.name,
      );
}
