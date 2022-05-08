import 'dart:io';

import 'package:convenient_test_common_dart/convenient_test_common_dart.dart';
import 'package:convenient_test_manager_dart/services/fs_service.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';

class ReportSaverService {
  static const _kTag = 'ReportSaverService';

  Future<void> save(ReportCollection request) async {
    // need to be sync, otherwise when two reports come together they may conflict
    File(await reportPath).writeAsBytesSync(request.writeToBuffer(), mode: FileMode.append);
  }

  static Future<String> _createReportPath() async {
    final stem = DateFormat('yyyyMMdd_hhmmss').format(DateTime.now());
    final path =
        '${await GetIt.I.get<FsService>().getTemporaryDirectory()}/ConvenientTest_Report_$stem.$kReportFileExtension';
    Log.i(_kTag, '*** Report data will be written to path: $path ***');
    return path;
  }
}
