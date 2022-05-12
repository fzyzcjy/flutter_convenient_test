import 'dart:typed_data';

import 'package:convenient_test_manager/stores/highlight_store.dart';
import 'package:convenient_test_manager_dart/stores/log_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

class HomePageScreenshotPanel extends StatelessWidget {
  const HomePageScreenshotPanel({Key? key}) : super(key: key);

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
            child: _buildBigImage(bigImageInterestSnapshots),
          ),
          if (selectiveDisplayMode) _buildThumbnails(highlightLogEntryId, snapshots),
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

  Widget _buildBigImage(Map<String, Uint8List> interestSnapshots) {
    return Row(
      children: [
        for (final snapshotEntry in interestSnapshots.entries)
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      snapshotEntry.key,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Expanded(
                      child: Center(
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey, width: 1),
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
    );
  }

  Widget _buildThumbnails(int logEntryId, Map<String, Uint8List> snapshots) {
    final highlightStore = GetIt.I.get<HighlightStore>();

    return Material(
      color: Colors.grey.shade100,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Row(
          children: [
            for (final snapshotEntry in snapshots.entries)
              Material(
                color: highlightStore.highlightSnapshot == LogEntryAndSnapshot(logEntryId, snapshotEntry.key)
                    ? Colors.grey.shade200
                    : null,
                child: InkWell(
                  onHover: (hovering) {
                    if (hovering) highlightStore.highlightSnapshot = LogEntryAndSnapshot(logEntryId, snapshotEntry.key);
                  },
                  // seems to need onTap if want onHover
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
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
                        ConstrainedBox(
                          constraints: const BoxConstraints(
                            maxHeight: 48,
                            maxWidth: 48,
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey, width: 1),
                            ),
                            child: Image.memory(snapshotEntry.value),
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
