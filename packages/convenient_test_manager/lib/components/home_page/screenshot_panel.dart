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

      return Column(
        children: [
          _buildThumbnails(snapshots),
          Expanded(
            child: _buildBigImage(snapshots),
          ),
        ],
      );
    });
  }

  Widget _buildBigImage(Map<String, Uint8List> snapshots) {
    final highlightStore = GetIt.I.get<HighlightStore>();
   
    return Row(
      children: [
        for (final snapshotEntry in snapshots.entries)
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

  Widget _buildThumbnails(Map<String, Uint8List> snapshots) {
    if (snapshots.length <= 2) return const SizedBox();

    return Container(
      color: Colors.grey.shade100,
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      child: Row(
        children: [
          for (final snapshotEntry in snapshots.entries)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
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
        ],
      ),
    );
  }
}
