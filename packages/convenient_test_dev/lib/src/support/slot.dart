import 'package:convenient_test_dev/src/functions/core.dart';
import 'package:flutter/material.dart';

abstract class ConvenientTestSlot {
  Future<void> appMain(AppMainExecuteMode mode);

  BuildContext? getNavContext(ConvenientTest t);

  String get managerHost;
}

enum AppMainExecuteMode { integrationTest, interactiveApp }
