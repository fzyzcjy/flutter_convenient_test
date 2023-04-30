// ignore_for_file: implementation_imports
import 'package:convenient_test_common/convenient_test_common.dart';
import 'package:convenient_test_dev/src/support/reporter_service.dart';
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
        _ensureNoDuplicateTestNames(group);

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
    final suiteInfo = SuiteInfoConverter.convert(group);
    ReporterService.I?.report(ReportItem(suiteInfoProto: suiteInfo));
  }

  static void _ensureNoDuplicateTestNames(Group group) {
    final allNames = group.traverse().map((e) => e.name).toList();
    if (allNames.toSet().length != allNames.length) {
      throw Exception('Should not have any duplicated test names, '
          'because convenient_test rely on test names to identify and distinguish them. '
          'However, this is violated.');
    }
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
  static const _kTag = 'ExecutionFilterResolver';

  static ResolvedExecutionFilter resolve({
    required Group root,
    required ExecutionFilter executionFilter,
  }) {
    final filterNameRegex = _createRegExp(executionFilter.filterNameRegex);
    final flattenedTestsMatchingFilter = root
        .traverse()
        .whereType<Test>() //
        .where((test) => filterNameRegex.hasMatch(test.name))
        .toList();

    final strategy = executionFilter.strategy;
    switch (strategy.whichSubType()) {
      case ExecutionFilter_Strategy_SubType.firstMatch:
        return _createOutput(flattenedTestsMatchingFilter.take(1).toList());
      case ExecutionFilter_Strategy_SubType.nextMatch:
        final info = strategy.nextMatch;

        final prevTestIndex = flattenedTestsMatchingFilter.indexWhere((e) => e.name == info.prevTestName);
        if (prevTestIndex == -1) throw Exception;

        final nextTestIndex = prevTestIndex + 1;
        return _createOutput(
            nextTestIndex == flattenedTestsMatchingFilter.length ? [] : [flattenedTestsMatchingFilter[nextTestIndex]]);
      case ExecutionFilter_Strategy_SubType.allMatch:
        return _createOutput(flattenedTestsMatchingFilter);
      case ExecutionFilter_Strategy_SubType.notSet:
        throw Exception('unknown $executionFilter');
    }
  }

  static RegExp _createRegExp(String raw) {
    try {
      return RegExp(raw);
    } catch (_) {
      Log.i(_kTag, 'error when create RegExp raw=`$raw`');
      rethrow;
    }
  }

  static ResolvedExecutionFilter _createOutput(List<Test> allowExecuteTests) =>
      ResolvedExecutionFilter(allowExecuteTestNames: allowExecuteTests.map((e) => e.name).toList());
}

extension ExtGroupEntry on GroupEntry {
  Iterable<GroupEntry> traverse() sync* {
    yield this;

    final that = this;
    if (that is Group) {
      yield* that.entries.expand((child) => child.traverse());
    }
  }
}
