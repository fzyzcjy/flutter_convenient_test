import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

class MyIntegrationTestWidgetsFlutterBinding extends IntegrationTestWidgetsFlutterBinding {
  // NOTE COPIED from [IntegrationTestWidgetsFlutterBinding]
  static WidgetsBinding ensureInitialized() {
    if (WidgetsBinding.instance == null) {
      MyIntegrationTestWidgetsFlutterBinding(); // NOTE MODIFIED
    }
    assert(WidgetsBinding.instance is MyIntegrationTestWidgetsFlutterBinding); // NOTE MODIFIED
    return WidgetsBinding.instance!;
  }

  // NOTE HACK #138
  @override
  TestBindingEventSource get pointerEventSource => TestBindingEventSource.test;

  @override
  void handlePointerEvent(PointerEvent event) {
    print('hi handlePointerEvent $event');
    super.handlePointerEvent(event);
  }
}
