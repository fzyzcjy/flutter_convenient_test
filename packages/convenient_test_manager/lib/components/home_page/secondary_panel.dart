import 'package:convenient_test_manager/stores/home_page_store.dart';
import 'package:convenient_test_manager/stores/log_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

class HomePageSecondaryPanel extends StatelessWidget {
  const HomePageSecondaryPanel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => Column(
        children: [
          _buildTabBar(),
          Expanded(
            child: _buildTab(),
          ),
        ],
      ),
    );
  }

  Widget _buildTabBar() {
    final homePageStore = GetIt.I.get<HomePageStore>();

    return Row(
      children: [
        for (final tab in HomePageSecondaryPanelTab.values) //
          InkWell(
            onTap: () => homePageStore.activeSecondaryPanelTab = tab,
            child: Material(
              color: homePageStore.activeSecondaryPanelTab == tab ? Colors.blue : Colors.white,
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                ),
                child: Text(
                  tab.title,
                  style: const TextStyle(fontSize: 13),
                ),
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildTab() {
    final homePageStore = GetIt.I.get<HomePageStore>();

    switch (homePageStore.activeSecondaryPanelTab) {
      case HomePageSecondaryPanelTab.screenshot:
        return const _ScreenshotPanel();
      case HomePageSecondaryPanelTab.rawLog:
        return const _RawLogPanel();
    }
  }
}

class _RawLogPanel extends StatelessWidget {
  const _RawLogPanel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO
    return Text('TODO');
  }
}

class _ScreenshotPanel extends StatelessWidget {
  const _ScreenshotPanel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logStore = GetIt.I.get<LogStore>();

    return Observer(builder: (_) {
      final activeLogEntryId = logStore.activeLogEntryId;
      if (activeLogEntryId == null) {
        return const Center(
          child: Text('Tap log entries on the left to view screenshots'),
        );
      }

      return Row(
        children: (logStore.snapshotInLog[activeLogEntryId]?.keys ?? []).map((snapshotName) {
          final image = logStore.snapshotInLog[activeLogEntryId]![snapshotName];

          return Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      snapshotName,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey, width: 1),
                          ),
                          child: image != null ? Image.memory(image) : const Text('[Failed to load image]'),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }).toList(),
      );
    });
  }
}
