import 'package:convenient_test_manager/services/misc_service.dart';
import 'package:convenient_test_manager/services/vm_service_wrapper_service.dart';
import 'package:convenient_test_manager/stores/organization_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

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
          const SizedBox(width: 16),
          TextButton(
            onPressed: () => GetIt.I.get<MiscService>().reloadInfo(),
            child: const Text('Reload Info'),
          ),
          const SizedBox(width: 16),
          TextButton(
            onPressed: GetIt.I.get<VmServiceWrapperService>().connect,
            child: const Text('Reconnect VM'),
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
