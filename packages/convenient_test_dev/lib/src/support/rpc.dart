import 'package:grpc/grpc.dart';
import 'package:convenient_test_common/convenient_test_common.dart';

ConvenientTestManagerClient createConvenientTestManagerClientStub({required String host, required int port}) {
  final channel =
      ClientChannel(host, port: port, options: const ChannelOptions(credentials: ChannelCredentials.insecure()));
  return ConvenientTestManagerClient(channel, options: CallOptions(timeout: null));
}
