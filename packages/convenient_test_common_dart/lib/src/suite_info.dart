import 'package:convenient_test_common_dart/src/common_dart/front_log.dart';
import 'package:convenient_test_common_dart/src/protobuf/convenient_test.pb.dart';
import 'package:meta/meta.dart';

@immutable
class SuiteInfo {
  static const _kTag = 'SuiteInfo';

  final String rootGroupName;
  final Map<String, GroupEntryInfo> entryMap;

  const SuiteInfo._({
    required this.rootGroupName,
    required this.entryMap,
  });

  factory SuiteInfo.fromProto(SuiteInfoProto proto) {
    final entryMap = Map.fromEntries([
      ...proto.groups.map((group) => MapEntry(group.name, GroupInfo.fromProto(group))),
      ...proto.tests.map((test) => MapEntry(test.name, TestInfo.fromProto(test))),
    ]);

    final entryNames = entryMap.keys.toList();
    if (entryNames.toSet().length != entryNames.length) {
      Log.d(
          _kTag,
          '#groups=${proto.groups.length} #tests=${proto.tests.length} '
          'entryNames=$entryNames '
          'groups.name=${proto.groups.map((e) => e.name).toList()} tests.name=${proto.tests.map((e) => e.name).toList()} ');
      throw Exception('Sanity check failed: Suite tests should have no duplicate names');
    }

    return SuiteInfo._(
      rootGroupName: proto.groupName,
      entryMap: entryMap,
    );
  }

  GroupInfo get rootGroup => entryMap[rootGroupName]! as GroupInfo;

  void traverse(GroupEntryInfoTraverseCallback callback) => rootGroup.traverse(this, callback);

  Iterable<int> ancestors(int entryId) sync* {
    var currEntryId = entryId;

    while (isIdValid(currEntryId)) {
      yield currEntryId;
      currEntryId = entryMap[currEntryId]!.parentId;
    }
  }

// TODO improve the way to check whether the id is valid
  bool isIdValid(int id) => id > 0;
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

  String calcBriefName(SuiteInfo suiteInfo) {
    final parentGroup = suiteInfo.entryMap[parentId];
    if (parentGroup is! GroupInfo) return name;

    final prefix = parentGroup.name;
    if (name.startsWith(prefix)) return name.substring(prefix.length);

    return name;
  }

  void traverse(SuiteInfo suiteInfo, GroupEntryInfoTraverseCallback callback) {
    callback(this);
    for (final childEntryId in childrenGroupEntryIds) {
      final child = suiteInfo.entryMap[childEntryId];

      // #135
      if (child == null) {
        throw Exception('cannot find entry for childEntryId=$childEntryId '
            '(this.id=$id, this.name=$name, suiteInfo.entryMap=${suiteInfo.entryMap.keys.toList()})');
      }

      child.traverse(suiteInfo, callback);
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
        id: proto.id.toInt(),
        name: proto.name,
        parentId: proto.parentId.toInt(),
        entryIds: proto.entryIds.map((e) => e.toInt()).toList(),
      );

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
        id: proto.id.toInt(),
        name: proto.name,
        parentId: proto.parentId.toInt(),
      );

  @override
  List<int> get childrenGroupEntryIds => const [];
}
