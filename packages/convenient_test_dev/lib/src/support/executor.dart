// ignore_for_file: implementation_imports

import 'package:convenient_test_common/convenient_test_common.dart';
import 'package:convenient_test_dev/src/functions/log.dart';
import 'package:convenient_test_dev/src/third_party/my_test_compat.dart';
import 'package:get_it/get_it.dart';
import 'package:test_api/src/backend/declarer.dart';
import 'package:test_api/src/backend/group.dart';
import 'package:test_api/src/backend/group_entry.dart';
import 'package:test_api/src/backend/test.dart';

class ConvenientTestExecutor {
  static const _kTag = 'ConvenientTestExecutor';

  static void execute(Declarer declarer) {
    final filterNameRegexFuture = _fetchFilterNameRegex();

    runTestsInDeclarer(
      declarer,
      onGroupBuilt: _reportTestInfoPack,
      shouldSkip: (entry) async => !(await filterNameRegexFuture).hasMatch(entry.name),
    );
  }

  static Future<RegExp> _fetchFilterNameRegex() async {
    final response = await GetIt.I.get<ConvenientTestManagerClient>().getTestFilter(Empty());
    Log.d(_kTag, 'filterNameRegex=${response.filterNameRegex}');
    return RegExp(response.filterNameRegex);
  }

  static void _reportTestInfoPack(Group group) {
    final pack = _getTestInfoPack(group);
    GetIt.I.get<ConvenientTestManagerClient>().reportTestInfoPack(pack);
  }

  static TestInfoPack _getTestInfoPack(Group root) {
    final pack = TestInfoPack();

    void _core(GroupEntry entry, List<Group> parents) {
      if (entry is Group) {
        for (final child in entry.entries) {
          _core(child, [...parents, entry]);
        }
      } else if (entry is Test) {
        pack.entries.add(TestEntryInfo(
          testEntryName: entry.name,
          testGroupName: testGroupsToName(parents),
        ));
      } else {
        throw Exception;
      }
    }

    _core(root, []);

    return pack;
  }
}
