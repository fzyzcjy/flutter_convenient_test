import 'package:convenient_test_dev/src/functions/instance.dart';
import 'package:flutter/material.dart';

abstract class ConvenientTestSlot {
  Future<void> appMain(AppMainExecuteMode mode);

  BuildContext? getNavContext(ConvenientTest t);
}

enum AppMainExecuteMode { integrationTest, interactiveApp }
