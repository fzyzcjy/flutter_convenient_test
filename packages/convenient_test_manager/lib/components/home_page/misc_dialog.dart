import 'package:convenient_test_common/convenient_test_common.dart';
import 'package:convenient_test_manager/services/vm_service_wrapper_service.dart';
import 'package:convenient_test_manager/stores/worker_mode_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

class HomePageMiscDialog extends StatelessWidget {
  const HomePageMiscDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final workerModeStore = GetIt.I.get<WorkerModeStore>();

    return AlertDialog(
      title: const Text('Misc Tools'),
      content: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Test filter',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              Observer(builder: (_) {
                return SyncTextField(
                  gs: GetSet(
                    getter: () => workerModeStore.activeWorkerMode.integrationTest.filterNameRegex,
                    setter: (v) => workerModeStore.activeWorkerMode =
                        WorkerMode(integrationTest: WorkerModeIntegrationTest(filterNameRegex: v)),
                  ),
                );
              }),
              const SizedBox(height: 24),
              TextButton(
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                ),
                onPressed: () {
                  Navigator.pop(context);
                  GetIt.I.get<VmServiceWrapperService>().hotRestart();
                },
                child: const Text('Run tests using filter'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
