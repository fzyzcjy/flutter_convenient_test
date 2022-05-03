import 'package:get_it/get_it.dart';
import 'package:test_tool_common/test_tool_common.dart';
import 'package:test_tool_manager/services/test_tool_manager_service.dart';
import 'package:test_tool_manager/services/vm_service_wrapper_service.dart';

class MiscService {
  static const _kTag = 'MiscService';

  Future<void> hotRestartAndRunTests({required String filterNameRegex}) async {
    Log.d(_kTag, 'hotRestartAndRunTests filterNameRegex=$filterNameRegex');
    GetIt.I.get<TestToolManagerService>().activeTestFilter = TestFilter(filterNameRegex: filterNameRegex);
    await GetIt.I.get<VmServiceWrapperService>().hotRestart();
  }
}
