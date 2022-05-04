import 'package:convenient_test_common/convenient_test_common.dart';
import 'package:convenient_test_dev/src/support/slot.dart';
import 'package:get_it/get_it.dart';
import 'package:grpc/grpc.dart';

abstract class ManagerRpcService {
  static const _kTag = 'ManagerRpcService';

  ManagerRpcService();

  factory ManagerRpcService.create() {
    const ciMode = bool.fromEnvironment('CONVENIENT_TEST_CI_MODE', defaultValue: false);
    Log.i(_kTag, 'create ciMode=$ciMode');
    if (ciMode) {
      return ManagerRpcServiceLocalFile();
    } else {
      return ManagerRpcServiceRealConnect();
    }
  }

  Future<void> resetManagerCache();

  Future<void> report(ReportCollection request);

  Future<WorkerMode> getWorkerMode();

  Future<void> reportSingle(ReportItem item) => report(ReportCollection(items: [item]));
}

class ManagerRpcServiceRealConnect extends ManagerRpcService {
  final _client = createConvenientTestManagerClientStub(
      host: GetIt.I.get<ConvenientTestSlot>().managerHost, port: kConvenientTestManagerPort);

  @override
  Future<WorkerMode> getWorkerMode() => _client.getWorkerMode(Empty());

  @override
  Future<void> report(ReportCollection request) => _client.report(request);

  @override
  Future<void> resetManagerCache() => _client.resetManagerCache(Empty());
}

ConvenientTestManagerClient createConvenientTestManagerClientStub({required String host, required int port}) {
  final channel =
      ClientChannel(host, port: port, options: const ChannelOptions(credentials: ChannelCredentials.insecure()));
  return ConvenientTestManagerClient(channel, options: CallOptions(timeout: null));
}

class ManagerRpcServiceLocalFile extends ManagerRpcService {
  static const _kTag = 'RpcServiceLocalFile';

  @override
  Future<WorkerMode> getWorkerMode() async {
    TODO;
  }

  @override
  Future<void> report(ReportCollection request) async {
    TODO;
  }

  @override
  Future<void> resetManagerCache() async {
    Log.d(_kTag, 'resetManagerCache do nothing');
  }
}
