import 'package:convenient_test_common/convenient_test_common.dart';
import 'package:convenient_test_manager/components/home_page/raw_log_panel.dart';
import 'package:convenient_test_manager/components/home_page/screenshot_panel.dart';
import 'package:convenient_test_manager/components/home_page/video_panel.dart';
import 'package:convenient_test_manager/stores/home_page_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

class HomePageSecondaryPanel extends StatelessWidget {
  const HomePageSecondaryPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) => Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: _SecondaryPanelTabBar(),
          ),
          Expanded(
            child: _buildTab(),
          ),
        ],
      ),
    );
  }

  Widget _buildTab() {
    final homePageStore = GetIt.I.get<HomePageStore>();

    switch (homePageStore.activeSecondaryPanelTab) {
      case HomePageSecondaryPanelTab.screenshot:
        return const HomePageScreenshotPanel();
      case HomePageSecondaryPanelTab.rawLog:
        return const HomePageRawLogPanel();
      case HomePageSecondaryPanelTab.video:
        return const HomePageVideoPanel();
      case HomePageSecondaryPanelTab.none:
        return Container();
    }
  }
}

class _SecondaryPanelTabBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final homePageStore = GetIt.I.get<HomePageStore>();
    final tabs = HomePageSecondaryPanelTab.values.map((e) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Text(e.title),
        ));

    final selected = HomePageSecondaryPanelTab.values.map((e) => e == homePageStore.activeSecondaryPanelTab).toList();

    Log.d('buildTabBar', 'active tab: ${homePageStore.activeSecondaryPanelTab}');

    return ToggleButtons(
      isSelected: selected,
      children: tabs.toList(),
      onPressed: (idx) => homePageStore.activeSecondaryPanelTab = HomePageSecondaryPanelTab.values[idx],
    );
  }
}
