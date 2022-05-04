// ignore_for_file: implementation_imports

import 'package:convenient_test_common/convenient_test_common.dart';
import 'package:convenient_test_dev/src/support/extensions.dart';
import 'package:convenient_test_dev/src/support/suite_info_converter.dart';
import 'package:convenient_test_dev/src/third_party/my_test_compat.dart';
import 'package:get_it/get_it.dart';
import 'package:test_api/src/backend/declarer.dart';
import 'package:test_api/src/backend/group.dart';

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
    final suiteInfo = SuiteInfoConverter().convert(group);
    GetIt.I.get<ConvenientTestManagerClient>().reportSingle(ReportItem(suiteInfoProto: suiteInfo));
  }
}
