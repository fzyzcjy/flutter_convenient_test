import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:efficient_test_manager/stores/log_store.dart';

class HomePageScreenshotPanel extends StatelessWidget {
  const HomePageScreenshotPanel({Key? key}) : super(key: key);

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
