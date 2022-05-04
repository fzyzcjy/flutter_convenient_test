// ignore_for_file: implementation_imports

import 'package:convenient_test_common/convenient_test_common.dart';
import 'package:convenient_test_dev/src/third_party/my_test_compat.dart';
import 'package:get_it/get_it.dart';
import 'package:test_api/src/backend/declarer.dart';
import 'package:test_api/src/backend/group.dart';
import 'package:test_api/src/backend/group_entry.dart';
import 'package:test_api/src/backend/test.dart';

class ConvenientTestExecutor {
  // static const _kTag = 'ConvenientTestExecutor';

  static void execute(Declarer declarer, {required RegExp filterNameRegex}) {
    runTestsInDeclarer(
      declarer,
      onGroupBuilt: _reportTestInfoPack,
      shouldSkip: (entry) async => !filterNameRegex.hasMatch(entry.name),
    );
  }

  static void _reportTestInfoPack(Group group) {
    final suiteInfo = _SuiteInfoConverter().convert(group);
    GetIt.I.get<ConvenientTestManagerClient>().reportSuiteInfo(suiteInfo);
  }
}

class _SuiteInfoConverter {
  var _unoccupiedId = 100; // initial id should be >0 to avoid confusion
  int _nextId() => _unoccupiedId++;

  SuiteInfoProto convert(Group root) {
    final target = SuiteInfoProto();
    target.groupId = _convertGroup(root, target, -1);
    return target;
  }

  int _convertGroup(Group entry, SuiteInfoProto target, int parentId) {
    final id = _nextId();
    target.groups.add(GroupInfoProto(
      id: id,
      name: entry.name,
      parentId: parentId,
      entryIds: entry.entries.map((child) => _convertGroupEntry(child, target, id)),
    ));
    return id;
  }

  int _convertTest(Test entry, SuiteInfoProto target, int parentId) {
    final id = _nextId();
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
