import 'package:convenient_test_manager/stores/golden_diff_page_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

class GoldenDiffPageDetailDiffPanel extends StatelessWidget {
  const GoldenDiffPageDetailDiffPanel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final goldenDiffPageStore = GetIt.I.get<GoldenDiffPageStore>();

    return LayoutBuilder(builder: (_, constraints) {
      return Observer(builder: (_) {
        final gitFolderInfo = goldenDiffPageStore.gitFolderInfo;
        if (gitFolderInfo == null) return const Center(child: Text('Please choose a folder first'));
        return SingleChildScrollView(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 8),
                  for (final info in gitFolderInfo.diffFileInfos) _buildItem(context, info),
                ],
              ),
            ),
          ),
        );
      });
    });
  }

  Widget _buildItem(BuildContext context, GitDiffFileInfo diffFileInfo) {
    return Observer(builder: (_) {
      final goldenDiffPageStore = GetIt.I.get<GoldenDiffPageStore>();

      final active = goldenDiffPageStore.highlightPath == diffFileInfo.path;
      void toggleActive() => goldenDiffPageStore.highlightPath = active ? null : diffFileInfo.path;

      return Material(
        color: active ? Colors.blue.shade100 : Colors.white,
        child: InkWell(
          onHover: (hovering) {
            if (hovering) toggleActive();
          },
          onTap: toggleActive,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
            child: Text(
              diffFileInfo.path,
              style: const TextStyle(height: 1),
            ),
          ),
        ),
      );
    });
  }
}
