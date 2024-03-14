import 'dart:math';

import 'package:collection/collection.dart';
import 'package:convenient_test_common_dart/convenient_test_common_dart.dart';
import 'package:convenient_test_manager_dart/services/misc_dart_service.dart';
import 'package:convenient_test_manager_dart/services/vm_service_wrapper_service.dart';
import 'package:convenient_test_manager_dart/stores/global_config_store.dart';
import 'package:convenient_test_manager_dart/stores/suite_info_store.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';
import 'package:test_api/src/backend/state.dart'; // ignore: implementation_imports

part 'worker_super_run_store.freezed.dart';

part 'worker_super_run_store.g.dart';

/// A "worker run" is the code execution from worker hot-restart to the next hot-restart
/// A "worker super run" is one or multiple "worker run"s
class WorkerSuperRunStore = _WorkerSuperRunStore with _$WorkerSuperRunStore;

abstract class _WorkerSuperRunStore with Store {
  static const _kTag = 'WorkerSuperRunStore';

  bool get isolationMode => GlobalConfigStore.config.isolationMode;

  set isolationMode(bool val) => GlobalConfigStore.config.isolationMode = val;

  @observable
  var flakyTestTotalAttemptCount = 2;

  bool get retryMode => flakyTestTotalAttemptCount > 1;

  set retryMode(bool enable) => flakyTestTotalAttemptCount = enable ? 2 : 1;

  @observable
  bool autoUpdateGoldenFiles = false;

  @observable
  WorkerSuperRunController currSuperRunController =
      _WorkerSuperRunControllerIntegrationTestClassicalMode(
          filterNameRegex: RegexUtils.kMatchNothing);

  void setControllerInteractiveApp() =>
      currSuperRunController = _WorkerSuperRunControllerInteractiveApp();

  void setControllerIntegrationTest({required String filterNameRegex}) {
    if (isolationMode) {
      currSuperRunController =
          _WorkerSuperRunControllerIntegrationTestIsolationMode(
              filterNameRegex: filterNameRegex);
    } else {
      currSuperRunController =
          _WorkerSuperRunControllerIntegrationTestClassicalMode(
              filterNameRegex: filterNameRegex);
    }
  }

  void setControllerHalt() =>
      currSuperRunController = _WorkerSuperRunControllerHalt();

  WorkerCurrentRunConfig calcCurrentRunConfig() {
    final config = currSuperRunController._calcCurrentRunConfig();
    _sanityCheckWorkerCurrentRunConfig(config);
    return config;
  }

  void _sanityCheckWorkerCurrentRunConfig(WorkerCurrentRunConfig config) {
    if (config.hasIntegrationTest()) {
      if (config.integrationTest.autoUpdateGoldenFiles != autoUpdateGoldenFiles) {
        throw AssertionError;
      }
    }
  }

  _WorkerSuperRunStore() {
    reaction((_) => isolationMode, _handleIsolationModeChange);
  }

  void _handleIsolationModeChange(bool isolationMode) {
    Log.d(_kTag,
        'see isolationMode($isolationMode) changed, thus reloadInfo to make currSuperRunController updated');
    GetIt.I.get<MiscDartService>().reloadInfo();
    assert(isolationMode
        ? currSuperRunController
            is _WorkerSuperRunControllerIntegrationTestIsolationMode
        : currSuperRunController
            is _WorkerSuperRunControllerIntegrationTestClassicalMode);
  }
}

enum WorkerSuperRunStatus {
  runningTest,
  testAllDone,
  na,
}

enum WorkerRunMode { interactiveApp, integrationTest }

abstract class WorkerSuperRunController {
  final String superRunId = _createSuperRunId();

  WorkerSuperRunController._();

  WorkerCurrentRunConfig _calcCurrentRunConfig();

  void handleTearDownAll(ResolvedExecutionFilterProto resolvedExecutionFilter);

  bool get isInteractiveApp => this is _WorkerSuperRunControllerInteractiveApp;

  WorkerSuperRunStatus get superRunStatus;

  static String _createSuperRunId() {
    return 'RUN-${DateFormat('yyyyMMdd-HHmmss').format(DateTime.now())}-${Random().nextInt(1000).toString().padLeft(3, '0')}';
  }
}

class _WorkerSuperRunControllerHalt extends WorkerSuperRunController {
  _WorkerSuperRunControllerHalt() : super._();

  @override
  WorkerCurrentRunConfig _calcCurrentRunConfig() => WorkerCurrentRunConfig(
        integrationTest: WorkerCurrentRunConfig_IntegrationTest(
          reportSuiteInfo: false,
          defaultRetryCount: 0,
          executionFilter: ExecutionFilter(
            filterNameRegex: RegexUtils.kMatchNothing,
            strategy: ExecutionFilter_Strategy(
              allMatch: ExecutionFilter_Strategy_AllMatch(),
            ),
          ),
          autoUpdateGoldenFiles:
              GetIt.I.get<WorkerSuperRunStore>().autoUpdateGoldenFiles,
        ),
      );

  @override
  void handleTearDownAll(
      ResolvedExecutionFilterProto resolvedExecutionFilter) {}

  @override
  WorkerSuperRunStatus get superRunStatus => WorkerSuperRunStatus.na;

  @override
  String toString() => 'WorkerSuperRunControllerHalt{}';
}

class _WorkerSuperRunControllerInteractiveApp extends WorkerSuperRunController {
  _WorkerSuperRunControllerInteractiveApp() : super._();

  @override
  WorkerCurrentRunConfig _calcCurrentRunConfig() {
    return WorkerCurrentRunConfig(
        interactiveApp: WorkerCurrentRunConfig_InteractiveApp());
  }

  @override
  void handleTearDownAll(
      ResolvedExecutionFilterProto resolvedExecutionFilter) {}

  @override
  WorkerSuperRunStatus get superRunStatus => WorkerSuperRunStatus.na;

  @override
  String toString() => 'WorkerSuperRunControllerInteractiveApp{}';
}

/// "classical mode": no hot-restart between running two tests
class _WorkerSuperRunControllerIntegrationTestClassicalMode = __WorkerSuperRunControllerIntegrationTestClassicalMode
    with _$_WorkerSuperRunControllerIntegrationTestClassicalMode;

abstract class __WorkerSuperRunControllerIntegrationTestClassicalMode
    extends WorkerSuperRunController with Store {
  final String filterNameRegex;

  __WorkerSuperRunControllerIntegrationTestClassicalMode(
      {required this.filterNameRegex})
      : super._();

  @observable
  bool seenTearDownAll = false;

  @override
  WorkerCurrentRunConfig _calcCurrentRunConfig() {
    return WorkerCurrentRunConfig(
      integrationTest: WorkerCurrentRunConfig_IntegrationTest(
        reportSuiteInfo: true,
        // this is for flaky test detection. set to non-zero,
        // such that the flaky tests are retried at the worker automatically
        defaultRetryCount:
            GetIt.I.get<WorkerSuperRunStore>().flakyTestTotalAttemptCount - 1,
        executionFilter: ExecutionFilter(
          filterNameRegex: filterNameRegex,
          strategy: ExecutionFilter_Strategy(
              allMatch: ExecutionFilter_Strategy_AllMatch()),
        ),
        autoUpdateGoldenFiles:
            GetIt.I.get<WorkerSuperRunStore>().autoUpdateGoldenFiles,
      ),
    );
  }

  @override
  void handleTearDownAll(ResolvedExecutionFilterProto resolvedExecutionFilter) {
    seenTearDownAll = true;
  }

  @override
  WorkerSuperRunStatus get superRunStatus => seenTearDownAll
      ? WorkerSuperRunStatus.testAllDone
      : WorkerSuperRunStatus.runningTest;

  @override
  String toString() => 'WorkerSuperRunControllerIntegrationTestClassicalMode{'
      'filterNameRegex: $filterNameRegex, '
      'seenTearDownAll: $seenTearDownAll'
      '}';
}

/// "isolation mode": *has* hot-restart between running two tests
class _WorkerSuperRunControllerIntegrationTestIsolationMode = __WorkerSuperRunControllerIntegrationTestIsolationMode
    with _$_WorkerSuperRunControllerIntegrationTestIsolationMode;

abstract class __WorkerSuperRunControllerIntegrationTestIsolationMode
    extends WorkerSuperRunController with Store {
  static const _kTag = '_WorkerSuperRunControllerIntegrationTestIsolationMode';

  final String filterNameRegex;

  @observable
  var state = const _ITIMState.initial();

  __WorkerSuperRunControllerIntegrationTestIsolationMode(
      {required this.filterNameRegex})
      : super._();

  @override
  WorkerCurrentRunConfig _calcCurrentRunConfig() {
    return WorkerCurrentRunConfig(
      integrationTest: WorkerCurrentRunConfig_IntegrationTest(
        reportSuiteInfo: state is _ITIMStateInitial,
        // do *not* handle flaky tests at worker level; instead, handle it at manager level
        defaultRetryCount: 0,
        executionFilter: _calcExecutionFilter(),
        autoUpdateGoldenFiles:
            GetIt.I.get<WorkerSuperRunStore>().autoUpdateGoldenFiles,
      ),
    );
  }

  ExecutionFilter _calcExecutionFilter() => state.map(
        initial: (_) => ExecutionFilter(
          filterNameRegex: filterNameRegex,
          strategy: ExecutionFilter_Strategy(
              firstMatch: ExecutionFilter_Strategy_FirstMatch()),
        ),
        goOn: (s) => ExecutionFilter(
          filterNameRegex: filterNameRegex,
          strategy: ExecutionFilter_Strategy(
            nextMatch: ExecutionFilter_Strategy_NextMatch(
              prevTestName: s.lastExecutedTestName,
            ),
          ),
        ),
        retryLast: (s) => ExecutionFilter(
          // retry this test again (flaky test handling)
          filterNameRegex: RegexUtils.matchFull(s.lastExecutedTestName),
          strategy: ExecutionFilter_Strategy(
              allMatch: ExecutionFilter_Strategy_AllMatch()),
        ),
        finished: (_) => ExecutionFilter(
          // NOTE use "regex match nothing"
          filterNameRegex: RegexUtils.kMatchNothing,
          strategy: ExecutionFilter_Strategy(
              allMatch: ExecutionFilter_Strategy_AllMatch()),
        ),
      );

  @override
  void handleTearDownAll(ResolvedExecutionFilterProto resolvedExecutionFilter) {
    final suiteInfoStore = GetIt.I.get<SuiteInfoStore>();

    final allowExecuteTestNames = resolvedExecutionFilter.allowExecuteTestNames;
    final oldState = state;

    if (allowExecuteTestNames.length > 1) {
      throw Exception(
          '$_kTag expect allowExecuteTestNames to have 0 or 1 entries, '
          'since in this mode, a worker run only executes 0 or 1 tests. '
          'However, currently it is allowExecuteTestNames=$allowExecuteTestNames.');
    }

    final executedTestName = allowExecuteTestNames.firstOrNull;
    final executedTestSucceeded = () {
      if (executedTestName == null) return null;

      final executedTestId =
          suiteInfoStore.suiteInfo!.getEntryIdFromName(executedTestName)!;
      final executedTestState =
          suiteInfoStore.testEntryStateMap[executedTestId].toState();
      if (executedTestState.status != Status.complete) throw AssertionError;

      return executedTestState.result == Result.success;
    }();

    state = _calcNextState(
      oldState: oldState,
      executedTestName: executedTestName,
      executedTestSucceeded: executedTestSucceeded,
    );

    Log.d(
        _kTag,
        'handleTearDownAll end oldState=$oldState newState=$state '
        'allowExecuteTestNames=$allowExecuteTestNames executedTestSucceeded=$executedTestSucceeded');

    if (state is! _ITIMStateFinished) {
      Log.d(_kTag, 'call hot restart');
      GetIt.I.get<VmServiceWrapperService>().hotRestartThrottled();
    }
  }

  @override
  WorkerSuperRunStatus get superRunStatus => state is _ITIMStateFinished
      ? WorkerSuperRunStatus.testAllDone
      : WorkerSuperRunStatus.runningTest;

  static _ITIMState _calcNextState({
    required _ITIMState oldState,
    required String? executedTestName,
    required bool? executedTestSucceeded,
  }) {
    if (oldState is _ITIMStateFinished && executedTestName != null) {
      throw AssertionError();
    }

    if (executedTestName == null) {
      return const _ITIMState.finished();
    }

    if (!executedTestSucceeded!) {
      final lastExecutedTestFailCount = oldState is _ITIMStateRetryLast
          ? (oldState.lastExecutedTestFailCount + 1)
          : 1;
      final shouldRetry = lastExecutedTestFailCount <
          GetIt.I.get<WorkerSuperRunStore>().flakyTestTotalAttemptCount;

      if (shouldRetry) {
        return _ITIMState.retryLast(
          lastExecutedTestName: executedTestName,
          lastExecutedTestFailCount: lastExecutedTestFailCount,
        );
      }
    }

    return _ITIMState.goOn(lastExecutedTestName: executedTestName);
  }

  @override
  String toString() => 'WorkerSuperRunControllerIntegrationTestIsolationMode{'
      'filterNameRegex: $filterNameRegex, '
      'state: $state'
      '}';
}

// ITIM := IntegrationTestIsolationMode
@freezed
class _ITIMState with _$_ITIMState {
  /// Before first test finished
  const factory _ITIMState.initial() = _ITIMStateInitial;

  const factory _ITIMState.goOn({
    required String lastExecutedTestName,
  }) = _ITIMStateGoOn;

  const factory _ITIMState.retryLast({
    required String lastExecutedTestName,
    required int lastExecutedTestFailCount,
  }) = _ITIMStateRetryLast;

  const factory _ITIMState.finished() = _ITIMStateFinished;
}
