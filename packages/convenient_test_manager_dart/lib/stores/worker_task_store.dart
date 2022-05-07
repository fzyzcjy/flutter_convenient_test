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
    return TODO;
  }
}

enum WorkerRunMode { interactiveApp, integrationTest }
