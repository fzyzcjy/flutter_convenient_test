import 'package:collection/collection.dart';
import 'package:convenient_test_manager/stores/golden_diff_page_store.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

class GoldenDiffPageDetailDiffPanel extends StatelessWidget {
  const GoldenDiffPageDetailDiffPanel({super.key});

  @override
  Widget build(BuildContext context) {
    final goldenDiffPageStore = GetIt.I.get<GoldenDiffPageStore>();

    return Observer(builder: (_) {
      final gitFolderInfo = goldenDiffPageStore.gitFolderInfo;
      if (gitFolderInfo == null) return const Center(child: Text('Please choose a folder first'));

      final highlightInfo =
          gitFolderInfo.diffFileInfos.singleWhereOrNull((info) => info.path == goldenDiffPageStore.highlightPath);
      if (highlightInfo == null) return const Center(child: Text('Please choose an item from left panel'));

      final maskedDiff = highlightInfo.comparisonResult.diffs?['maskedDiff'];
      final isolatedDiff = highlightInfo.comparisonResult.diffs?['isolatedDiff'];

      final imageSize = maskedDiff == null ? null : Size(maskedDiff.width.toDouble(), maskedDiff.height.toDouble());

      return _HotKeyHandlerWidget(
        onMove: (delta) => _handleMove(gitFolderInfo, delta),
        child: GestureDetector(
          onPanUpdate: (d) => goldenDiffPageStore.highlightTransform =
              Matrix4.translationValues(d.delta.dx, d.delta.dy, 0).multiplied(goldenDiffPageStore.highlightTransform),
          child: Column(
            children: [
              const SizedBox(height: 24),
              _buildHeader(highlightInfo),
              const SizedBox(height: 24),
              Expanded(
                child: Row(
                  children: [
                    _buildImage(
                      name: 'Original',
                      imageSize: imageSize,
                      builder: (filterQuality) =>
                          Image(image: MemoryImage(highlightInfo.originalContent), filterQuality: filterQuality),
                    ),
                    _buildImage(
                      name: 'New',
                      imageSize: imageSize,
                      builder: (filterQuality) =>
                          Image(image: MemoryImage(highlightInfo.newContent), filterQuality: filterQuality),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Expanded(
                child: Row(
                  children: [
                    _buildImage(
                      name: 'Masked Diff',
                      imageSize: imageSize,
                      builder: (filterQuality) => maskedDiff == null //
                          ? Container()
                          : RawImage(image: maskedDiff, filterQuality: filterQuality),
                    ),
                    _buildImage(
                      name: 'Isolated Diff',
                      imageSize: imageSize,
                      builder: (filterQuality) => isolatedDiff == null
                          ? Container()
                          : RawImage(image: isolatedDiff, filterQuality: filterQuality),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      );
    });
  }

  Widget _buildImage({
    required String name,
    required Size? imageSize,
    required Widget Function(FilterQuality) builder,
  }) {
    final goldenDiffPageStore = GetIt.I.get<GoldenDiffPageStore>();

    return Expanded(
      child: LayoutBuilder(builder: (_, constraints) {
        return Observer(builder: (_) {
          final isLargeScale = imageSize != null &&
              constraints.maxWidth / imageSize.width * goldenDiffPageStore.highlightTransform[0] > 1.5;
          final filterQuality = isLargeScale ? FilterQuality.none : FilterQuality.medium;
          // print('hi $isLargeScale');

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            child: Material(
              color: Colors.grey.shade200,
              child: ClipRect(
                child: Column(
                  children: [
                    Text(
                      name,
                      style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                    ),
                    Expanded(
                      child: Observer(
                        builder: (_) => Transform(
                          transform: goldenDiffPageStore.highlightTransform,
                          child: Listener(
                            onPointerSignal: (signal) {
                              if (signal is PointerScrollEvent) {
                                const kScaleRatio = 1.5;
                                final scale = signal.scrollDelta.dy > 0 ? kScaleRatio : (1 / kScaleRatio);

                                goldenDiffPageStore.highlightTransform = _matrixScale(scale, signal.localPosition)
                                    .multiplied(goldenDiffPageStore.highlightTransform);
                              }
                            },
                            child: builder(filterQuality),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
      }),
    );
  }

  void _handleMove(GitFolderInfo gitFolderInfo, int delta) {
    final goldenDiffPageStore = GetIt.I.get<GoldenDiffPageStore>();

    final oldIndex = gitFolderInfo.diffFileInfos.indexWhere((info) => info.path == goldenDiffPageStore.highlightPath);
    if (oldIndex == -1) return;

    final newIndex = (oldIndex + delta + gitFolderInfo.diffFileInfos.length) % gitFolderInfo.diffFileInfos.length;
    goldenDiffPageStore.highlightPath = gitFolderInfo.diffFileInfos[newIndex].path;
  }

  Widget _buildHeader(GitDiffFileInfo highlightInfo) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        children: [
          Text('Diff: ${(highlightInfo.comparisonResult.diffPercent * 100).toStringAsFixed(2)}%'),
          const SizedBox(width: 16),
          Text('Path: ${highlightInfo.path}'),
        ],
      ),
    );
  }
}

Matrix4 _matrixScale(double scale, Offset focalPoint) {
  final dx = (1 - scale) * focalPoint.dx;
  final dy = (1 - scale) * focalPoint.dy;

  //  ..[0]  = scale   # x scale
  //  ..[5]  = scale   # y scale
  //  ..[10] = 1       # diagonal "one"
  //  ..[12] = dx      # x translation
  //  ..[13] = dy      # y translation
  //  ..[15] = 1       # diagonal "one"
  return Matrix4(scale, 0, 0, 0, 0, scale, 0, 0, 0, 0, 1, 0, dx, dy, 0, 1);
}

class _HotKeyHandlerWidget extends StatelessWidget {
  final void Function(int delta) onMove;
  final Widget child;

  const _HotKeyHandlerWidget({
    required this.onMove,
    required this.child,
  });

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
