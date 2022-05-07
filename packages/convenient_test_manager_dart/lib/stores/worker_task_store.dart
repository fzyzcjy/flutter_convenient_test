import 'package:convenient_test_common_dart/convenient_test_common_dart.dart';
import 'package:mobx/mobx.dart';

part 'worker_task_store.g.dart';

class WorkerTaskStore = _WorkerTaskStore with _$WorkerTaskStore;

abstract class _WorkerTaskStore with Store {
  @observable
  WorkerRunMode runMode = WorkerRunMode.interactiveApp;

  @observable
  var filterNameRegex = kRegexMatchNothing;

  WorkerCurrentRunConfig calcCurrentRunConfig() {
    switch (runMode) {
      case WorkerRunMode.interactiveApp:
        return WorkerCurrentRunConfig(interactiveApp: WorkerCurrentRunConfig_InteractiveApp());
      case WorkerRunMode.integrationTest:
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
}

enum WorkerRunMode { interactiveApp, integrationTest }
