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
          ..._buildButton(
            onPressed: () {
              highlightStore.enableAutoExpand = true;
              miscFlutterService.hotRestartAndRunTests(filterNameRegex: RegexUtils.kMatchEverything);
            },
            text: 'Run All',
          ),
          ..._buildButton(
            onPressed: miscFlutterService.haltWorker,
            text: 'Halt',
          ),
          ..._buildButton(
            onPressed: miscFlutterService.hotRestartAndRunInAppMode,
            text: 'Interactive Mode',
          ),
          ..._buildButton(
            onPressed: miscFlutterService.reloadInfo,
            text: 'Reload Info',
          ),
          ..._buildButton(
            onPressed: GetIt.I.get<VmServiceWrapperService>().connect,
            text: 'Reconnect VM',
          ),
          ..._buildButton(
            onPressed: miscFlutterService.pickFileAndReadReport,
            text: 'Open File',
          ),
          Expanded(child: Container()),
          // TextButton(
          //   onPressed: () => showDialog<dynamic>(context: context, builder: (_) => const HomePageMiscDialog()),
          //   child: const Text('Misc'),
          // ),
          // const SizedBox(width: 8),
          ..._buildSwitch(
            text: 'Isolation Mode',
            gs: GetSet.gs(
              () => workerSuperRunStore.isolationMode,
              (v) => workerSuperRunStore.isolationMode = v,
            ),
          ),
          ..._buildSwitch(
            text: 'Retry Mode',
            gs: GetSet.gs(
              () => workerSuperRunStore.retryMode,
              (v) => workerSuperRunStore.retryMode = v,
            ),
          ),
          ..._buildSwitch(
            text: 'Hover Mode',
            gs: GetSet.gs(
              () => highlightStore.enableHoverMode,
              (v) => highlightStore.enableHoverMode = v,
            ),
          ),
          ..._buildSwitch(
            text: 'Auto Jump',
            gs: GetSet.gs(
              () => highlightStore.enableAutoJump,
              (v) => highlightStore.enableAutoJump = v,
            ),
          ),
          ..._buildSwitch(
            text: 'Auto Expand',
            gs: GetSet.gs(
              () => highlightStore.enableAutoExpand,
              (v) => highlightStore.enableAutoExpand = v,
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildButton({
    required String text,
    required VoidCallback onPressed,
  }) {
    return [
      TextButton(
        onPressed: onPressed,
        child: Text(text),
      ),
      const SizedBox(width: 8),
    ];
  }

  List<Widget> _buildSwitch({
    required String text,
    required GetSet<bool> gs,
  }) {
    return [
      Text(
        text,
        style: const TextStyle(fontSize: 12, height: 1.2),
      ),
      Observer(
        builder: (_) => Switch(
          value: gs.getter(),
          onChanged: gs.setter,
        ),
      ),
    ];
  }
}
