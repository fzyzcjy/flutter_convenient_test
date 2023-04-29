import 'package:convenient_test_common/convenient_test_common.dart';
import 'package:grpc/grpc.dart';

abstract class ConvenientTestManagerRpcService {
  Future<void> reportSingle(ReportItem item);
}

class ConvenientTestManagerRpcServiceReal implements ConvenientTestManagerRpcService {
  final ConvenientTestManagerClient _client;

  factory ConvenientTestManagerRpcServiceReal() {
    final channel = ClientChannel(
      kConvenientTestManagerHost,
      port: kConvenientTestManagerPort,
      options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
    );
    final client = ConvenientTestManagerClient(channel, options: CallOptions(timeout: null));
    return ConvenientTestManagerRpcServiceReal._(client);
  }

  ConvenientTestManagerRpcServiceReal._(this._client);

  @override
  Future<void> reportSingle(ReportItem item) => _client.report(ReportCollection(items: [item]));

  Future<WorkerCurrentRunConfig> getWorkerCurrentRunConfig() => _client.getWorkerCurrentRunConfig(Empty());
}

class ConvenientTestManagerRpcServiceFake implements ConvenientTestManagerRpcService {
  @override
  Future<void> reportSingle(ReportItem item) async {
    // no op
  }
}
