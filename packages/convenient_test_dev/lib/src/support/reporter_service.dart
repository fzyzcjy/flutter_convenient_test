import 'dart:io';
import 'dart:math';

import 'package:convenient_test_common_dart/convenient_test_common_dart.dart';
import 'package:convenient_test_dev/src/support/get_it.dart';
import 'package:convenient_test_dev/src/support/manager_rpc_service.dart';
import 'package:convenient_test_dev/src/support/spy_declarer.dart';
import 'package:convenient_test_dev/src/support/static_config.dart';
import 'package:convenient_test_dev/src/support/suite_info_converter.dart';
import 'package:intl/intl.dart';

/// `ManagerReportSaverService` vs `WorkerReportSaverService`: See comments on `ManagerReportSaverService`.
abstract class WorkerReportSaverService {
  /// Nullable - e.g. null when in widget test mode since there is no manager
  static WorkerReportSaverService? get I =>
      myGetIt.isRegistered<WorkerReportSaverService>() ? myGetIt.get<WorkerReportSaverService>() : null;

  Future<void> report(ReportItem item);
}

extension ExtWorkerReportSaverService on WorkerReportSaverService {
  Future<void> reportSuiteInfo(SpyDeclarerGroup group) =>
      report(ReportItem(suiteInfoProto: SuiteInfoConverter.convert(group)));
}

class WorkerReportSaverServiceSendToManager implements WorkerReportSaverService {
  @override
  Future<void> report(ReportItem item) => myGetIt.get<ConvenientTestManagerRpcService>().reportSingle(item);
}

class WorkerReportSaverServiceSaveToLocal implements WorkerReportSaverService {
  static const _kTag = 'WorkerReportSaverServiceSaveToLocal';

  final String path;

  const WorkerReportSaverServiceSaveToLocal({required this.path});

  static WorkerReportSaverServiceSaveToLocal? create() {
    final dir = StaticConfig.kWidgetTestReportSaverDirectory ?? '/tmp';
    if (!Directory(dir).existsSync()) {
      Log.i(_kTag, 'will not save report since dir=$dir does not exist');
      return null;
    }

    final filename =
        'WIDGET-TEST-${DateFormat('yyyyMMdd-hhmmss').format(DateTime.now())}-${Random().nextInt(1000).toString().padLeft(3, '0')}.bin';
    final path = '$dir/ConvenientTestWidgetTest/$filename';
    Log.i(_kTag, 'will save report to path=$path');

    File(path).parent.createSync(recursive: true);
    return WorkerReportSaverServiceSaveToLocal(path: path);
  }

  @override
  Future<void> report(ReportItem item) async {
    final request = ReportCollection(items: [item]);
    File(path).writeAsBytesSync(request.writeToBuffer(), mode: FileMode.append);
  }
}
