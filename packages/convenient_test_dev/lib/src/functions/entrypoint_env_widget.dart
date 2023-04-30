import 'dart:ui';

import 'package:convenient_test_dev/src/functions/log.dart';
import 'package:convenient_test_dev/src/support/get_it.dart';
import 'package:convenient_test_dev/src/support/reporter_service.dart';
import 'package:convenient_test_dev/src/support/static_config.dart';
import 'package:meta/meta.dart';

@internal
Future<void> convenientTestEntrypointWhenEnvWidget(VoidCallback testBody) async {
  final widgetTestReportSaverDirectory = StaticConfig.kWidgetTestReportSaverDirectory;
  if (widgetTestReportSaverDirectory != null) {
    myGetIt.registerSingleton<ReporterService>(
        ReporterServiceSaveToLocal(reportSaverDirectory: widgetTestReportSaverDirectory));
  } else {
    // do not register - since we will not report to anywhere
  }

  setUpLogTestStartAndEnd();
  testBody();
}
