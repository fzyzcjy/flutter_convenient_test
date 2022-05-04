import 'package:convenient_test_dev/src/support/get_it.dart';
import 'package:convenient_test_dev/src/support/manager_rpc_service.dart';
import 'package:convenient_test_dev/src/utils/errors.dart';

Future<void> setup() async {
  setUpConvenientTestExceptionReporter();
  setUpFlutterOnError();

  await myGetIt.get<ManagerRpcService>().resetManagerCache();
}
