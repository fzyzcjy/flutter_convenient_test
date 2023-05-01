import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

enum ExecutionEnv {
  /// Run with a simulator / real device, with ConvenientTestManager, etc
  deviceTest,

  /// Run without a simulator / real device, just like a standard widget test
  widgetTest;

  factory ExecutionEnv.detect() {
    final binding = TestWidgetsFlutterBinding.instance;
    if (binding is IntegrationTestWidgetsFlutterBinding) return ExecutionEnv.deviceTest;
    if (binding is AutomatedTestWidgetsFlutterBinding) return ExecutionEnv.widgetTest;
    throw Exception('unknown binding=${binding.runtimeType}');
  }
}
