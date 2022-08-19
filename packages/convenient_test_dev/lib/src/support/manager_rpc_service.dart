import 'package:convenient_test_common/convenient_test_common.dart';
import 'package:convenient_test_dev/src/support/compile_time_config.dart';
import 'package:grpc/grpc.dart';

extension ExtConvenientTestManagerClient on ConvenientTestManagerClient {
  static ConvenientTestManagerClient create() {
    final channel = ClientChannel(
      CompileTimeConfig.dConvenientTestManagerHost,
      port: CompileTimeConfig.dConvenientTestManagerPort,
      options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
    );
    return ConvenientTestManagerClient(channel, options: CallOptions(timeout: null));
  }

  Future<void> reportSingle(ReportItem item) => report(ReportCollection(items: [item]));
}
