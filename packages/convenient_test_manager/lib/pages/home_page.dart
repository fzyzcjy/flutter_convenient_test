import 'package:convenient_test_manager/components/home_page/command_info_panel.dart';
import 'package:convenient_test_manager/components/home_page/header_panel.dart';
import 'package:convenient_test_manager/components/home_page/input_key_handler.dart';
import 'package:convenient_test_manager/components/home_page/screenshot_panel.dart';
import 'package:convenient_test_manager/services/misc_service.dart';
import 'package:convenient_test_manager/services/vm_service_wrapper_service.dart';
import 'package:convenient_test_manager/stores/organization_store.dart';
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
          const HomePageInputKeyHandler(),
        ],
      );
    });
  }

  Widget _buildBody() {
    final vmServiceWrapperService = GetIt.I.get<VmServiceWrapperService>();
    final organizationStore = GetIt.I.get<OrganizationStore>();

    if (!vmServiceWrapperService.connected) {
      return _buildFullscreenHint(
        onTap: vmServiceWrapperService.connect,
        child: const Text(
          'VMService not connected. '
          'This may because the Worker is not running, or network has problem. '
          'Tap here to reconnect.',
        ),
      );
    }

    if (organizationStore.testGroupIds.isEmpty) {
      return _buildFullscreenHint(
        onTap: () => GetIt.I.get<MiscService>().reloadInfo(),
        child: const Text(
          'No tests found. '
          'This may because the information is not loaded. '
          'Tap here to reload information.',
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

  Widget _buildFullscreenHint({required VoidCallback onTap, required Widget child}) {
    return Center(
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          child: child,
        ),
      ),
    );
  }
}
