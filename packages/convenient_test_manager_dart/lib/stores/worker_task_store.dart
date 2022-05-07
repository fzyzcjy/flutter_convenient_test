import 'package:convenient_test_common_dart/convenient_test_common_dart.dart';
import 'package:mobx/mobx.dart';

part 'worker_task_store.g.dart';

class WorkerTaskStore = _WorkerTaskStore with _$WorkerTaskStore;

abstract class _WorkerTaskStore with Store {
  @observable
  var superRunController = WorkerSuperRunControllerIntegrationTestClassicalMode(filterNameRegex: kRegexMatchNothing);
}

enum WorkerRunMode { interactiveApp, integrationTest }

/// A "worker run" is the code execution from worker hot-restart to the next hot-restart
/// A "worker super run" is one or multiple "worker run"s
abstract class WorkerSuperRunController {
  const WorkerSuperRunController();

  WorkerCurrentRunConfig calcCurrentRunConfig();
}

class WorkerSuperRunControllerInteractiveApp extends WorkerSuperRunController {
  @override
  WorkerCurrentRunConfig calcCurrentRunConfig() {
    return WorkerCurrentRunConfig(interactiveApp: WorkerCurrentRunConfig_InteractiveApp());
  }
}

/// "classical mode": no hot-restart between running two tests
class WorkerSuperRunControllerIntegrationTestClassicalMode extends WorkerSuperRunController {
  final String filterNameRegex;

  WorkerSuperRunControllerIntegrationTestClassicalMode({required this.filterNameRegex});

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
class WorkerSuperRunControllerIntegrationTestIsolationMode extends WorkerSuperRunController {
  final String filterNameRegex;

  WorkerSuperRunControllerIntegrationTestIsolationMode({required this.filterNameRegex});

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
