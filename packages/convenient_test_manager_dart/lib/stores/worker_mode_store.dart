import 'package:convenient_test_common/convenient_test_common.dart';
import 'package:mobx/mobx.dart';

part 'worker_mode_store.g.dart';

final _kFallbackWorkerMode =
    WorkerMode(integrationTest: WorkerModeIntegrationTest(filterNameRegex: kRegexMatchNothing));

class WorkerModeStore = _WorkerModeStore with _$WorkerModeStore;

abstract class _WorkerModeStore with Store {
  @observable
  WorkerMode activeWorkerMode = _kFallbackWorkerMode;
}
