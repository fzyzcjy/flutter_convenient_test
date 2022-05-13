import 'package:convenient_test_manager/stores/golden_diff_page_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

class GoldenDiffPageDetailDiffPanel extends StatelessWidget {
  const GoldenDiffPageDetailDiffPanel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final goldenDiffPageStore = GetIt.I.get<GoldenDiffPageStore>();

    return Observer(builder: (_) {
      final gitFolderInfo = goldenDiffPageStore.gitFolderInfo;
      if (gitFolderInfo == null) return const Center(child: Text('Please choose a folder first'));

      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (final info in gitFolderInfo.diffFileInfos) _buildItem(context, info),
          ],
        ),
      );
    });
  }

  Widget _buildItem(BuildContext context, GitDiffFileInfo diffFileInfo) {
    final goldenDiffPageStore = GetIt.I.get<GoldenDiffPageStore>();

    final active = goldenDiffPageStore.highlightPath == diffFileInfo.path;
    void toggleActive() => goldenDiffPageStore.highlightPath = active ? null : diffFileInfo.path;

    return Material(
      color: active ? Colors.blue.shade200 : Colors.white,
      child: InkWell(
        onHover: (hovering) {
          if (hovering) toggleActive();
        },
        onTap: toggleActive,
        child: Row(
          children: [
            Text(diffFileInfo.path),
          ],
        ),
      ),
    );
  }
}
