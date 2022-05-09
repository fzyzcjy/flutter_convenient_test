import 'dart:io';

import 'package:convenient_test_common_dart/convenient_test_common_dart.dart';
import 'package:convenient_test_manager_dart/misc/config.dart';
import 'package:convenient_test_manager_dart/services/fs_service.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';

part 'report_saver_service.g.dart';

class ReportSaverService = _ReportSaverService with _$ReportSaverService;

abstract class _ReportSaverService with Store {
  static const _kTag = 'ReportSaverService';

  @observable
  var enable = _initialEnable;

  late Future<String> _reportPath;

  Future<void> save(ReportCollection request) async {
    if (!enable) return;

    // need to be sync, otherwise when two reports come together they may conflict
    File(await _reportPath).writeAsBytesSync(request.writeToBuffer(), mode: FileMode.append);
  }

  void createNewReportTarget() {
    Log.d(_kTag, 'createNewReportTarget');
    _reportPath = _createReportPath();
  }

  static Future<String> _createReportPath() async {
    final stem = DateFormat('yyyyMMdd_hhmmss').format(DateTime.now());
    final path =
        '${await GetIt.I.get<FsService>().getTemporaryDirectory()}/ConvenientTest_Report_$stem.$kReportFileExtension';
    Log.i(_kTag, '*** Report data will be written to path: $path ***');
    return path;
  }
}

bool get _initialEnable => GlobalConfig.ciMode;
