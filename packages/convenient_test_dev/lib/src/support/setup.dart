import 'package:convenient_test_dev/src/utils/errors.dart';

Future<void> setup() async {
  setUpConvenientTestExceptionReporter();
  setUpFlutterOnError();
}
