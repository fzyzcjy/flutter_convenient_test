import 'package:get_it/get_it.dart';
import 'package:efficient_test_common/efficient_test_common.dart';
import 'package:efficient_test_dev/src/support/manager_to_worker_service.dart';
import 'package:efficient_test_dev/src/support/rpc.dart';
import 'package:efficient_test_dev/src/support/slot.dart';
import 'package:efficient_test_dev/src/utils/errors.dart';

final getIt = GetIt.I;

Future<void> setupTestTool(TestToolSlot slot) async {
  setUpTestToolExceptionReporter();
  setUpFlutterOnError();

  getIt.registerSingleton<TestToolSlot>(slot);
  getIt.registerSingleton<TestToolManagerClient>(
      createTestToolManagerClientStub(host: GetIt.I.get<TestToolSlot>().managerHost, port: kTestToolManagerPort));

  await GetIt.I.get<TestToolManagerClient>().resetManagerCache(Empty());

  getIt.registerSingleton<TestToolManagerToWorkerService>(TestToolManagerToWorkerService());
}
