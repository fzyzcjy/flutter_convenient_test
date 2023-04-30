import 'dart:ui';

import 'package:convenient_test_dev/src/functions/log.dart';
import 'package:convenient_test_dev/src/support/manager_rpc_service.dart';
import 'package:meta/meta.dart';

@internal
Future<void> convenientTestEntrypointWhenEnvWidget(VoidCallback testBody) async {
  TODO_register_reporter_service;
  setUpLogTestStartAndEnd();
  testBody();
}
