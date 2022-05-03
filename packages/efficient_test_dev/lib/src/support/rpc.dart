import 'package:grpc/grpc.dart';
import 'package:test_tool_common/test_tool_common.dart';

TestToolManagerClient createTestToolManagerClientStub({required String host, required int port}) {
  final channel =
      ClientChannel(host, port: port, options: const ChannelOptions(credentials: ChannelCredentials.insecure()));
  return TestToolManagerClient(channel, options: CallOptions(timeout: null));
}
