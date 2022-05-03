import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:test_tool_manager/services/misc_service.dart';
import 'package:test_tool_manager/services/vm_service_wrapper_service.dart';
import 'package:test_tool_manager/stores/organization_store.dart';

class HomePageHeaderPanel extends StatelessWidget {
  const HomePageHeaderPanel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final organizationStore = GetIt.I.get<OrganizationStore>();

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          const SizedBox(width: 8),
          TextButton(
            onPressed: () {
              organizationStore.enableAutoExpand = true;
              GetIt.I.get<MiscService>().hotRestartAndRunTests(filterNameRegex: '.*');
            },
            child: const Text('Run All'),
          ),
          const SizedBox(width: 12),
          TextButton(
            onPressed: () {
              organizationStore.enableAutoExpand = true;
              GetIt.I.get<VmServiceWrapperService>().hotRestart();
            },
            child: const Text('Hot Restart'),
          ),
          Expanded(child: Container()),
          const Text(
            'Auto Expand',
            style: TextStyle(fontSize: 12, height: 1.2),
          ),
          Observer(
            builder: (_) => Switch(
              value: organizationStore.enableAutoExpand,
              onChanged: (v) => organizationStore.enableAutoExpand = v,
            ),
          ),
        ],
      ),
    );
  }
}
