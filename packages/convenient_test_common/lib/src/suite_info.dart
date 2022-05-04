import 'package:convenient_test_common/src/protobuf/convenient_test.pb.dart';
import 'package:flutter/foundation.dart';

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

  int getEntryIdFromNames(List<String> entryLocators) {
    var currEntryId = rootGroupId;

    for (final name in entryLocators) {
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

  String calcBriefName(SuiteInfo suiteInfo);
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

  @override
  String calcBriefName(SuiteInfo suiteInfo) => name;
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

  @override
  String calcBriefName(SuiteInfo suiteInfo) {
    final parentGroup = suiteInfo.entryMap[parentId];
    if (parentGroup is! GroupInfo) return name;

    final prefix = parentGroup.name;
    if (name.startsWith(prefix)) return name.substring(prefix.length);

    return name;
  }
}
