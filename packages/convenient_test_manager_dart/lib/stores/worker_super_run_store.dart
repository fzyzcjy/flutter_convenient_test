import 'package:convenient_test_common_dart/convenient_test_common_dart.dart';
import 'package:mobx/mobx.dart';

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

  _WorkerSuperRunControllerIntegrationTestIsolationMode({required this.filterNameRegex}) : super._();

  @override
  WorkerCurrentRunConfig calcCurrentRunConfig() {
    return WorkerCurrentRunConfig(
      integrationTest: WorkerCurrentRunConfig_IntegrationTest(
        reportSuiteInfo: TODO,
        executionFilter: ExecutionFilter(
          filterNameRegex: filterNameRegex,
          strategy: TODO,
        ),
      ),
    );
  }
}
