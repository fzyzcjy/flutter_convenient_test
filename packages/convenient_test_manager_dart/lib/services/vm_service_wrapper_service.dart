import 'package:convenient_test_common_dart/convenient_test_common_dart.dart';
import 'package:convenient_test_manager_dart/services/real_vm_service_wrapper_service.dart';


abstract class VmServiceWrapperService {
  static const _kTag = 'VmServiceWrapperBase';

  late ServiceConnectionManager _manager;
  bool get connected;

  Future<void> connect();
  bool get hotRestartActing;
  late ObservableCounter _hotRestartActing;

  bool get hotRestartAvailable;
  Future<void> hotRestartRaw();
 
  late SingleRunningExecutor<void> _hotRestartThrottledExecutor;
  void hotRestartThrottled();
}
