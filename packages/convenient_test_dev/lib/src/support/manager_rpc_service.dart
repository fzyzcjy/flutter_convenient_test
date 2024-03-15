import 'package:convenient_test_common/convenient_test_common.dart';
import 'package:grpc/grpc.dart';

class ConvenientTestManagerRpcService {
  final ConvenientTestManagerClient _client;

  factory ConvenientTestManagerRpcService() {
    final channel = ClientChannel(
      kConvenientTestManagerHost,
      port: kConvenientTestManagerPort,
      options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
    );
    final client = ConvenientTestManagerClient(channel,
        options: CallOptions(timeout: null));
    return ConvenientTestManagerRpcService._(client);
  }

  ConvenientTestManagerRpcService._(this._client);

  Future<void> reportSingle(ReportItem item) =>
      _client.report(ReportCollection(items: [item]));

  Future<WorkerCurrentRunConfig> getWorkerCurrentRunConfig() =>
      _client.getWorkerCurrentRunConfig(Empty());
}
