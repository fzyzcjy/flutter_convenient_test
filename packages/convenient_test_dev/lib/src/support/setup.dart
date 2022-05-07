import 'package:convenient_test_dev/src/support/executor.dart';
import 'package:convenient_test_dev/src/support/get_it.dart';
import 'package:convenient_test_dev/src/utils/errors.dart';

Future<void> setup() async {
  setUpConvenientTestExceptionReporter();
  setUpFlutterOnError();
  myGetIt.registerSingleton<ConvenientTestExecutor>(ConvenientTestExecutor());
}
