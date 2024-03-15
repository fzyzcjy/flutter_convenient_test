import 'dart:typed_data';

import 'package:collection/collection.dart';
import 'package:convenient_test_common/convenient_test_common.dart';
import 'package:convenient_test_manager/components/misc/enhanced_selectable_text.dart';
import 'package:convenient_test_manager/components/misc/rotate_animation.dart';
import 'package:convenient_test_manager/misc/protobuf_extensions.dart';
import 'package:convenient_test_manager/stores/highlight_store.dart';
import 'package:convenient_test_manager/stores/home_page_store.dart';
import 'package:convenient_test_manager/stores/video_player_store.dart';
import 'package:convenient_test_manager_dart/stores/log_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_portal/flutter_portal.dart';
import 'package:get_it/get_it.dart';

class HomePageLogEntryWidget extends StatelessWidget {
  final int order;
  final int testEntryId;
  final int logEntryId;
  final bool running;

  const HomePageLogEntryWidget({
    super.key,
    required this.order,
    required this.testEntryId,
    required this.logEntryId,
    required this.running,
  });

  @override
  Widget build(BuildContext context) {
    final homePageStore = GetIt.I.get<HomePageStore>();

    const kScreenshotPeriod = 8;
    final screenshotIndexModPeriod = order % kScreenshotPeriod;

    return Observer(builder: (context) {
      return Row(
        children: [
          Expanded(
            flex: kScreenshotPeriod,
            child: _buildCore(context),
          ),
          if (!homePageStore.expandSecondaryPanel) ...[
            _buildSpacer(flex: screenshotIndexModPeriod),
            Expanded(
              flex: 1,
              child: _HomePageLogEntryScreenshotPreview(
                logEntryId: logEntryId,
              ),
            ),
            _buildSpacer(
                flex: kScreenshotPeriod - 1 - screenshotIndexModPeriod),
          ]
        ],
      );
    });
  }

  Widget _buildSpacer({required int flex}) =>
      flex <= 0 ? const SizedBox.shrink() : Spacer(flex: flex);

  Widget _buildCore(BuildContext context) {
    final logStore = GetIt.I.get<LogStore>();
    final highlightStore = GetIt.I.get<HighlightStore>();

    final logSubEntryIds = logStore.logSubEntryInEntry[logEntryId];
    if (logSubEntryIds == null) return const SizedBox.shrink();
    final interestLogSubEntry = logStore.logSubEntryMap[logSubEntryIds.last];
    if (interestLogSubEntry == null) return const SizedBox.shrink();

    final isSection = interestLogSubEntry.type == LogSubEntryType.SECTION;

    // if (kSkipTypes.contains(logEntry.type)) {
    //   return Container();
    // }

    final active = highlightStore.highlightLogEntryId == logEntryId;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onHover: (hovering) {
            if (highlightStore.enableHoverMode && hovering) {
              _handleTapOrHover(interestLogSubEntry, targetState: true);
            }
          },
          onTap: () =>
              _handleTapOrHover(interestLogSubEntry, targetState: !active),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 8),
            margin: isSection //
                ? const EdgeInsets.only(left: 32, top: 16)
                : const EdgeInsets.only(left: 32),
            decoration: BoxDecoration(
              color: _calcDecorationColor(context,
                  isSection: isSection, active: active),
              border: Border(
                left: running
                    ? BorderSide(
                        color: Theme.of(context).colorScheme.primary, width: 2)
                    : BorderSide.none,
                // top: isSection ? BorderSide(color: Theme.of(context).primaryColor, width: 2) : BorderSide.none,
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 24,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: running //
                        ? const RotateAnimation(
                            duration: Duration(seconds: 2),
                            child: Icon(
                              Icons.autorenew,
                              size: 16,
                              color: Colors.indigo,
                            ),
                          )
                        : Center(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 4, left: 8),
                              child: Text(
                                '$order',
                                style: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.onSurface,
                                    fontSize: 9),
                              ),
                            ),
                          ),
                  ),
                ),
                Container(width: 12),
                _buildTitle(interestLogSubEntry, context),
                Container(width: 12),
                Expanded(
                  child: EnhancedSelectableText(
                    interestLogSubEntry.message,
                    enableCopyAllButton: false,
                  ),
                ),
                Container(width: 4),
                _buildTime(logSubEntryIds: logSubEntryIds, context: context),
                Container(width: 4),
                Container(width: 4),
              ],
            ),
          ),
        ),
        if (interestLogSubEntry.error.isNotEmpty)
          _buildError(context, interestLogSubEntry)
      ],
    );
  }

  Color _calcDecorationColor(BuildContext context,
      {required bool isSection, required bool active}) {
    double elevation = 1;
    if (isSection) elevation = 2;

    if (active) elevation = 3;
    final colorScheme = Theme.of(context).colorScheme;
    return ElevationOverlay.applySurfaceTint(
        colorScheme.surface, colorScheme.surfaceTint, elevation);
  }

  void _handleTapOrHover(LogSubEntry interestLogSubEntry,
      {required bool targetState}) {
    final highlightStore = GetIt.I.get<HighlightStore>();
    final videoPlayerStore = GetIt.I.get<VideoPlayerStore>();

    highlightStore.highlightLogEntryId = targetState ? logEntryId : null;
    highlightStore.highlightTestEntryId = targetState ? testEntryId : null;

    if (targetState) {
      final activeVideo = videoPlayerStore.activeVideo;
      if (activeVideo != null) {
        videoPlayerStore.mainPlayerController.seek(
            activeVideo.absoluteToVideoTime(interestLogSubEntry.timeTyped));
      }
    }
  }

  Widget _buildTitle(LogSubEntry interestLogSubEntry, BuildContext context) {
    final Color? backgroundColor;
    final Color textColor;
    switch (interestLogSubEntry.type) {
      case LogSubEntryType.ASSERT:
        backgroundColor = Colors.green;
        textColor = Colors.white;
        break;
      case LogSubEntryType.ASSERT_FAIL:
        backgroundColor = Theme.of(context).colorScheme.error;
        textColor = Theme.of(context).colorScheme.onError;
        break;
      case LogSubEntryType.SECTION:
        backgroundColor = Theme.of(context).colorScheme.primary;
        textColor = Theme.of(context).colorScheme.onPrimary;
        break;
      default:
        backgroundColor = null;
        textColor = Theme.of(context).colorScheme.onBackground;
        break;
    }

    return SizedBox(
      width: 80,
      child: Align(
        alignment: Alignment.centerLeft,
        child: Container(
          padding: backgroundColor == null
              ? null
              : const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
          decoration: BoxDecoration(
            color: backgroundColor,
          ),
          child: Text(
            interestLogSubEntry.title,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: textColor,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildError(BuildContext context, LogSubEntry interestLogSubEntry) {
    final homePageStore = GetIt.I.get<HomePageStore>();

    return Observer(builder: (_) {
      final expand = homePageStore.logEntryExpandErrorInfoMap[logEntryId];

      final text =
          '${interestLogSubEntry.error}\n${interestLogSubEntry.stackTrace}';

      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        margin: const EdgeInsets.only(left: 32),
        decoration: BoxDecoration(
          color: Theme.of(context).brightness == Brightness.light //
              ? Colors.red.shade50
              : const Color(0xFF6C2827),
          border: Border(left: BorderSide(color: Colors.red[200]!, width: 2)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: expand ? double.infinity : 100,
              ),
              child: SizedBox(
                width: double.infinity,
                child: EnhancedSelectableText(
                  text,
                  style: const TextStyle(
                    fontSize: 13,
                    fontFamily: 'RobotoMono',
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () => homePageStore
                    .logEntryExpandErrorInfoMap[logEntryId] = !expand,
                child: Text(
                  '[${expand ? "Collapse" : "Expand"}]',
                  style: TextStyle(
                      fontSize: 12,
                      color: Theme.of(context).colorScheme.onBackground),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }

  Widget _buildTime(
      {required List<int> logSubEntryIds, required BuildContext context}) {
    final logStore = GetIt.I.get<LogStore>();

    final testStartTime = logStore
        .logSubEntryMap[logStore.logSubEntryInTest(testEntryId).first]!
        .timeTyped;
    final logEntryStartTime =
        logStore.logSubEntryMap[logSubEntryIds.first]!.timeTyped;
    final logEntryEndTime =
        logStore.logSubEntryMap[logSubEntryIds.last]!.timeTyped;

    final logEntryStartDisplay =
        _formatDuration(logEntryStartTime.difference(testStartTime));
    final logEntryEndDisplay =
        _formatDuration(logEntryEndTime.difference(testStartTime));

    final shouldShowLogEndDisplay =
        logEntryEndTime.difference(logEntryStartTime) >
            const Duration(milliseconds: 300);

    return Text(
      '$logEntryStartDisplay${shouldShowLogEndDisplay ? '-$logEntryEndDisplay' : ''}s',
      style: TextStyle(
        fontSize: 10,
        color: Theme.of(context).colorScheme.outline,
        fontFamily: 'RobotoMono',
      ),
    );
  }

  String _formatDuration(Duration d) =>
      (d.inMilliseconds / 1000).toStringAsFixed(1);
}

class _HomePageLogEntryScreenshotPreview extends StatelessWidget {
  final int logEntryId;

  const _HomePageLogEntryScreenshotPreview({required this.logEntryId});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraints) => PortalTarget(
        anchor: const Aligned(
          follower: Alignment.topCenter,
          target: Alignment.topCenter,
        ),
        portalFollower:
            _buildPortalFollower(context, width: constraints.maxWidth),
        child: const SizedBox(),
      ),
    );
  }

  Widget _buildPortalFollower(BuildContext context, {required double width}) {
    final highlightStore = GetIt.I.get<HighlightStore>();
    final highlight = highlightStore.highlightLogEntryId == logEntryId;

    final snapshot = _calcInterestSnapshot();
    if (snapshot == null) return const SizedBox();

    return SizedBox(
      width: width,
      child: Container(
        decoration: BoxDecoration(
          border: highlight //
              ? Border.all(color: Theme.of(context).primaryColor, width: 2)
              : Border.all(color: Colors.grey),
        ),
        child: Image.memory(snapshot.value),
      ),
    );
  }

  MapEntry<String, Uint8List>? _calcInterestSnapshot() {
    final logStore = GetIt.I.get<LogStore>();
    final snapshots =
        logStore.snapshotInLog[logEntryId] ?? const <String, Uint8List>{};

    for (final key in const ['after', 'before']) {
      if (snapshots.containsKey(key)) return MapEntry(key, snapshots[key]!);
    }
    return snapshots.entries.firstOrNull;
  }
}
