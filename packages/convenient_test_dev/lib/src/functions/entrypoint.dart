import 'dart:ui';

import 'package:convenient_test/convenient_test.dart';
import 'package:convenient_test_common/convenient_test_common.dart';
import 'package:convenient_test_dev/src/functions/entrypoint_env_device.dart';
import 'package:convenient_test_dev/src/functions/entrypoint_env_widget.dart';
import 'package:convenient_test_dev/src/functions/execution_env.dart';
import 'package:convenient_test_dev/src/functions/log.dart';
import 'package:convenient_test_dev/src/support/executor.dart';
import 'package:convenient_test_dev/src/support/get_it.dart';
import 'package:convenient_test_dev/src/support/reporter_service.dart';
import 'package:convenient_test_dev/src/support/slot.dart';
import 'package:convenient_test_dev/src/third_party/my_test_compat.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:meta/meta.dart';

/// Please make this the only method in your "main" method.
Future<void> convenientTestMain(
  ConvenientTestSlot slot,
  VoidCallback testBody, {
  ExecutionEnv executionEnv = ExecutionEnv.deviceTest,
}) async {
  myGetIt.registerSingleton<ConvenientTestSlot>(slot);
  myGetIt.registerSingleton<ConvenientTestExecutor>(ConvenientTestExecutor());
  ConvenientTestWrapperWidget.convenientTestActive = true;

  switch (executionEnv) {
    case ExecutionEnv.deviceTest:
      await convenientTestEntrypointWhenEnvDevice(testBody);
      break;
    case ExecutionEnv.widgetTest:
      await convenientTestEntrypointWhenEnvWidget(testBody);
      break;
  }
}

@internal
void collectIntoDeclarerAndExecute(
  VoidCallback testBody, {
  required int? defaultRetry,
  required bool reportSuiteInfo,
  required ExecutionFilter executionFilter,
  required void Function() insideSetup,
}) {
  final declarer = collectIntoDeclarer(
    defaultRetry: defaultRetry,
    body: () {
      // put this tearDownAll *before* everything else (including
      // `IntegrationTestWidgetsFlutterBinding.ensureInitialized` which adds another tearDownAll)
      // thus it should be run lastly
      tearDownAll(_lastTearDownAll);

      insideSetup();

      setUpLogTestStartAndEnd();
      testBody();
    },
  );

  myGetIt.get<ConvenientTestExecutor>()
    ..input = ConvenientTestExecutorInput(
      declarer: declarer,
      reportSuiteInfo: reportSuiteInfo,
      executionFilter: executionFilter,
    )
    ..execute();
}

Future<void> _lastTearDownAll() async {
  // const _kTag = 'LastTearDownAll';

  final reporterService = ReporterService.I;
  if (reporterService != null) {
    // need to `await` to ensure it is sent
    await reporterService.report(ReportItem(
      tearDownAll: TearDownAll(
        resolvedExecutionFilter: myGetIt.get<ConvenientTestExecutor>().resolvedExecutionFilter.toProto(),
      ),
    ));
  }

  // TODO
  // if (CompileTimeConfig.kCIMode) {
  //   Log.i(_kTag, 'wait for a few seconds, hoping everything is really finished');
  //   await Future<void>.delayed(const Duration(seconds: 3));
  //
  //   Log.i(_kTag, 'exit the process');
  //   exit(0);
  // }
}
