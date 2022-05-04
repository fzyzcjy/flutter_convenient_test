import 'package:collection/collection.dart';
import 'package:convenient_test_manager/components/home_page/log_entry_widget.dart';
import 'package:convenient_test_manager/components/misc/state_indicator.dart';
import 'package:convenient_test_manager/misc/proto_extensions.dart';
import 'package:convenient_test_manager/services/misc_service.dart';
import 'package:convenient_test_manager/stores/log_store.dart';
import 'package:convenient_test_manager/stores/organization_store.dart';
import 'package:convenient_test_manager/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

class HomePageTestEntryWidget extends StatelessWidget {
  final int testEntryId;

  const HomePageTestEntryWidget({Key? key, required this.testEntryId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final organizationStore = GetIt.I.get<OrganizationStore>();
    final logStore = GetIt.I.get<LogStore>();

    return Observer(builder: (_) {
      final testEntry = organizationStore.testEntryMap[testEntryId]!;
      final logEntryIds = logStore.logEntryInTest[testEntryId] ?? <int>[];
      final state = organizationStore.testEntryStateMap[testEntryId].toSimplifiedStateEnum();

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              final targetExpand = !organizationStore.expandTestEntryMap[testEntryId];

              organizationStore
                ..enableAutoExpand = false
                ..expandTestEntryMap[testEntryId] = targetExpand
                ..activeTestEntryId = testEntryId;
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
          if (organizationStore.expandTestEntryMap[testEntryId])
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
                        testEntryId: testEntryId,
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
