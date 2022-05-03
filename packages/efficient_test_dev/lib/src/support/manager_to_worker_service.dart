import 'package:get_it/get_it.dart';
import 'package:efficient_test_common/efficient_test_common.dart';

class TestToolManagerToWorkerService {
  TestToolManagerToWorkerService() {
    final rpcClient = GetIt.I.get<TestToolManagerClient>();
    rpcClient.managerToWorkerActionStream(Empty()).listen(_handleAction);
  }

  void _handleAction(ManagerToWorkerAction action) {
    // nothing yet
  }
}
