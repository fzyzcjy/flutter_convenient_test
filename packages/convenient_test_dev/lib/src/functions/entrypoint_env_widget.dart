import 'dart:ui';

import 'package:convenient_test_dev/src/functions/log.dart';
import 'package:meta/meta.dart';

@internal
Future<void> convenientTestEntrypointWhenEnvWidget(VoidCallback testBody) async {
  setUpLogTestStartAndEnd();
  testBody();
}
