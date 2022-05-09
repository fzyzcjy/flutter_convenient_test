import 'package:convenient_test_common/convenient_test_common.dart';
import 'package:convenient_test_manager/services/misc_flutter_service.dart';
import 'package:convenient_test_manager/stores/highlight_store.dart';
import 'package:convenient_test_manager_dart/services/report_saver_service.dart';
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
    final reportSaverService = GetIt.I.get<ReportSaverService>();

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
          const SizedBox(width: 8),
          _buildSuperRunStatusHint(),
          Expanded(child: Container()),
          // TextButton(
          //   onPressed: () => showDialog<dynamic>(context: context, builder: (_) => const HomePageMiscDialog()),
          //   child: const Text('Misc'),
          // ),
          // const SizedBox(width: 8),
          ..._buildSwitch(
            text: 'Isolation',
            gs: GetSet.gs(
              () => workerSuperRunStore.isolationMode,
              (v) => workerSuperRunStore.isolationMode = v,
            ),
          ),
          ..._buildSwitch(
            text: 'UpdateGoldens',
            gs: GetSet.gs(
              () => workerSuperRunStore.autoUpdateGoldenFiles,
              (v) => workerSuperRunStore.autoUpdateGoldenFiles = v,
            ),
          ),
          ..._buildSwitch(
            text: 'Retry',
            gs: GetSet.gs(
              () => workerSuperRunStore.retryMode,
              (v) => workerSuperRunStore.retryMode = v,
            ),
          ),
          ..._buildSwitch(
            text: 'SaveReport',
            gs: GetSet.gs(
              () => reportSaverService.enable,
              (v) => reportSaverService.enable = v,
            ),
          ),
          ..._buildSwitch(
            text: 'Hover',
            gs: GetSet.gs(
              () => highlightStore.enableHoverMode,
              (v) => highlightStore.enableHoverMode = v,
            ),
          ),
          ..._buildSwitch(
            text: 'AutoJump',
            gs: GetSet.gs(
              () => highlightStore.enableAutoJump,
              (v) => highlightStore.enableAutoJump = v,
            ),
          ),
          ..._buildSwitch(
            text: 'AutoExpand',
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
        child: Text(
          text,
          style: const TextStyle(fontSize: 12, color: Colors.black87),
        ),
      ),
      const SizedBox(width: 4),
    ];
  }

  List<Widget> _buildSwitch({
    required String text,
    required GetSet<bool> gs,
  }) {
    return [
      Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            text,
            style: const TextStyle(fontSize: 11.5, height: 1),
          ),
          Observer(
            builder: (_) => SizedBox(
              height: 24,
              child: Switch(
                value: gs.getter(),
                onChanged: gs.setter,
              ),
            ),
          ),
        ],
      ),
      const SizedBox(width: 8),
    ];
  }

  Widget _buildSuperRunStatusHint() {
    final workerSuperRunStore = GetIt.I.get<WorkerSuperRunStore>();

    Widget _buildCore({
      required Color color,
      required Widget child,
    }) =>
        Container(
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(4),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: DefaultTextStyle(
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.normal,
            ),
            child: child,
          ),
        );

    return Observer(builder: (_) {
      switch (workerSuperRunStore.currSuperRunController.superRunStatus) {
        case WorkerSuperRunStatus.runningTest:
          return _buildCore(color: Colors.blue, child: const Text('Running'));
        case WorkerSuperRunStatus.testAllDone:
          return _buildCore(color: Colors.green, child: const Text('Idle'));
        case WorkerSuperRunStatus.na:
          return const SizedBox.shrink();
      }
    });
  }
}
