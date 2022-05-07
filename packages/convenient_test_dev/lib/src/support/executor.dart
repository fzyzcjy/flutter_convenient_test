// ignore_for_file: implementation_imports
import 'package:convenient_test_common/convenient_test_common.dart';
import 'package:convenient_test_dev/src/support/get_it.dart';
import 'package:convenient_test_dev/src/support/manager_rpc_service.dart';
import 'package:convenient_test_dev/src/support/suite_info_converter.dart';
import 'package:convenient_test_dev/src/third_party/my_test_compat.dart';
import 'package:test_api/src/backend/declarer.dart';
import 'package:test_api/src/backend/group.dart';
import 'package:test_api/src/backend/group_entry.dart';
import 'package:test_api/src/backend/test.dart';

class ConvenientTestExecutor {
  // static const _kTag = 'ConvenientTestExecutor';

  final Declarer declarer;
  final bool reportSuiteInfo;
  final RegExp filterNameRegex;
  final ExecutionMode executionMode;
  late final _ExecutionFilter _executionFilter;

  ConvenientTestExecutor({
    required this.declarer,
    required this.reportSuiteInfo,
    required this.filterNameRegex,
    required this.executionMode,
  });

  void execute() {
    runTestsInDeclarer(
      declarer,
      onGroupBuilt: (group) {
        _executionFilter = _ExecutionFilter(
          root: group,
          filterNameRegex: filterNameRegex,
          executionMode: executionMode,
        );
        if (reportSuiteInfo) _reportSuiteInfo(group);
      },
      shouldSkip: (entry) async => !_executionFilter.allowExecute(entry),
    );
  }

  static void _reportSuiteInfo(Group group) {
    final suiteInfo = SuiteInfoConverter().convert(group);
    myGetIt.get<ManagerRpcService>().reportSingle(ReportItem(suiteInfoProto: suiteInfo));
  }
}

class _ExecutionFilter {
  final Set<String> allowExecuteTestNames;

  factory _ExecutionFilter({
    required Group root,
    required RegExp filterNameRegex,
    required ExecutionMode executionMode,
  }) {
    final flattenedTestsMatchingFilter = traverseTests(root) //
        .where((test) => filterNameRegex.hasMatch(test.name))
        .toList();

    switch (executionMode.whichSubType()) {
      case ExecutionMode_SubType.firstMatching:
        return _ExecutionFilter._([flattenedTestsMatchingFilter.first]);
      case ExecutionMode_SubType.nextMatching:
        final nextMatchingInfo = executionMode.nextMatching;

        final prevTestIndex = flattenedTestsMatchingFilter.indexWhere((e) => e.name == nextMatchingInfo.prevTestName);
        if (prevTestIndex == -1) throw Exception;

        return _ExecutionFilter._([flattenedTestsMatchingFilter[prevTestIndex + 1]]);
      case ExecutionMode_SubType.allMatching:
        return _ExecutionFilter._(flattenedTestsMatchingFilter);
      case ExecutionMode_SubType.notSet:
        throw Exception('unknown $executionMode');
    }
  }

  _ExecutionFilter._(List<Test> allowExecuteTests)
      : allowExecuteTestNames = allowExecuteTests.map((e) => e.name).toSet();

  static Iterable<Test> traverseTests(GroupEntry entry) sync* {
    if (entry is Group) {
      for (final child in entry.entries) {
        yield* traverseTests(child);
      }
    } else if (entry is Test) {
      yield entry;
    } else {
      throw Exception('unknown $entry');
    }
  }

  bool allowExecute(GroupEntry entry) {
    if (entry is! Test) throw Exception('allowExecute only supports Test, but entry=$entry');
    return allowExecuteTestNames.contains(entry.name);
  }
}
