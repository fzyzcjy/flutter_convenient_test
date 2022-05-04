import 'package:collection/collection.dart';
import 'package:convenient_test_manager/stores/home_page_store.dart';
import 'package:convenient_test_manager/stores/log_store.dart';
import 'package:convenient_test_manager/stores/organization_store.dart';
import 'package:convenient_test_manager/stores/raw_log_store.dart';
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
          const SizedBox(height: 12),
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
        const SizedBox(width: 8),
        ...HomePageSecondaryPanelTab.values.mapIndexed((index, tab) {
          final active = homePageStore.activeSecondaryPanelTab == tab;

          const borderSide = BorderSide(color: Colors.grey, width: 0.5);

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
    final organizationStore = GetIt.I.get<OrganizationStore>();
    final rawLogStore = GetIt.I.get<RawLogStore>();

    return Observer(builder: (_) {
      final activeTestEntryId = organizationStore.activeTestEntryId;
      if (activeTestEntryId == null) {
        return const Center(
          child: Text('Tap log entries on the left to view screenshots'),
        );
      }

      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        child: ListView(
          primary: false,
          children: [
            SelectableText(
              rawLogStore.rawLogInTest[activeTestEntryId],
              style: const TextStyle(fontSize: 13, fontFamily: 'RobotoMono'),
            ),
          ],
        ),
      );
    });
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

      final snapshotNames = logStore.snapshotInLog[activeLogEntryId]?.keys ?? [];
      if (snapshotNames.isEmpty) {
        return const Center(
          child: Text('No screenshots for chosen log entry'),
        );
      }

      return Row(
        children: snapshotNames.map((snapshotName) {
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
