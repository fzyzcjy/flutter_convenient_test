import 'package:get_it/get_it.dart';
import 'package:convenient_test_common/convenient_test_common.dart';

class ConvenientTestManagerToWorkerService {
  ConvenientTestManagerToWorkerService() {
    final rpcClient = GetIt.I.get<ConvenientTestManagerClient>();
    rpcClient.managerToWorkerActionStream(Empty()).listen(_handleAction);
  }

  void _handleAction(ManagerToWorkerAction action) {
    // nothing yet
  }
}
