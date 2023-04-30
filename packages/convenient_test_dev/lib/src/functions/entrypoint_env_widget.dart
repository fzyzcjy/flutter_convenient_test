import 'dart:math';
import 'dart:ui';

import 'package:convenient_test_common_dart/convenient_test_common_dart.dart';
import 'package:convenient_test_dev/src/functions/log.dart';
import 'package:convenient_test_dev/src/support/get_it.dart';
import 'package:convenient_test_dev/src/support/reporter_service.dart';
import 'package:convenient_test_dev/src/support/spy_declarer.dart';
import 'package:convenient_test_dev/src/support/static_config.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';

const _kTag = 'entrypoint_env_widget';

@internal
Future<void> convenientTestEntrypointWhenEnvWidget(VoidCallback testBody) async {
  final widgetTestReportSaverDirectory = StaticConfig.kWidgetTestReportSaverDirectory;
  if (widgetTestReportSaverDirectory != null) {
    final path = '$widgetTestReportSaverDirectory/${_createReportName()}';
    Log.i(_kTag, 'will save report to path=$path');
    myGetIt.registerSingleton<ReporterService>(ReporterServiceSaveToLocal(path: path));
  } else {
    // do not register - since we will not report to anywhere
    Log.i(_kTag, 'will not save any report');
  }

  setUpLogTestStartAndEnd();
  final spyDeclarerGroup = SpyDeclarer.withSpy(testBody);

  await ReporterService.I?.reportSuiteInfo(spyDeclarerGroup);
}

String _createReportName() =>
    'WIDGET-TEST-${DateFormat('yyyyMMdd-hhmmss').format(DateTime.now())}-${Random().nextInt(1000).toString().padLeft(3, '0')}.bin';
