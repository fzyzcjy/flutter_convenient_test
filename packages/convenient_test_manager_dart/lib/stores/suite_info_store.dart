import 'package:convenient_test_common_dart/convenient_test_common_dart.dart';
import 'package:convenient_test_manager_dart/stores/log_store.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:test_api/src/backend/state.dart'; // ignore: implementation_imports

part 'suite_info_store.g.dart';

class SuiteInfoStore = _SuiteInfoStore with _$SuiteInfoStore;

abstract class _SuiteInfoStore with Store {
  @observable
  SuiteInfo? suiteInfo;

  final testEntryStateMap = ObservableDefaultMap<int, TestEntryState>(
      createDefaultValue: (_) => TestEntryState(status: 'pending', result: 'success'));

  SimplifiedStateEnum getSimplifiedState(int testInfoId) =>
      testEntryStateMap[testInfoId].toSimplifiedStateEnum(isFlaky: GetIt.I.get<LogStore>().isTestFlaky(testInfoId));

  void clear() {
    suiteInfo = null;
    testEntryStateMap.clear();
  }
}

extension ExtTestEntryState on TestEntryState {
  State toState() => State(Status.parse(status), Result.parse(result));

  SimplifiedStateEnum toSimplifiedStateEnum({required bool isFlaky}) =>
      toState().toSimplifiedStateEnum(isFlaky: isFlaky);
}

extension ExtState on State {
  SimplifiedStateEnum toSimplifiedStateEnum({required bool isFlaky}) {
    switch (status) {
      case Status.pending:
        return SimplifiedStateEnum.pending;
      case Status.running:
        return SimplifiedStateEnum.running;
      case Status.complete:
        switch (result) {
          case Result.success:
            return isFlaky ? SimplifiedStateEnum.completeSuccessButFlaky : SimplifiedStateEnum.completeSuccess;
          case Result.skipped:
            return SimplifiedStateEnum.completeSkipped;
          case Result.failure:
          case Result.error:
            return SimplifiedStateEnum.completeFailureOrError;
          default:
            throw Exception;
        }
      default:
        throw Exception;
    }
  }
}

// avoid name conflict
typedef TestApiState = State;

// simplified: It is possible to have combination like `running + failed`, but we all think it as `running`
enum SimplifiedStateEnum {
  pending,
  // can be running+success/skipped/failure/error, but we group into one
  running,
  completeSuccess,
  completeSuccessButFlaky,
  completeSkipped,
  completeFailureOrError,
}
