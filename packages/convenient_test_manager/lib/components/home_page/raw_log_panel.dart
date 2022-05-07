import 'package:convenient_test_manager/components/misc/enhanced_selectable_text.dart';
import 'package:convenient_test_manager/stores/highlight_store.dart';
import 'package:convenient_test_manager_dart/stores/raw_log_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

class HomePageRawLogPanel extends StatelessWidget {
  const HomePageRawLogPanel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final highlightStore = GetIt.I.get<HighlightStore>();
    final rawLogStore = GetIt.I.get<RawLogStore>();

    return Observer(builder: (_) {
      final highlightTestEntryId = highlightStore.highlightTestEntryName;
      if (highlightTestEntryId == null) {
        return const Center(
          child: Text('Tap log entries on the left to view screenshots'),
        );
      }

      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        child: ListView(
          primary: false,
          children: [
            EnhancedSelectableText(
              rawLogStore.rawLogInTest[highlightTestEntryId],
              style: const TextStyle(fontSize: 13, fontFamily: 'RobotoMono'),
            ),
          ],
        ),
      );
    });
  }
}
