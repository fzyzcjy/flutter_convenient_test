import 'package:convenient_test_common/convenient_test_common.dart';
import 'package:convenient_test_dev/src/support/get_it.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:grpc/grpc.dart';

extension ExtConvenientTestManagerClient on ConvenientTestManagerClient {
  static ConvenientTestManagerClient create() {
    String managerHostAddr = kConvenientTestManagerHost;

    final deviceInfoMap = myGetIt.get<BaseDeviceInfo>().toMap();
    if (deviceInfoMap.containsKey('isPhysicalDevice') &&
        !(deviceInfoMap['isPhysicalDevice'] as bool) &&
        kAutoDetectAVD) {
      Log.i('gRPCSetup',
          'Android Virtual Device Detected. Overriding host address with 10.0.2.2');
      managerHostAddr = '10.0.2.2';
    }

    final channel = ClientChannel(
      managerHostAddr,
      port: kConvenientTestManagerPort,
      options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
    );
    return ConvenientTestManagerClient(channel, options: CallOptions(timeout: null));
  }

  Future<void> reportSingle(ReportItem item) => report(ReportCollection(items: [item]));
}
