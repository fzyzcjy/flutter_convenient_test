import 'package:convenient_test_common/convenient_test_common.dart';
import 'package:convenient_test_manager/components/home_page/group_entry_info_widget.dart';
import 'package:convenient_test_manager/stores/home_page_store.dart';
import 'package:convenient_test_manager/stores/suite_info_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class HomePageCommandInfoPanel extends StatelessWidget {
  const HomePageCommandInfoPanel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final homePageStore = GetIt.I.get<HomePageStore>();
    final suiteInfoStore = GetIt.I.get<SuiteInfoStore>();

    return Observer(builder: (_) {
      final adapter = StaticSectionListViewAdapter();

      adapter.add(StaticSection.single(child: const SizedBox(height: 8)));
      adapter.addAll(HomePageGroupEntryInfoSectionBuilder(
        groupEntryId: suiteInfoStore.suiteInfo!.rootGroupId,
        depth: -1,
        showHeader: false,
      ).build());
      adapter.add(StaticSection.single(child: const SizedBox(height: 8)));

      return ScrollablePositionedList.builder(
        itemScrollController: homePageStore.itemScrollController,
        itemPositionsListener: homePageStore.itemPositionsListener,
        itemBuilder: adapter.itemBuilder,
        itemCount: adapter.itemCount,
      );
    });
  }
}
