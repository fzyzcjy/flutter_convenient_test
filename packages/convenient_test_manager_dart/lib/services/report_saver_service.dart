import 'dart:io';

import 'package:convenient_test_common_dart/convenient_test_common_dart.dart';
import 'package:convenient_test_manager_dart/services/fs_service.dart';
import 'package:convenient_test_manager_dart/stores/global_config_store.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

part 'report_saver_service.g.dart';

class ReportSaverService = _ReportSaverService with _$ReportSaverService;

abstract class _ReportSaverService with Store {
  static const _kTag = 'ReportSaverService';

  bool get enable => GlobalConfigStore.config.enableReportSaver;

  set enable(bool val) => GlobalConfigStore.config.enableReportSaver = val;

  Future<void> save(ReportCollection request) async {
    if (!enable) return;

    // need to be sync, otherwise when two reports come together they may conflict
    File(await _getReportPath()).writeAsBytesSync(request.writeToBuffer(), mode: FileMode.append);
  }

  Future<void> clear() async {
    Log.d(_kTag, 'clear');
    final path = File(await _getReportPath());

    if (path.existsSync()) path.deleteSync();
  }

  static Future<String> _getReportPath() async {
    return
        // ignore: prefer_interpolation_to_compose_strings
        await GetIt.I.get<FsService>().getActiveSuperRunDataSubDirectory(category: 'Report') +
            'report.$kReportFileExtension';
  }
}
