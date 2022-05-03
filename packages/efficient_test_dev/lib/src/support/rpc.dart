import 'package:grpc/grpc.dart';
import 'package:efficient_test_common/efficient_test_common.dart';

TestToolManagerClient createTestToolManagerClientStub({required String host, required int port}) {
  final channel =
      ClientChannel(host, port: port, options: const ChannelOptions(credentials: ChannelCredentials.insecure()));
  return TestToolManagerClient(channel, options: CallOptions(timeout: null));
}
