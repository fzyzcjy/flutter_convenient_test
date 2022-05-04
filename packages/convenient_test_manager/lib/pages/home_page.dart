import 'package:convenient_test_common/convenient_test_common.dart';
import 'package:convenient_test_manager/components/home_page/command_info_panel.dart';
import 'package:convenient_test_manager/components/home_page/header_panel.dart';
import 'package:convenient_test_manager/components/home_page/secondary_panel.dart';
import 'package:convenient_test_manager/services/misc_service.dart';
import 'package:convenient_test_manager/services/vm_service_wrapper_service.dart';
import 'package:convenient_test_manager/stores/organization_store.dart';
import 'package:convenient_test_manager/stores/worker_mode_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _Body(),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const HomePageHeaderPanel(),
          Divider(height: 1, thickness: 1, color: Colors.grey[200]),
          Expanded(
            child: _buildBody(),
          ),
          // temporarily disable because of #25
          // const HomePageInputKeyHandler(),
        ],
      );
    });
  }

  Widget _buildBody() {
    final vmServiceWrapperService = GetIt.I.get<VmServiceWrapperService>();
    final organizationStore = GetIt.I.get<OrganizationStore>();
    final workerModeStore = GetIt.I.get<WorkerModeStore>();

    if (!vmServiceWrapperService.connected) {
      return _buildFullscreenHint(
        onTap: vmServiceWrapperService.connect,
        tapHint: const Text('Tap here to reconnect'),
        child: const Text('VMService not connected. '
            'This may because the Worker is not running, or network has problem. '),
      );
    }

    if (organizationStore.testGroupIds.isEmpty) {
      return _buildFullscreenHint(
        onTap: () => GetIt.I.get<MiscService>().reloadInfo(),
        tapHint: const Text('Tap here to reload information'),
        child: const Text(
          'No tests found. '
          'This may because the information is not loaded.',
        ),
      );
    }

    if (workerModeStore.activeWorkerMode.whichSubType() == WorkerMode_SubType.interactiveApp) {
      return _buildFullscreenHint(
        onTap: () => GetIt.I.get<MiscService>().reloadInfo(),
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
        Container(width: 1, color: Colors.grey[200]),
        Container(width: 8),
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
                style: const TextStyle(fontSize: 15, height: 1.8, color: Colors.black87),
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
}
