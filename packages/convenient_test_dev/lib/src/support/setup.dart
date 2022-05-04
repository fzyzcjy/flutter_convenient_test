import 'package:convenient_test_common/convenient_test_common.dart';
import 'package:convenient_test_dev/src/support/manager_to_worker_service.dart';
import 'package:convenient_test_dev/src/support/slot.dart';
import 'package:convenient_test_dev/src/utils/errors.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.I;

Future<void> setup() async {
  setUpConvenientTestExceptionReporter();
  setUpFlutterOnError();

  await GetIt.I.get<ConvenientTestManagerClient>().resetManagerCache(Empty());

  getIt.registerSingleton<ConvenientTestManagerToWorkerService>(ConvenientTestManagerToWorkerService());
}
