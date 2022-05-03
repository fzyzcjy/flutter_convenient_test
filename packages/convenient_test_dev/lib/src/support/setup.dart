import 'package:convenient_test_common/convenient_test_common.dart';
import 'package:convenient_test_dev/src/support/manager_to_worker_service.dart';
import 'package:convenient_test_dev/src/support/rpc.dart';
import 'package:convenient_test_dev/src/support/slot.dart';
import 'package:convenient_test_dev/src/utils/errors.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.I;

Future<void> setupConvenientTest(ConvenientTestSlot slot) async {
  setUpConvenientTestExceptionReporter();
  setUpFlutterOnError();

  getIt.registerSingleton<ConvenientTestSlot>(slot);
  getIt.registerSingleton<ConvenientTestManagerClient>(createConvenientTestManagerClientStub(
      host: GetIt.I.get<ConvenientTestSlot>().managerHost, port: kConvenientTestManagerPort));

  await GetIt.I.get<ConvenientTestManagerClient>().resetManagerCache(Empty());

  getIt.registerSingleton<ConvenientTestManagerToWorkerService>(ConvenientTestManagerToWorkerService());
}
