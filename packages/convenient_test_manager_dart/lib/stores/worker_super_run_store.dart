import 'package:convenient_test_common_dart/convenient_test_common_dart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobx/mobx.dart';

part 'worker_super_run_store.freezed.dart';

part 'worker_super_run_store.g.dart';

/// A "worker run" is the code execution from worker hot-restart to the next hot-restart
/// A "worker super run" is one or multiple "worker run"s
class WorkerSuperRunStore = _WorkerSuperRunStore with _$WorkerSuperRunStore;

abstract class _WorkerSuperRunStore with Store {
  @observable
  WorkerSuperRunController currSuperRunController =
      _WorkerSuperRunControllerIntegrationTestClassicalMode(filterNameRegex: kRegexMatchNothing);
}

enum WorkerRunMode { interactiveApp, integrationTest }

abstract class WorkerSuperRunController {
  const WorkerSuperRunController._();

  factory WorkerSuperRunController.interactiveApp() => _WorkerSuperRunControllerInteractiveApp();

  factory WorkerSuperRunController.integrationTest({
    required String filterNameRegex,
    required bool isolationMode,
  }) =>
      isolationMode
          ? _WorkerSuperRunControllerIntegrationTestIsolationMode(filterNameRegex: filterNameRegex)
          : _WorkerSuperRunControllerIntegrationTestClassicalMode(filterNameRegex: filterNameRegex);

  WorkerCurrentRunConfig calcCurrentRunConfig();

  bool get isInteractiveApp => this is _WorkerSuperRunControllerInteractiveApp;
}

class _WorkerSuperRunControllerInteractiveApp extends WorkerSuperRunController {
  _WorkerSuperRunControllerInteractiveApp() : super._();

  @override
  WorkerCurrentRunConfig calcCurrentRunConfig() {
    return WorkerCurrentRunConfig(interactiveApp: WorkerCurrentRunConfig_InteractiveApp());
  }
}

/// "classical mode": no hot-restart between running two tests
class _WorkerSuperRunControllerIntegrationTestClassicalMode extends WorkerSuperRunController {
  final String filterNameRegex;

  _WorkerSuperRunControllerIntegrationTestClassicalMode({required this.filterNameRegex}) : super._();

  @override
  WorkerCurrentRunConfig calcCurrentRunConfig() {
    return WorkerCurrentRunConfig(
      integrationTest: WorkerCurrentRunConfig_IntegrationTest(
        reportSuiteInfo: true,
        executionFilter: ExecutionFilter(
          filterNameRegex: filterNameRegex,
          strategy: ExecutionFilter_Strategy(allMatch: ExecutionFilter_Strategy_AllMatch()),
        ),
      ),
    );
  }
}

/// "isolation mode": *has* hot-restart between running two tests
class _WorkerSuperRunControllerIntegrationTestIsolationMode extends WorkerSuperRunController {
  final String filterNameRegex;

  var state = const _ITIMState.initial();

  _WorkerSuperRunControllerIntegrationTestIsolationMode({required this.filterNameRegex}) : super._();

  @override
  WorkerCurrentRunConfig calcCurrentRunConfig() {
    return WorkerCurrentRunConfig(
      integrationTest: WorkerCurrentRunConfig_IntegrationTest(
        reportSuiteInfo: state is _ITIMStateInitial,
        executionFilter: _calcExecutionFilter(),
      ),
    );
  }

  ExecutionFilter _calcExecutionFilter() => state.map(
        initial: (_) => ExecutionFilter(
          filterNameRegex: filterNameRegex,
          strategy: ExecutionFilter_Strategy(firstMatch: ExecutionFilter_Strategy_FirstMatch()),
        ),
        middle: (s) => ExecutionFilter(
          filterNameRegex: filterNameRegex,
          strategy: ExecutionFilter_Strategy(
            nextMatch: ExecutionFilter_Strategy_NextMatch(
              prevTestName: s.lastFinishedTestName,
            ),
          ),
        ),
        finished: (_) => ExecutionFilter(
          // NOTE use "regex match nothing"
          filterNameRegex: kRegexMatchNothing,
          strategy: ExecutionFilter_Strategy(allMatch: ExecutionFilter_Strategy_AllMatch()),
        ),
      );
}

// ITIM := IntegrationTestIsolationMode
@freezed
class _ITIMState with _$_ITIMState {
  /// Before first test finished
  const factory _ITIMState.initial() = _ITIMStateInitial;

  const factory _ITIMState.middle({
    required String lastFinishedTestName,
  }) = _ITIMStateMiddle;

  const factory _ITIMState.finished() = _ITIMStateFinished;
}
