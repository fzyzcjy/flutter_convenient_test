import 'package:get_it/get_it.dart';
import 'package:convenient_test_common/convenient_test_common.dart';
import 'package:convenient_test_manager/services/convenient_test_manager_service.dart';
import 'package:convenient_test_manager/services/vm_service_wrapper_service.dart';

class MiscService {
  static const _kTag = 'MiscService';

  Future<void> hotRestartAndRunTests({required String filterNameRegex}) async {
    Log.d(_kTag, 'hotRestartAndRunTests filterNameRegex=$filterNameRegex');
    GetIt.I.get<ConvenientTestManagerService>().activeTestFilter = TestFilter(filterNameRegex: filterNameRegex);
    await GetIt.I.get<VmServiceWrapperService>().hotRestart();
  }
}
