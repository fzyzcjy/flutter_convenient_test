// ignore_for_file: implementation_imports

import 'package:convenient_test_common/convenient_test_common.dart';
import 'package:convenient_test_dev/src/support/get_it.dart';
import 'package:convenient_test_dev/src/support/manager_rpc_service.dart';
import 'package:convenient_test_dev/src/support/suite_info_converter.dart';
import 'package:convenient_test_dev/src/third_party/my_test_compat.dart';
import 'package:test_api/src/backend/declarer.dart';
import 'package:test_api/src/backend/group.dart';

class ConvenientTestExecutor {
  // static const _kTag = 'ConvenientTestExecutor';

  final Declarer declarer;
  final RegExp filterNameRegex;
  final bool reportSuiteInfo;

  ConvenientTestExecutor({
    required this.declarer,
    required this.filterNameRegex,
    required this.reportSuiteInfo,
  });

  void execute() {
    runTestsInDeclarer(
      declarer,
      onGroupBuilt: (group) {
        if (reportSuiteInfo) _reportSuiteInfo(group);
      },
      shouldSkip: (entry) async => !filterNameRegex.hasMatch(entry.name),
    );
  }

  static void _reportSuiteInfo(Group group) {
    final suiteInfo = SuiteInfoConverter().convert(group);
    myGetIt.get<ManagerRpcService>().reportSingle(ReportItem(suiteInfoProto: suiteInfo));
  }
}
