import 'package:collection/collection.dart';
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

  int? getEntryIdFromNames(List<String> entryLocators) {
    var currEntryId = rootGroupId;

    for (final name in entryLocators) {
      final currEntry = entryMap[currEntryId];
      if (currEntry is! GroupInfo) return null;

      final nextEntryId = currEntry.entryIds.singleWhereOrNull((childEntryId) => entryMap[childEntryId]?.name == name);
      if (nextEntryId == null) return null;

      currEntryId = nextEntryId;
    }

    return currEntryId;
  }

  GroupInfo get rootGroup => entryMap[rootGroupId]! as GroupInfo;

  void traverse(GroupEntryInfoTraverseCallback callback) => rootGroup.traverse(this, callback);
}

typedef GroupEntryInfoTraverseCallback = void Function(GroupEntryInfo groupEntryInfo);

@immutable
abstract class GroupEntryInfo {
  final int parentId;
  final int id;
  final String name;

  const GroupEntryInfo({
    required this.parentId,
    required this.id,
    required this.name,
  });

  List<int> get childrenGroupEntryIds;

  String calcBriefName(SuiteInfo suiteInfo);

  void traverse(SuiteInfo suiteInfo, GroupEntryInfoTraverseCallback callback) {
    callback(this);
    for (final entryId in childrenGroupEntryIds) {
      suiteInfo.entryMap[entryId]!.traverse(suiteInfo, callback);
    }
  }
}

@immutable
class GroupInfo extends GroupEntryInfo {
  final List<int> entryIds;

  const GroupInfo({
    required int id,
    required String name,
    required int parentId,
    required this.entryIds,
  }) : super(id: id, name: name, parentId: parentId);

  factory GroupInfo.fromProto(GroupInfoProto proto) => GroupInfo(
        id: proto.id,
        name: proto.name,
        parentId: proto.parentId,
        entryIds: proto.entryIds,
      );

  @override
  String calcBriefName(SuiteInfo suiteInfo) => name;

  @override
  List<int> get childrenGroupEntryIds => entryIds;
}

@immutable
class TestInfo extends GroupEntryInfo {
  const TestInfo({
    required int id,
    required String name,
    required int parentId,
  }) : super(id: id, name: name, parentId: parentId);

  factory TestInfo.fromProto(TestInfoProto proto) => TestInfo(
        id: proto.id,
        name: proto.name,
        parentId: proto.parentId,
      );

  @override
  String calcBriefName(SuiteInfo suiteInfo) {
    final parentGroup = suiteInfo.entryMap[parentId];
    if (parentGroup is! GroupInfo) return name;

    final prefix = parentGroup.name;
    if (name.startsWith(prefix)) return name.substring(prefix.length);

    return name;
  }

  @override
  List<int> get childrenGroupEntryIds => const [];
}
