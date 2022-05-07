// ignore_for_file: implementation_imports
import 'package:convenient_test_common/convenient_test_common.dart';
import 'package:test_api/src/backend/group.dart';
import 'package:test_api/src/backend/group_entry.dart';
import 'package:test_api/src/backend/live_test.dart';
import 'package:test_api/src/backend/test.dart';

class SuiteInfoUtils {
  static List<String> entryLocatorsFromGroupEntries(List<GroupEntry> entries) => entries.map((e) => e.name).toList();

  static List<String> entryLocatorsFromLiveTest(LiveTest liveTest) =>
      entryLocatorsFromGroupEntries([...liveTest.groups, liveTest.test]);
}

class SuiteInfoConverter {
  SuiteInfoProto convert(Group root) {
    final target = SuiteInfoProto();
    target.groupId = _convertGroup(root, target, -1);
    return target;
  }

  int _convertGroup(Group entry, SuiteInfoProto target, int parentId) {
    final id = IdGenerator.instance.nextId();
    target.groups.add(GroupInfoProto(
      id: id,
      name: entry.name,
      parentId: parentId,
      entryIds: entry.entries.map((child) => _convertGroupEntry(child, target, id)),
    ));
    return id;
  }

  int _convertTest(Test entry, SuiteInfoProto target, int parentId) {
    final id = IdGenerator.instance.nextId();
    target.tests.add(TestInfoProto(
      id: id,
      name: entry.name,
      parentId: parentId,
    ));
    return id;
  }

  int _convertGroupEntry(GroupEntry entry, SuiteInfoProto target, int parentId) {
    if (entry is Group) return _convertGroup(entry, target, parentId);
    if (entry is Test) return _convertTest(entry, target, parentId);
    throw Exception('Unknown entry=$entry');
  }
}
