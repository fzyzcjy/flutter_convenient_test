import 'package:flutter/material.dart';
import 'package:efficient_test_dev/src/functions/core.dart';

abstract class TestToolSlot {
  Future<void> startApp(TestTool t);

  BuildContext? getNavContext(TestTool t);

  String get managerHost;
}
