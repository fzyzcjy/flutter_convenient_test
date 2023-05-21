import 'dart:typed_data';

import 'package:convenient_test_manager/components/misc/rulers.dart';
import 'package:convenient_test_manager/stores/highlight_store.dart';
import 'package:convenient_test_manager_dart/stores/log_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

class HomePageScreenshotPanel extends StatelessWidget {
  const HomePageScreenshotPanel({super.key});

  @override
  Widget build(BuildContext context) {
    final highlightStore = GetIt.I.get<HighlightStore>();
    final logStore = GetIt.I.get<LogStore>();

    return Observer(builder: (_) {
      final highlightLogEntryId = highlightStore.highlightLogEntryId;
      if (highlightLogEntryId == null) {
        return const Center(
          child: Text('Tap log entries on the left to view screenshots'),
        );
      }

      final snapshots = logStore.snapshotInLog[highlightLogEntryId];

      if (snapshots == null || snapshots.isEmpty) {
        return const Center(
          child: Text('No screenshots for chosen log entry'),
        );
      }

      final selectiveDisplayMode = snapshots.length > 2;

      final bigImageInterestSnapshotNames = _calcBigImageInterestSnapshotNames(highlightLogEntryId, snapshots,
          selectiveDisplayMode: selectiveDisplayMode);
      final bigImageInterestSnapshots =
          Map.fromEntries(bigImageInterestSnapshotNames.map((name) => MapEntry(name, snapshots[name]!)));

      return Column(
        children: [
          Expanded(
            child: _buildBigImages(bigImageInterestSnapshots, context),
          ),
          if (selectiveDisplayMode) _buildThumbnails(highlightLogEntryId, snapshots, context),
        ],
      );
    });
  }

  List<String> _calcBigImageInterestSnapshotNames(int logEntryId, Map<String, Uint8List> snapshots,
      {required bool selectiveDisplayMode}) {
    final highlightStore = GetIt.I.get<HighlightStore>();

    if (!selectiveDisplayMode) return snapshots.keys.toList();

    final highlightSnapshot = highlightStore.highlightSnapshot;
    if (highlightSnapshot == null || highlightSnapshot.logEntryId != logEntryId) {
      return snapshots.keys.take(1).toList();
    }

    assert(snapshots.containsKey(highlightSnapshot.snapshotName));
    return [highlightSnapshot.snapshotName];
  }

  Widget _buildBigImages(Map<String, Uint8List> interestSnapshots, BuildContext context) {
    return Row(
      children: [
        for (final snapshotEntry in interestSnapshots.entries)
          Expanded(
            child: _buildBigImage(snapshotEntry.key, snapshotEntry.value, context),
          ),
      ],
    );
  }

  Widget _buildBigImage(String name, Uint8List bytes, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              name,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 4),
            Expanded(
              child: Center(
                child: RulerDecoration(
                  rulerSize: TODO,
                  // ignore: use_decorated_box
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Theme.of(context).colorScheme.outline, width: 1),
                    ),
                    child: Image.memory(bytes),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildThumbnails(int logEntryId, Map<String, Uint8List> snapshots, BuildContext context) {
    final highlightStore = GetIt.I.get<HighlightStore>();
    final colorScheme = Theme.of(context).colorScheme;
    return Material(
      color: ElevationOverlay.applySurfaceTint(colorScheme.surface, colorScheme.surfaceTint, 1),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Row(
          children: [
            for (final snapshotEntry in snapshots.entries)
              Material(
                color: highlightStore.highlightSnapshot == LogEntryAndSnapshot(logEntryId, snapshotEntry.key)
                    ? colorScheme.outline
                    : null,
                child: InkWell(
                  onHover: (hovering) {
                    if (hovering) {
                      highlightStore.highlightSnapshot = LogEntryAndSnapshot(logEntryId, snapshotEntry.key);
                    }
                  },
                  // seems to need onTap if want onHover
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    height: 72,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          snapshotEntry.key,
                          style: const TextStyle(
                            fontSize: 13,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Expanded(
                          child: ConstrainedBox(
                            constraints: const BoxConstraints(maxWidth: 48),
                            // ignore: use_decorated_box
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: Theme.of(context).colorScheme.outline, width: 1),
                              ),
                              child: Image.memory(snapshotEntry.value),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
