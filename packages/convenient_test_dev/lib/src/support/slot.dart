import 'package:flutter/material.dart';
import 'package:convenient_test_dev/src/functions/core.dart';

abstract class ConvenientTestSlot {
  Future<void> startApp(ConvenientTest t);

  BuildContext? getNavContext(ConvenientTest t);

  String get managerHost;
}
