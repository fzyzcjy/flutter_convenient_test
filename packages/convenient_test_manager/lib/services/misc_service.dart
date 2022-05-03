import 'package:get_it/get_it.dart';
import 'package:efficient_test_common/efficient_test_common.dart';
import 'package:efficient_test_manager/services/efficient_test_manager_service.dart';
import 'package:efficient_test_manager/services/vm_service_wrapper_service.dart';

class MiscService {
  static const _kTag = 'MiscService';

  Future<void> hotRestartAndRunTests({required String filterNameRegex}) async {
    Log.d(_kTag, 'hotRestartAndRunTests filterNameRegex=$filterNameRegex');
    GetIt.I.get<TestToolManagerService>().activeTestFilter = TestFilter(filterNameRegex: filterNameRegex);
    await GetIt.I.get<VmServiceWrapperService>().hotRestart();
  }
}
