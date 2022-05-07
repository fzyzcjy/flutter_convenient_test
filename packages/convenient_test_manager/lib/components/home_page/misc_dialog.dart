import 'package:flutter/material.dart';

class HomePageMiscDialog extends StatelessWidget {
  const HomePageMiscDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final workerTaskStore = GetIt.I.get<WorkerTaskStore>();

    return AlertDialog(
      title: const Text('Misc Tools'),
      content: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text('Nothing yet'),
              // const Text(
              //   'Test filter',
              //   style: TextStyle(fontWeight: FontWeight.w600),
              // ),
              // Observer(builder: (_) {
              //   return SyncTextField(
              //     gs: GetSet(
              //       getter: () => workerTaskStore.filterNameRegex,
              //       setter: (v) => workerTaskStore.filterNameRegex = v,
              //     ),
              //   );
              // }),
              // const SizedBox(height: 24),
              // TextButton(
              //   style: TextButton.styleFrom(
              //     padding: EdgeInsets.zero,
              //   ),
              //   onPressed: () {
              //     Navigator.pop(context);
              //     GetIt.I.get<VmServiceWrapperService>().hotRestart();
              //   },
              //   child: const Text('Run tests using filter'),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
