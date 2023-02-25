import 'package:convenient_test_common/convenient_test_common.dart';
import 'package:convenient_test_manager_dart/services/vm_service_wrapper_service.dart';

class FakeVmServiceWrapper extends VmServiceWrapperService {
  @override
  Future<void> connect() async {}

  @override
  bool get connected => true;

  @override
  bool get hotRestartAvailable => false;

  @override
  Future<void> hotRestartRaw() async {
    Log.d('FakeVMServiceWrapper',
        'user requested hotRestartRaw but doing nothing');
  }

  @override
  void hotRestartThrottled() {
    Log.d('FakeVMServiceWrapper',
        'user requested hotRestartThrottled but doing nothing');
  }

  @override
  bool get hotRestartActing => false;
}
