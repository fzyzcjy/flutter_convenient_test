import 'package:convenient_test_manager/components/home_page/command_info_panel.dart';
import 'package:convenient_test_manager/components/home_page/header_panel.dart';
import 'package:convenient_test_manager/components/home_page/secondary_panel.dart';
import 'package:convenient_test_manager/services/misc_flutter_service.dart';
import 'package:convenient_test_manager/stores/home_page_store.dart';
import 'package:convenient_test_manager_dart/services/vm_service_wrapper_service.dart';
import 'package:convenient_test_manager_dart/stores/suite_info_store.dart';
import 'package:convenient_test_manager_dart/stores/worker_super_run_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const kRouteName = '/home';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _Body(),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HomePageHeaderPanel(),
              Divider(height: 1, thickness: 1, color: Theme.of(context).colorScheme.outline),
              Expanded(
                child: _buildBody(context),
              ),
              // temporarily disable because of #25
              // const HomePageInputKeyHandler(),
            ],
          ),
          _buildHotRestartHint(context),
        ],
      );
    });
  }

  Widget _buildBody(BuildContext context) {
    final vmServiceWrapperService = GetIt.I.get<VmServiceWrapperService>();
    final suiteInfoStore = GetIt.I.get<SuiteInfoStore>();
    final workerSuperRunStore = GetIt.I.get<WorkerSuperRunStore>();
    final homePageStore = GetIt.I.get<HomePageStore>();

    if (!homePageStore.displayLoadedReportMode && !vmServiceWrapperService.connected) {
      return _buildFullscreenHint(
        context: context,
        onTap: vmServiceWrapperService.connect,
        tapHint: const Text('Tap here to reconnect'),
        child: const Text('VMService not connected. '
            'This may because the Worker is not running, or network has problem. '),
      );
    }

    if (!homePageStore.displayLoadedReportMode && suiteInfoStore.suiteInfo == null) {
      return _buildFullscreenHint(
        context: context,
        onTap: () => GetIt.I.get<MiscFlutterService>().reloadInfo(),
        tapHint: const Text('Tap here to reload information'),
        child: const Text(
          'No tests found. '
          'This may because the information is not loaded.',
        ),
      );
    }

    if (workerSuperRunStore.currSuperRunController.isInteractiveApp) {
      return _buildFullscreenHint(
        context: context,
        onTap: () => GetIt.I.get<MiscFlutterService>().reloadInfo(),
        tapHint: const Text('Tap here to end the mode and reload information'),
        child: const Text(
          'The app in your Android/iOS device is running in "app mode" instead of "integration test mode", '
          'i.e. it is fully interactive and you can play with it.',
        ),
      );
    }

    return Row(
      children: [
        const Expanded(
          flex: 1,
          child: HomePageCommandInfoPanel(),
        ),
        Container(width: 8),
        Container(width: 1, color: Theme.of(context).colorScheme.outline),
        const Expanded(
          flex: 1,
          child: HomePageSecondaryPanel(),
        ),
      ],
    );
  }

  Widget _buildFullscreenHint({
    required VoidCallback onTap,
    required Widget tapHint,
    required Widget child,
    required BuildContext context,
  }) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 400),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              DefaultTextStyle(
                style: TextStyle(fontSize: 15, height: 1.8, color: Theme.of(context).colorScheme.onBackground),
                child: child,
              ),
              const SizedBox(height: 20),
              TextButton(
                onPressed: onTap,
                child: tapHint,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHotRestartHint(BuildContext context) {
    final vmServiceWrapperService = GetIt.I.get<VmServiceWrapperService>();

    return Positioned(
      top: 48,
      left: 0,
      right: 0,
      child: Center(
        child: Observer(
          builder: (_) => vmServiceWrapperService.hotRestartActing
              ? Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: const Text(
                    'Worker Restarting...',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                      // fontWeight: FontWeight.w600,
                      height: 1.05,
                    ),
                  ),
                )
              : const SizedBox.shrink(),
        ),
      ),
    );
  }
}
