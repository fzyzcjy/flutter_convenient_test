// ignore_for_file: implementation_imports
import 'package:convenient_test_common/convenient_test_common.dart';
import 'package:convenient_test_dev/src/support/get_it.dart';
import 'package:convenient_test_dev/src/support/manager_rpc_service.dart';
import 'package:convenient_test_dev/src/support/suite_info_converter.dart';
import 'package:convenient_test_dev/src/third_party/my_test_compat.dart';
import 'package:meta/meta.dart';
import 'package:test_api/src/backend/declarer.dart';
import 'package:test_api/src/backend/group.dart';
import 'package:test_api/src/backend/group_entry.dart';
import 'package:test_api/src/backend/test.dart';

class ConvenientTestExecutor {
  // static const _kTag = 'ConvenientTestExecutor';

  set input(ConvenientTestExecutorInput val) => _input = val;
  late final ConvenientTestExecutorInput _input;

  ResolvedExecutionFilter get resolvedExecutionFilter => _resolvedExecutionFilter;
  late final ResolvedExecutionFilter _resolvedExecutionFilter;

  void execute() {
    runTestsInDeclarer(
      _input.declarer,
      onGroupBuilt: (group) {
        if (_input.reportSuiteInfo) _reportSuiteInfo(group);

        _resolvedExecutionFilter = _ExecutionFilterResolver.resolve(
          root: group,
          executionFilter: _input.executionFilter,
        );
      },
      shouldSkip: (entry) async => !_resolvedExecutionFilter.allowExecute(entry),
    );
  }

  static void _reportSuiteInfo(Group group) {
    final suiteInfo = SuiteInfoConverter().convert(group);
    myGetIt.get<ManagerRpcService>().reportSingle(ReportItem(suiteInfoProto: suiteInfo));
  }
}

@immutable
class ConvenientTestExecutorInput {
  final Declarer declarer;
  final bool reportSuiteInfo;
  final ExecutionFilter executionFilter;

  const ConvenientTestExecutorInput({
    required this.declarer,
    required this.reportSuiteInfo,
    required this.executionFilter,
  });
}

@immutable
class ResolvedExecutionFilter {
  final List<String> allowExecuteTestNames;

  const ResolvedExecutionFilter({required this.allowExecuteTestNames});

  bool allowExecute(GroupEntry entry) {
    if (entry is! Test) throw Exception('allowExecute only supports Test, but entry=$entry');
    return allowExecuteTestNames.contains(entry.name);
  }

  ResolvedExecutionFilterProto toProto() => ResolvedExecutionFilterProto(
        allowExecuteTestNames: allowExecuteTestNames,
      );
}

class _ExecutionFilterResolver {
  static ResolvedExecutionFilter resolve({
    required Group root,
    required ExecutionFilter executionFilter,
  }) {
    final filterNameRegex = RegExp(executionFilter.filterNameRegex);
    final flattenedTestsMatchingFilter = traverseTests(root) //
        .where((test) => filterNameRegex.hasMatch(test.name))
        .toList();

    final strategy = executionFilter.strategy;
    switch (strategy.whichSubType()) {
      case ExecutionFilter_Strategy_SubType.firstMatch:
        return _createOutput([flattenedTestsMatchingFilter.first]);
      case ExecutionFilter_Strategy_SubType.nextMatch:
        final info = strategy.nextMatch;

        final prevTestIndex = flattenedTestsMatchingFilter.indexWhere((e) => e.name == info.prevTestName);
        if (prevTestIndex == -1) throw Exception;

        return _createOutput([flattenedTestsMatchingFilter[prevTestIndex + 1]]);
      case ExecutionFilter_Strategy_SubType.allMatch:
        return _createOutput(flattenedTestsMatchingFilter);
      case ExecutionFilter_Strategy_SubType.notSet:
        throw Exception('unknown $executionFilter');
    }
  }

  static ResolvedExecutionFilter _createOutput(List<Test> allowExecuteTests) =>
      ResolvedExecutionFilter(allowExecuteTestNames: allowExecuteTests.map((e) => e.name).toList());

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
}
