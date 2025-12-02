import 'package:convenient_test_common/convenient_test_common.dart';
import 'package:convenient_test_manager/components/home_page/header/header_status_hint.dart';
import 'package:convenient_test_manager/pages/golden_diff_page.dart';
import 'package:convenient_test_manager/services/misc_flutter_service.dart';
import 'package:convenient_test_manager/stores/highlight_store.dart';
import 'package:convenient_test_manager/stores/home_page_store.dart';
import 'package:convenient_test_manager_dart/services/report_saver_service.dart';
import 'package:convenient_test_manager_dart/services/vm_service_wrapper_service.dart';
import 'package:convenient_test_manager_dart/stores/worker_super_run_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

class HomePageHeaderPanel extends StatelessWidget {
  const HomePageHeaderPanel({super.key});

  @override
  Widget build(BuildContext context) {
    final highlightStore = GetIt.I.get<HighlightStore>();
    final miscFlutterService = GetIt.I.get<MiscFlutterService>();
    final workerSuperRunStore = GetIt.I.get<WorkerSuperRunStore>();
    final reportSaverService = GetIt.I.get<ManagerReportSaverService>();
    final homePageStore = GetIt.I.get<HomePageStore>();

    return Observer(
      builder: (_) {
        if (homePageStore.displayLoadedReportMode) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: SizedBox(
              width: double.infinity,
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: IconButton(
                      onPressed: () =>
                          homePageStore.displayLoadedReportMode = false,
                      icon: const Icon(Icons.arrow_back),
                    ),
                  ),
                  const Positioned.fill(
                    child: Center(
                      child: Text(
                        'Loaded Report Displayer',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            alignment: WrapAlignment.spaceBetween,
            runSpacing: 24,
            children: [
              Wrap(
                runSpacing: 8,
                children: [
                  _HeaderButton(
                    onPressed: () {
                      highlightStore.enableAutoExpand = true;
                      miscFlutterService.hotRestartAndRunTests(
                        filterNameRegex: RegexUtils.kMatchEverything,
                      );
                    },
                    text: 'Run All',
                  ),
                  _HeaderButton(
                    onPressed: miscFlutterService.haltWorker,
                    text: 'Halt',
                  ),
                  _HeaderButton(
                    onPressed: miscFlutterService.hotRestartAndRunInAppMode,
                    text: 'Interactive Mode',
                  ),
                  _HeaderButton(
                    onPressed: miscFlutterService.reloadInfo,
                    text: 'Reload Info',
                  ),
                  _HeaderButton(
                    onPressed: GetIt.I.get<VmServiceWrapperService>().connect,
                    text: 'Reconnect VM',
                  ),
                  _HeaderButton(
                    onPressed: miscFlutterService.pickFileAndReadReport,
                    text: 'Load Report',
                  ),
                  _HeaderButton(
                    onPressed: () =>
                        Navigator.pushNamed(context, GoldenDiffPage.kRouteName),
                    text: 'Golden Diff Page',
                  ),
                  Observer(
                    builder: (context) {
                      final workerSuperRunStore = GetIt.I
                          .get<WorkerSuperRunStore>();
                      final status = workerSuperRunStore
                          .currSuperRunController
                          .superRunStatus;

                      return HeaderStatusHint(status: status);
                    },
                  ),
                ],
              ),

              //Expanded(child: Container()),
              // TextButton(
              //   onPressed: () => showDialog<dynamic>(context: context, builder: (_) => const HomePageMiscDialog()),
              //   child: const Text('Misc'),
              // ),
              // const SizedBox(width: 8),
              Wrap(
                runSpacing: 8,
                children: [
                  _HeaderSwitch(
                    text: 'Isolation',
                    gs: GetSet.gs(
                      () => workerSuperRunStore.isolationMode,
                      (v) => workerSuperRunStore.isolationMode = v,
                    ),
                  ),
                  _HeaderSwitch(
                    text: 'UpdateGoldens',
                    gs: GetSet.gs(
                      () => workerSuperRunStore.autoUpdateGoldenFiles,
                      (v) => workerSuperRunStore.autoUpdateGoldenFiles = v,
                    ),
                  ),
                  _HeaderSwitch(
                    text: 'Retry',
                    gs: GetSet.gs(
                      () => workerSuperRunStore.retryMode,
                      (v) => workerSuperRunStore.retryMode = v,
                    ),
                  ),
                  _HeaderSwitch(
                    text: 'SaveReport',
                    gs: GetSet.gs(
                      () => reportSaverService.enable,
                      (v) => reportSaverService.enable = v,
                    ),
                  ),
                  _HeaderSwitch(
                    text: 'Hover',
                    gs: GetSet.gs(
                      () => highlightStore.enableHoverMode,
                      (v) => highlightStore.enableHoverMode = v,
                    ),
                  ),
                  _HeaderSwitch(
                    text: 'AutoJump',
                    gs: GetSet.gs(
                      () => highlightStore.enableAutoJump,
                      (v) => highlightStore.enableAutoJump = v,
                    ),
                  ),
                  _HeaderSwitch(
                    text: 'AutoExpand',
                    gs: GetSet.gs(
                      () => highlightStore.enableAutoExpand,
                      (v) => highlightStore.enableAutoExpand = v,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

class _HeaderSwitch extends StatelessWidget {
  final String text;
  final GetSet<bool> gs;

  const _HeaderSwitch({required this.text, required this.gs});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            text,
            style: Theme.of(context).textTheme.labelMedium?.copyWith(height: 1),
          ),
          Observer(
            builder: (_) => SizedBox(
              height: 24,
              child: Switch(value: gs.getter(), onChanged: gs.setter),
            ),
          ),
        ],
      ),
    );
  }
}

class _HeaderButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const _HeaderButton({required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2),
      child: TextButton(
        onPressed: onPressed,
        child: Text(text, style: Theme.of(context).textTheme.labelMedium),
      ),
    );
  }
}
