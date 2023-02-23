import 'package:convenient_test_common/convenient_test_common.dart';
import 'package:convenient_test_manager_dart/services/vm_service_wrapper_service.dart';

class FakeVmServiceWrapper extends VmServiceWrapperService {
  @override
  Future<void> connect() async {}

  @override
  // TODO: implement connected
  bool get connected => true;

  @override
  // TODO: implement hotRestartAvailable
  bool get hotRestartAvailable => false;

  @override
  Future<void> hotRestartRaw() async {
    Log.d('FakeVMServiceWrapper', 'user requested hotRestartRaw but doing nothing');
  }

  @override
  void hotRestartThrottled() {
    Log.d('FakeVMServiceWrapper', 'user requested hotRestartThrottled but doing nothing');
  }

  @override
  // TODO: implement hotRestartActing
  bool get hotRestartActing => false;
}
