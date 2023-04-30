import 'package:convenient_test_common_dart/convenient_test_common_dart.dart';
import 'package:convenient_test_dev/src/support/get_it.dart';
import 'package:convenient_test_dev/src/support/manager_rpc_service.dart';

abstract class ReporterService {
  /// Nullable - e.g. null when in widget test mode since there is no manager
  static ReporterService? get I => myGetIt.isRegistered<ReporterService>() ? ReporterService.I : null;

  Future<void> report(ReportItem item);
}

class ReporterServiceSendToManager implements ReporterService {
  @override
  Future<void> report(ReportItem item) => myGetIt.get<ConvenientTestManagerRpcService>().reportSingle(item);
}

class ReporterServiceSaveToLocal implements ReporterService {
  final String reportSaverDirectory;

  const ReporterServiceSaveToLocal({required this.reportSaverDirectory});

  @override
  Future<void> report(ReportItem item) async {
    TODO;
  }
}
