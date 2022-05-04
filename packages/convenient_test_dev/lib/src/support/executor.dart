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
  SuiteInfoProto convert(Group root) => SuiteInfoProto(
        group: _convertGroup(root),
      );

  GroupInfoProto _convertGroup(Group entry) => GroupInfoProto(
        name: entry.name,
        entries: entry.entries.map(_convertGroupEntry),
      );

  TestInfoProto _convertTest(Test entry) => TestInfoProto(
        name: entry.name,
      );

  GroupEntryInfoProto _convertGroupEntry(GroupEntry entry) {
    if (entry is Group) return GroupEntryInfoProto(group: _convertGroup(entry));
    if (entry is Test) return GroupEntryInfoProto(test: _convertTest(entry));
    throw Exception('Unknown entry=$entry');
  }
}
