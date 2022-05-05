import 'package:convenient_test_manager/components/home_page/misc_dialog.dart';
import 'package:convenient_test_manager/services/misc_service.dart';
import 'package:convenient_test_manager/services/vm_service_wrapper_service.dart';
import 'package:convenient_test_manager/stores/highlight_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

class HomePageHeaderPanel extends StatelessWidget {
  const HomePageHeaderPanel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final highlightStore = GetIt.I.get<HighlightStore>();
    final miscService = GetIt.I.get<MiscService>();

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          const SizedBox(width: 8),
          TextButton(
            onPressed: () {
              highlightStore.enableAutoExpand = true;
              miscService.hotRestartAndRunTests(filterNameRegex: '.*');
            },
            child: const Text('Run All Tests'),
          ),
          const SizedBox(width: 20),
          TextButton(
            onPressed: miscService.hotRestartAndRunInAppMode,
            child: const Text('Run In App Mode'),
          ),
          const SizedBox(width: 20),
          TextButton(
            onPressed: miscService.reloadInfo,
            child: const Text('Reload Info'),
          ),
          const SizedBox(width: 20),
          TextButton(
            onPressed: GetIt.I.get<VmServiceWrapperService>().connect,
            child: const Text('Reconnect VM'),
          ),
          const SizedBox(width: 20),
          TextButton(
            onPressed: miscService.pickFileAndReadReport,
            child: const Text('Read From File'),
          ),
          Expanded(child: Container()),
          TextButton(
            onPressed: () => showDialog<dynamic>(context: context, builder: (_) => const HomePageMiscDialog()),
            child: const Text('Misc'),
          ),
          const SizedBox(width: 20),
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
