import 'package:convenient_test_common_dart/src/common_dart/front_log.dart';
import 'package:convenient_test_common_dart/src/protobuf/convenient_test.pb.dart';
import 'package:meta/meta.dart';

@immutable
class SuiteInfo {
  static const _kTag = 'SuiteInfo';

  final int rootGroupId;
  final Map<int, GroupEntryInfo> entryMap;
  final Map<String, int> entryIdOfName;

  const SuiteInfo._({
    required this.rootGroupId,
    required this.entryMap,
    required this.entryIdOfName,
  });

  factory SuiteInfo.fromProto(SuiteInfoProto proto) {
    final entryMap = Map.fromEntries([
      ...proto.groups.map(
        (group) => MapEntry(group.id.toInt(), GroupInfo.fromProto(group)),
      ),
      ...proto.tests.map(
        (test) => MapEntry(test.id.toInt(), TestInfo.fromProto(test)),
      ),
    ]);
    final entryIdOfName = Map.fromEntries(
      entryMap.entries.map((e) => MapEntry(e.value.name, e.key)),
    );

    if (entryIdOfName.length != entryMap.length) {
      Log.d(
        _kTag,
        '#groups=${proto.groups.length} #tests=${proto.tests.length} '
        'entryIdOfName.keys.length=${entryIdOfName.keys.length} entryIdOfName.keys=${entryIdOfName.keys.toList()} '
        'groups.name=${proto.groups.map((e) => e.name).toList()} tests.name=${proto.tests.map((e) => e.name).toList()} ',
      );
      throw Exception(
        'Sanity check failed: Suite tests should have no duplicate names',
      );
    }

    return SuiteInfo._(
      rootGroupId: proto.groupId.toInt(),
      entryMap: entryMap,
      entryIdOfName: entryIdOfName,
    );
  }

  int? getEntryIdFromName(String entryName) => entryIdOfName[entryName];

  GroupInfo get rootGroup => entryMap[rootGroupId]! as GroupInfo;

  void traverse(GroupEntryInfoTraverseCallback callback) =>
      rootGroup.traverse(this, callback);

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

typedef GroupEntryInfoTraverseCallback =
    void Function(GroupEntryInfo groupEntryInfo);

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
        throw Exception(
          'cannot find entry for childEntryId=$childEntryId '
          '(this.id=$id, this.name=$name, suiteInfo.entryMap=${suiteInfo.entryMap.keys.toList()})',
        );
      }

      child.traverse(suiteInfo, callback);
    }
  }
}

@immutable
class GroupInfo extends GroupEntryInfo {
  final List<int> entryIds;

  const GroupInfo({
    required super.id,
    required super.name,
    required super.parentId,
    required this.entryIds,
  });

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
    required super.id,
    required super.name,
    required super.parentId,
  });

  factory TestInfo.fromProto(TestInfoProto proto) => TestInfo(
    id: proto.id.toInt(),
    name: proto.name,
    parentId: proto.parentId.toInt(),
  );

  @override
  List<int> get childrenGroupEntryIds => const [];
}
