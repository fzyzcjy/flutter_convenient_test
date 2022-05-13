import 'package:collection/collection.dart';
import 'package:convenient_test_manager/stores/golden_diff_page_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

class GoldenDiffPageFileInfoPanel extends StatelessWidget {
  const GoldenDiffPageFileInfoPanel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final goldenDiffPageStore = GetIt.I.get<GoldenDiffPageStore>();

    return Observer(builder: (_) {
      final gitFolderInfo = goldenDiffPageStore.gitFolderInfo;
      if (gitFolderInfo == null) return const Center(child: Text('Please choose a folder first'));

      final highlightInfo =
          gitFolderInfo.diffFileInfos.singleWhereOrNull((info) => info.path == goldenDiffPageStore.highlightPath);
      if (highlightInfo == null) return const Center(child: Text('Please choose an item from left panel'));

      return Row(
        children: [
          Expanded(
            child: Image(
              image: MemoryImage(highlightInfo.originalContent),
            ),
          ),
          Expanded(
            child: Image(
              image: MemoryImage(highlightInfo.newContent),
            ),
          ),
        ],
      );
    });
  }
}
