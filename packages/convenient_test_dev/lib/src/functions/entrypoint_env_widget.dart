import 'dart:async';

import 'package:convenient_test_dev/src/support/get_it.dart';
import 'package:convenient_test_dev/src/support/reporter_service.dart';
import 'package:convenient_test_dev/src/support/spy_declarer.dart';
import 'package:meta/meta.dart';

@internal
Future<void> convenientTestEntrypointWhenEnvWidget(
    FutureOr<void> Function() testBody) async {
  final workerReportSaverService = WorkerReportSaverServiceSaveToLocal.create();
  if (workerReportSaverService != null) {
    myGetIt
        .registerSingleton<WorkerReportSaverService>(workerReportSaverService);
  }

  // https://github.com/fzyzcjy/yplusplus/issues/8554#issuecomment-1530977507
  // setUpLogTestStartAndEnd();

  final spyDeclarerResult = SpyDeclarer.withSpy(testBody);
  await spyDeclarerResult.item1;

  await WorkerReportSaverService.I?.reportSuiteInfo(spyDeclarerResult.item2);
}
