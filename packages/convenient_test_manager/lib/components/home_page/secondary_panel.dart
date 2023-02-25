import 'package:collection/collection.dart';
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
        children: [
          const SizedBox(height: 12),
          _buildTabBar(context),
          Expanded(
            child: _buildTab(),
          ),
        ],
      ),
    );
  }

  Widget _buildTabBar(BuildContext context) {
    final homePageStore = GetIt.I.get<HomePageStore>();

    return Row(
      children: [
        const SizedBox(width: 8),
        ...HomePageSecondaryPanelTab.values.mapIndexed((index, tab) {
          final active = homePageStore.activeSecondaryPanelTab == tab;

          final borderSide = BorderSide(color: Theme.of(context).colorScheme.outline, width: 0.5);

          return InkWell(
            onTap: () => homePageStore.activeSecondaryPanelTab = tab,
            child: Material(
              color: active ? Colors.blue : Colors.white,
              child: Container(
                decoration: BoxDecoration(
                  border: Border(
                    left: index == 0 ? borderSide : BorderSide.none,
                    right: index == HomePageSecondaryPanelTab.values.length - 1 ? borderSide : BorderSide.none,
                    top: borderSide,
                    bottom: borderSide,
                  ),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                child: Text(
                  tab.title,
                  style: TextStyle(
                    fontSize: 13,
                    color: active ? Colors.white : Colors.black87,
                    height: 1,
                  ),
                ),
              ),
            ),
          );
        }),
      ],
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
