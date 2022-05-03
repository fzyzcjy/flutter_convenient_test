import 'package:flutter/material.dart';
import 'package:test_tool_worker_dev/src/functions/core.dart';

abstract class TestToolSlot {
  Future<void> startApp(TestTool t);

  BuildContext? getNavContext(TestTool t);

  String get managerHost;
}
