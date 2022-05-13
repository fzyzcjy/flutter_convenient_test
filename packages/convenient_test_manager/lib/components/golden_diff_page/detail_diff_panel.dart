import 'package:collection/collection.dart';
import 'package:convenient_test_manager/stores/golden_diff_page_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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

      final highlightInfo =
          gitFolderInfo.diffFileInfos.singleWhereOrNull((info) => info.path == goldenDiffPageStore.highlightPath);
      if (highlightInfo == null) return const Center(child: Text('Please choose an item from left panel'));

      return _HotKeyHandlerWidget(
        onMove: (delta) => _handleMove(gitFolderInfo, delta),
        child: Row(
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
        ),
      );
    });
  }

  void _handleMove(GitFolderInfo gitFolderInfo, int delta) {
    final goldenDiffPageStore = GetIt.I.get<GoldenDiffPageStore>();

    final oldIndex = gitFolderInfo.diffFileInfos.indexWhere((info) => info.path == goldenDiffPageStore.highlightPath);
    if (oldIndex == -1) return;

    final newIndex = (oldIndex + delta + gitFolderInfo.diffFileInfos.length) % gitFolderInfo.diffFileInfos.length;
    goldenDiffPageStore.highlightPath = gitFolderInfo.diffFileInfos[newIndex].path;
  }
}

class _HotKeyHandlerWidget extends StatelessWidget {
  final void Function(int delta) onMove;
  final Widget child;

  const _HotKeyHandlerWidget({
    Key? key,
    required this.onMove,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shortcuts(
      shortcuts: <ShortcutActivator, Intent>{
        LogicalKeySet(LogicalKeyboardKey.arrowUp): const _MoveIntent(-1),
        LogicalKeySet(LogicalKeyboardKey.arrowDown): const _MoveIntent(1),
      },
      child: Actions(
        actions: {
          _MoveIntent: CallbackAction<_MoveIntent>(onInvoke: (intent) => onMove(intent.delta)),
        },
        child: Focus(
          autofocus: true,
          child: child,
        ),
      ),
    );
  }
}

class _MoveIntent extends Intent {
  final int delta;

  const _MoveIntent(this.delta);
}
