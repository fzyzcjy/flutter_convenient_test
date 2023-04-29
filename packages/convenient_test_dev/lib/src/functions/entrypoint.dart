import 'dart:ui';

import 'package:convenient_test_dev/src/functions/entrypoint_env_device.dart';
import 'package:convenient_test_dev/src/functions/entrypoint_env_widget.dart';
import 'package:convenient_test_dev/src/functions/execution_env.dart';
import 'package:convenient_test_dev/src/support/get_it.dart';
import 'package:convenient_test_dev/src/support/slot.dart';

/// Please make this the only method in your "main" method.
Future<void> convenientTestMain(
  ConvenientTestSlot slot,
  VoidCallback testBody, {
  ExecutionEnv executionEnv = ExecutionEnv.deviceTest,
}) async {
  myGetIt.registerSingleton<ConvenientTestSlot>(slot);

  switch (executionEnv) {
    case ExecutionEnv.deviceTest:
      await convenientTestEntrypointWhenEnvDevice(testBody);
      break;
    case ExecutionEnv.widgetTest:
      await convenientTestEntrypointWhenEnvWidget(testBody);
      break;
  }
}
