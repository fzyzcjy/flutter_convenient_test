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
  Future<void> hotRestartRaw() {
    throw UnimplementedError();
  }

  @override
  void hotRestartThrottled() {
    throw UnimplementedError();
  }

  @override
  // TODO: implement hotRestartActing
  bool get hotRestartActing => false;
}
