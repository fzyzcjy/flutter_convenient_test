import 'dart:async';

import 'package:convenient_test_dev/src/functions/log.dart';
import 'package:convenient_test_dev/src/support/get_it.dart';
import 'package:convenient_test_dev/src/support/reporter_service.dart';
import 'package:convenient_test_dev/src/support/spy_declarer.dart';
import 'package:meta/meta.dart';

@internal
Future<void> convenientTestEntrypointWhenEnvWidget(FutureOr<void> Function() testBody) async {
  final workerReportSaverService = WorkerReportSaverServiceSaveToLocal.create();
  if (workerReportSaverService != null) {
    myGetIt.registerSingleton<WorkerReportSaverService>(workerReportSaverService);
  }

  setUpLogTestStartAndEnd();
  final spyDeclarerResult = SpyDeclarer.withSpy(testBody);
  await spyDeclarerResult.item1;

  await WorkerReportSaverService.I?.reportSuiteInfo(spyDeclarerResult.item2);
}
