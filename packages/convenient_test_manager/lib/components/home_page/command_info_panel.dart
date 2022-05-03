import 'package:convenient_test_common/convenient_test_common.dart';
import 'package:convenient_test_manager/components/home_page/test_entry_widget.dart';
import 'package:convenient_test_manager/components/misc/state_indicator.dart';
import 'package:convenient_test_manager/misc/proto_extensions.dart';
import 'package:convenient_test_manager/stores/organization_store.dart';
import 'package:convenient_test_manager/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

class HomePageCommandInfoPanel extends StatelessWidget {
  const HomePageCommandInfoPanel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final organizationStore = GetIt.I.get<OrganizationStore>();

    return Observer(builder: (_) {
      if (organizationStore.testGroupIds.isEmpty) {
        return const Padding(
          padding: EdgeInsets.symmetric(horizontal: 32, vertical: 32),
          child: Center(
            child: Text('Empty'),
          ),
        );
      }

      final adapter = StaticSectionListViewAdapter();

      adapter.add(StaticSection.single(child: Container(height: 8)));

      for (final testGroupId in organizationStore.testGroupIds) {
        final testGroup = organizationStore.testGroupMap[testGroupId]!;

        adapter.add(StaticSection.single(
          child: InkWell(
            onTap: () {
              organizationStore.enableAutoExpand = false;
              organizationStore.expandTestGroupMap[testGroupId] = !organizationStore.expandTestGroupMap[testGroupId];
            },
            child: SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.only(left: 8, right: 8, top: 12, bottom: 12),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 24,
                      height: 12,
                      child: Icon(
                        organizationStore.expandTestGroupMap[testGroupId] //
                            ? Icons.arrow_drop_up
                            : Icons.arrow_drop_down,
                        size: 16,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        testGroup.briefName,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    ..._buildTestGroupStat(testGroup),
                  ],
                ),
              ),
            ),
          ),
        ));

        if (organizationStore.expandTestGroupMap[testGroupId]) {
          final testEntryIds = organizationStore.testEntryInGroup[testGroupId]!;
          adapter.add(StaticSection(
            count: testEntryIds.length,
            builder: (context, index) {
              return HomePageTestEntryWidget(testEntryId: testEntryIds[index]);
            },
          ));
        }
      }

      adapter.add(StaticSection.single(child: Container(height: 8)));

      return ListView.builder(
        itemCount: adapter.itemCount,
        itemBuilder: adapter.itemBuilder,
      );
    });
  }

  List<Widget> _buildTestGroupStat(TestGroup testGroup) {
    final organizationStore = GetIt.I.get<OrganizationStore>();

    final stateCountMap = ExhaustiveMap(SimplifiedStateEnum.values, (_) => 0);
    organizationStore.testEntryInGroup[testGroup.id]!
        .map((testEntryId) => organizationStore.testEntryStateMap[testEntryId].toSimplifiedStateEnum())
        .forEach((state) => stateCountMap[state]++);

    return SimplifiedStateEnum.values.expand<Widget>((state) {
      final count = stateCountMap[state];
      if (count == 0) return const [SizedBox.shrink()];

      return [
        Text('${count}x', style: const TextStyle(fontSize: 12)),
        const SizedBox(width: 2),
        StateIndicatorWidget(state: state),
      ];
    }).toList();
  }
}
