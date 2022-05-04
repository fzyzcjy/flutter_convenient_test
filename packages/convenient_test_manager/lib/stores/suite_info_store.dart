import 'package:convenient_test_common/convenient_test_common.dart';
import 'package:mobx/mobx.dart';

part 'suite_info_store.g.dart';

class SuiteInfoStore = _SuiteInfoStore with _$SuiteInfoStore;

abstract class _SuiteInfoStore with Store {
  @observable
  SuiteInfo? suiteInfo;

  void clear() {
    suiteInfo = null;
  }
}
