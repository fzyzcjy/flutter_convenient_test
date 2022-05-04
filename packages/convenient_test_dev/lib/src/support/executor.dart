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
  SuiteInfo convert(Group root) => SuiteInfo(
        group: _convertGroup(root),
      );

  GroupInfo _convertGroup(Group entry) => GroupInfo(
        name: entry.name,
        entries: entry.entries.map(_convertGroupEntry),
      );

  TestInfo _convertTest(Test entry) => TestInfo(
        name: entry.name,
      );

  GroupEntryInfo _convertGroupEntry(GroupEntry entry) {
    if (entry is Group) return GroupEntryInfo(group: _convertGroup(entry));
    if (entry is Test) return GroupEntryInfo(test: _convertTest(entry));
    throw Exception('Unknown entry=$entry');
  }
}
