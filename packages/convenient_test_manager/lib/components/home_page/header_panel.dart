import 'package:convenient_test_common/convenient_test_common.dart';
import 'package:convenient_test_manager/services/misc_flutter_service.dart';
import 'package:convenient_test_manager/stores/highlight_store.dart';
import 'package:convenient_test_manager_dart/services/vm_service_wrapper_service.dart';
import 'package:convenient_test_manager_dart/stores/worker_super_run_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

class HomePageHeaderPanel extends StatelessWidget {
  const HomePageHeaderPanel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final highlightStore = GetIt.I.get<HighlightStore>();
    final miscFlutterService = GetIt.I.get<MiscFlutterService>();
    final workerSuperRunStore = GetIt.I.get<WorkerSuperRunStore>();

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          const SizedBox(width: 8),
          TextButton(
            onPressed: () {
              highlightStore.enableAutoExpand = true;
              miscFlutterService.hotRestartAndRunTests(filterNameRegex: RegexUtils.kMatchEverything);
            },
            child: const Text('Run All'),
          ),
          const SizedBox(width: 8),
          TextButton(
            onPressed: miscFlutterService.haltWorker,
            child: const Text('Halt'),
          ),
          const SizedBox(width: 8),
          TextButton(
            onPressed: miscFlutterService.hotRestartAndRunInAppMode,
            child: const Text('Interactive Mode'),
          ),
          const SizedBox(width: 8),
          TextButton(
            onPressed: miscFlutterService.reloadInfo,
            child: const Text('Reload Info'),
          ),
          const SizedBox(width: 8),
          TextButton(
            onPressed: GetIt.I.get<VmServiceWrapperService>().connect,
            child: const Text('Reconnect VM'),
          ),
          const SizedBox(width: 8),
          TextButton(
            onPressed: miscFlutterService.pickFileAndReadReport,
            child: const Text('Open File'),
          ),
          Expanded(child: Container()),
          // TextButton(
          //   onPressed: () => showDialog<dynamic>(context: context, builder: (_) => const HomePageMiscDialog()),
          //   child: const Text('Misc'),
          // ),
          // const SizedBox(width: 8),
          const Text(
            'Isolation Mode',
            style: TextStyle(fontSize: 12, height: 1.2),
          ),
          Observer(
            builder: (_) => Switch(
              value: workerSuperRunStore.isolationMode,
              onChanged: (v) => workerSuperRunStore.isolationMode = v,
            ),
          ),
          const Text(
            'Hover Mode',
            style: TextStyle(fontSize: 12, height: 1.2),
          ),
          Observer(
            builder: (_) => Switch(
              value: highlightStore.enableHoverMode,
              onChanged: (v) => highlightStore.enableHoverMode = v,
            ),
          ),
          const Text(
            'Auto Jump',
            style: TextStyle(fontSize: 12, height: 1.2),
          ),
          Observer(
            builder: (_) => Switch(
              value: highlightStore.enableAutoJump,
              onChanged: (v) => highlightStore.enableAutoJump = v,
            ),
          ),
          const Text(
            'Auto Expand',
            style: TextStyle(fontSize: 12, height: 1.2),
          ),
          Observer(
            builder: (_) => Switch(
              value: highlightStore.enableAutoExpand,
              onChanged: (v) => highlightStore.enableAutoExpand = v,
            ),
          ),
        ],
      ),
    );
  }
}
