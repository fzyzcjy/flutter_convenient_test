import 'dart:ui';

import 'package:convenient_test/convenient_test.dart';
import 'package:convenient_test_dev/src/functions/log.dart';
import 'package:meta/meta.dart';

@internal
Future<void> convenientTestEntrypointWhenEnvWidget(VoidCallback testBody) async {
  ConvenientTestWrapperWidget.convenientTestActive = true;

  setUpLogTestStartAndEnd();
  testBody();
}
