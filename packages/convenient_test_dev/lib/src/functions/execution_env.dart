import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

enum ExecutionEnv {
  /// Run with a simulator / real device, with ConvenientTestManager, etc
  deviceTest,

  /// Run without a simulator / real device, just like a standard widget test
  widgetTest;

  T map<T>({
    required T Function(LiveTestWidgetsFlutterBinding binding) deviceTest,
    required T Function(AutomatedTestWidgetsFlutterBinding binding) widgetTest,
  }) {
    switch (this) {
      case ExecutionEnv.deviceTest:
        return deviceTest(LiveTestWidgetsFlutterBinding.instance);
      case ExecutionEnv.widgetTest:
        return widgetTest(AutomatedTestWidgetsFlutterBinding.instance);
    }
  }

  factory ExecutionEnv.detect() {
    final binding = TestWidgetsFlutterBinding.instance;
    if (binding is IntegrationTestWidgetsFlutterBinding) return ExecutionEnv.deviceTest;
    if (binding is AutomatedTestWidgetsFlutterBinding) return ExecutionEnv.widgetTest;
    throw Exception('unknown binding=${binding.runtimeType}');
  }
}
