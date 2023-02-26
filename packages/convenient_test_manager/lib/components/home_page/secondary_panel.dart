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
    const tabs = HomePageSecondaryPanelTab.values;
    // a pre-filled list is faster: https://gist.github.com/gilice/a7f3230f623f0b8995a1b2b0a5e5782b
    final tabWidgets = List<Widget>.filled(tabs.length, const Placeholder());
    final selected = List<bool>.filled(tabs.length, false);

    for (int i = 0; i < tabs.length; ++i) {
      final tab = tabs[i];
      tabWidgets[i] = Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Text(tab.title),
      );

      if (tab == homePageStore.activeSecondaryPanelTab) selected[i] = true;
    }

    Log.d('buildTabBar', 'active tab: ${homePageStore.activeSecondaryPanelTab}');

    return ToggleButtons(
      isSelected: selected,
      children: tabWidgets,
      onPressed: (idx) => homePageStore.activeSecondaryPanelTab = HomePageSecondaryPanelTab.values[idx],
    );
  }
}
