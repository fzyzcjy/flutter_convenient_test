import 'dart:io';

import 'package:convenient_test_common/convenient_test_common.dart';
import 'package:convenient_test_dev/src/support/compile_time_config.dart';
import 'package:grpc/grpc.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';

abstract class ManagerRpcService {
  static const _kTag = 'ManagerRpcService';

  ManagerRpcService();

  factory ManagerRpcService.create() {
    Log.i(_kTag, 'create ciMode=${CompileTimeConfig.kCIMode}');
    if (CompileTimeConfig.kCIMode) {
      return ManagerRpcServiceLocalFile();
    } else {
      return ManagerRpcServiceRealConnect();
    }
  }

  Future<void> report(ReportCollection request);

  Future<WorkerCurrentRunConfig> getWorkerCurrentRunConfig();

  Future<void> reportSingle(ReportItem item) => report(ReportCollection(items: [item]));
}

class ManagerRpcServiceRealConnect extends ManagerRpcService {
  final _client =
      createConvenientTestManagerClientStub(host: kConvenientTestManagerHost, port: kConvenientTestManagerPort);

  @override
  Future<WorkerCurrentRunConfig> getWorkerCurrentRunConfig() => _client.getWorkerCurrentRunConfig(Empty());

  @override
  Future<void> report(ReportCollection request) => _client.report(request);
}

ConvenientTestManagerClient createConvenientTestManagerClientStub({required String host, required int port}) {
  final channel =
      ClientChannel(host, port: port, options: const ChannelOptions(credentials: ChannelCredentials.insecure()));
  return ConvenientTestManagerClient(channel, options: CallOptions(timeout: null));
}

class ManagerRpcServiceLocalFile extends ManagerRpcService {
  static const _kTag = 'RpcServiceLocalFile';

  // should be "late", otherwise it accesses platform calls too early
  late final Future<String> reportPath = _createReportPath();

  @override
  Future<WorkerCurrentRunConfig> getWorkerCurrentRunConfig() async {
    return WorkerCurrentRunConfig(
      integrationTest: WorkerModeIntegrationTest(
        // run all tests
        filterNameRegex: '.*',
      ),
    );
  }

  @override
  Future<void> report(ReportCollection request) async {
    // need to be sync, otherwise when two reports come together they may conflict
    File(await reportPath).writeAsBytesSync(request.writeToBuffer(), mode: FileMode.append);
  }

  static Future<String> _createReportPath() async {
    final stem = DateFormat('yyyyMMdd_hhmmss').format(DateTime.now());
    final path = '${(await getTemporaryDirectory()).path}/ConvenientTest_Report_$stem.$kReportFileExtension';
    Log.i(_kTag, '*** Report data will be written to path: $path ***');
    return path;
  }
}
