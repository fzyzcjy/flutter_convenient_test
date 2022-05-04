import 'package:convenient_test_common/convenient_test_common.dart';
import 'package:flutter/foundation.dart';
import 'package:mobx/mobx.dart';

part 'suite_info_store.g.dart';

class SuiteInfoStore = _SuiteInfoStore with _$SuiteInfoStore;

abstract class _SuiteInfoStore with Store {
  @observable
  SuiteInfo? suiteInfo;

  void clear() {
    suiteInfo = null;
  }
}

@immutable
class SuiteInfo {
  final int rootGroupId;
  final Map<int, GroupEntryInfo> entryMap;

  const SuiteInfo._({
    required this.rootGroupId,
    required this.entryMap,
  });

  factory SuiteInfo.fromProto(SuiteInfoProto proto) {
    return SuiteInfo._(
      rootGroupId: proto.groupId,
      entryMap: Map.fromEntries([
        ...proto.groups.map((group) => MapEntry(group.id, GroupInfo.fromProto(group))),
        ...proto.tests.map((test) => MapEntry(test.id, TestInfo.fromProto(test))),
      ]),
    );
  }

  int getEntryIdFromNames(List<String> names) {
    var currEntryId = rootGroupId;

    for (final name in names) {
      final currEntry = entryMap[currEntryId]! as GroupInfo;
      final nextEntryId = currEntry.entryIds.singleWhere((childEntryId) => entryMap[childEntryId]!.name == name);
      currEntryId = nextEntryId;
    }

    return currEntryId;
  }
}

@immutable
abstract class GroupEntryInfo {
  final int parentId;
  final String name;

  const GroupEntryInfo({
    required this.parentId,
    required this.name,
  });
}

@immutable
class GroupInfo extends GroupEntryInfo {
  final List<int> entryIds;

  const GroupInfo({
    required int parentId,
    required String name,
    required this.entryIds,
  }) : super(parentId: parentId, name: name);

  factory GroupInfo.fromProto(GroupInfoProto proto) => GroupInfo(
        parentId: proto.parentId,
        name: proto.name,
        entryIds: proto.entryIds,
      );
}

@immutable
class TestInfo extends GroupEntryInfo {
  const TestInfo({
    required int parentId,
    required String name,
  }) : super(parentId: parentId, name: name);

  factory TestInfo.fromProto(TestInfoProto proto) => TestInfo(
        parentId: proto.parentId,
        name: proto.name,
      );
}
