import 'package:convenient_test_dev/src/support/manager_rpc_service.dart';
import 'package:convenient_test_dev/src/utils/errors.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.I;

Future<void> setup() async {
  setUpConvenientTestExceptionReporter();
  setUpFlutterOnError();

  await GetIt.I.get<ManagerRpcService>().resetManagerCache();
}
