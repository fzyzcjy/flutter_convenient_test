import 'package:convenient_test_manager/stores/highlight_store.dart';
import 'package:convenient_test_manager/stores/log_store.dart';
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

      final snapshotNames = logStore.snapshotInLog[highlightLogEntryId]?.keys ?? [];
      if (snapshotNames.isEmpty) {
        return const Center(
          child: Text('No screenshots for chosen log entry'),
        );
      }

      return Row(
        children: snapshotNames.map((snapshotName) {
          final image = logStore.snapshotInLog[highlightLogEntryId]![snapshotName];

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
