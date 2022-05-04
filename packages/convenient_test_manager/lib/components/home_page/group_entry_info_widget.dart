import 'package:collection/collection.dart';
import 'package:convenient_test_common/convenient_test_common.dart';
import 'package:convenient_test_manager/components/home_page/log_entry_widget.dart';
import 'package:convenient_test_manager/components/misc/state_indicator.dart';
import 'package:convenient_test_manager/services/misc_service.dart';
import 'package:convenient_test_manager/stores/log_store.dart';
import 'package:convenient_test_manager/stores/organization_store.dart';
import 'package:convenient_test_manager/stores/suite_info_store.dart';
import 'package:convenient_test_manager/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

class HomePageGroupEntryInfoWidget extends StatelessWidget {
  final int groupEntryId;

  const HomePageGroupEntryInfoWidget({Key? key, required this.groupEntryId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final suiteInfoStore = GetIt.I.get<SuiteInfoStore>();

    return Observer(builder: (_) {
      final info = suiteInfoStore.suiteInfo?.entryMap[groupEntryId];
      if (info == null) return const SizedBox.shrink();

      if (info is GroupInfo) return _GroupInfoWidget(info: info);
      if (info is TestInfo) return _TestInfoWidget(info: info);
      throw Exception('unknown info=$info');
    });
  }
}

class _GroupInfoWidget extends StatelessWidget {
  final GroupInfo info;

  const _GroupInfoWidget({Key? key, required this.info}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class _TestInfoWidget extends StatelessWidget {
  final TestInfo info;

  const _TestInfoWidget({Key? key, required this.info}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final organizationStore = GetIt.I.get<OrganizationStore>();
    final logStore = GetIt.I.get<LogStore>();

    return Observer(builder: (_) {
      final testEntry = organizationStore.testEntryMap[testInfoId]!;
      final logEntryIds = logStore.logEntryInTest[testInfoId] ?? <int>[];
      final state = organizationStore.testEntryStateMap[testInfoId].toSimplifiedStateEnum();

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              final targetExpand = !organizationStore.expandGroupEntryMap[testInfoId];

              organizationStore
                ..enableAutoExpand = false
                ..expandGroupEntryMap[testInfoId] = targetExpand
                ..activeTestEntryId = testInfoId;
            },
            child: SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                child: Row(
                  children: [
                    StateIndicatorWidget(
                      state: state,
                      enableAnimation: true,
                    ),
                    Text(
                      testEntry.briefName,
                      style: const TextStyle(),
                    ),
                    Expanded(child: Container()),
                    IconButton(
                      onPressed: () {
                        organizationStore.enableAutoExpand = true;
                        GetIt.I.get<MiscService>().hotRestartAndRunTests(filterNameRegex: '^${testEntry.name}\$');
                      },
                      icon: const Icon(
                        Icons.play_arrow,
                        color: Colors.blue,
                        size: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          if (organizationStore.expandGroupEntryMap[testInfoId])
            Stack(
              children: [
                Column(
                  children: [
                    if (logEntryIds.isEmpty)
                      const Padding(
                        padding: EdgeInsets.only(left: 16, right: 16, bottom: 12),
                        child: Text(
                          'No log entries for this test',
                          style: TextStyle(fontSize: 11, color: Colors.grey),
                        ),
                      ),
                    ...logEntryIds.mapIndexed(
                      (i, logEntryId) => HomePageLogEntryWidget(
                        order: i,
                        testEntryId: testInfoId,
                        logEntryId: logEntryId,
                        running: state == SimplifiedStateEnum.running && i == logEntryIds.length - 1,
                      ),
                    ),
                  ],
                ),
                Positioned(
                  left: 24,
                  top: 0,
                  bottom: 0,
                  child: Container(
                    width: 1,
                    color: Colors.grey[300],
                  ),
                )
              ],
            )
        ],
      );
    });
  }
}
