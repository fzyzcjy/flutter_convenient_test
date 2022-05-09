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
import 'package:get_it/get_it.dart';

class HomePageLogEntryWidget extends StatelessWidget {
  final int order;
  final int testEntryId;
  final int logEntryId;
  final bool running;

  const HomePageLogEntryWidget({
    Key? key,
    required this.order,
    required this.testEntryId,
    required this.logEntryId,
    required this.running,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logStore = GetIt.I.get<LogStore>();
    final highlightStore = GetIt.I.get<HighlightStore>();

    // const kSkipTypes = [
    //   LogEntryType.TEST_START,
    //   LogEntryType.TEST_BODY,
    //   LogEntryType.TEST_END,
    // ];

    return Observer(builder: (_) {
      final logSubEntryIds = logStore.logSubEntryInEntry[logEntryId];
      if (logSubEntryIds == null) return const SizedBox.shrink();
      final interestLogSubEntry = logStore.logSubEntryMap[logSubEntryIds.last];
      if (interestLogSubEntry == null) return const SizedBox.shrink();

      // if (kSkipTypes.contains(logEntry.type)) {
      //   return Container();
      // }

      final active = highlightStore.highlightLogEntryId == logEntryId;

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onHover: (hovering) {
              if (highlightStore.enableHoverMode && hovering) _handleTapOrHover(interestLogSubEntry, targetState: true);
            },
            onTap: () => _handleTapOrHover(interestLogSubEntry, targetState: !active),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 8),
              margin: const EdgeInsets.only(left: 32),
              decoration: BoxDecoration(
                color: _calcDecorationColor(context, active: active),
                border: running ? Border(left: BorderSide(color: Theme.of(context).primaryColor, width: 2)) : null,
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
                          : Text(
                              '$order',
                              style: const TextStyle(color: Colors.grey),
                            ),
                    ),
                  ),
                  Container(width: 12),
                  _buildTitle(interestLogSubEntry),
                  Container(width: 12),
                  Expanded(
                    child: EnhancedSelectableText(
                      interestLogSubEntry.message,
                      // style: const TextStyle(fontFamily: 'RobotoMono'),
                      enableCopyAllButton: false,
                    ),
                  ),
                  Container(width: 4),
                  _buildTime(logSubEntryIds: logSubEntryIds),
                  Container(width: 4),
                  Container(width: 4),
                ],
              ),
            ),
          ),
          if (interestLogSubEntry.error.isNotEmpty) _buildError(context, interestLogSubEntry)
        ],
      );
    });
  }

  Color _calcDecorationColor(BuildContext context, {required bool active}) {
    if (active) return Colors.green[50]!;
    if (running) return Colors.blue[50]!;
    return Colors.blueGrey[50]!.withAlpha(150);
  }

  void _handleTapOrHover(LogSubEntry interestLogSubEntry, {required bool targetState}) {
    final highlightStore = GetIt.I.get<HighlightStore>();
    final videoPlayerStore = GetIt.I.get<VideoPlayerStore>();

    highlightStore.highlightLogEntryId = targetState ? logEntryId : null;
    highlightStore.highlightTestEntryId = targetState ? testEntryId : null;

    if (targetState) {
      final activeVideo = videoPlayerStore.activeVideo;
      if (activeVideo != null) {
        videoPlayerStore.mainPlayerController.seek(activeVideo.absoluteToVideoTime(interestLogSubEntry.timeTyped));
      }
    }
  }

  Widget _buildTitle(LogSubEntry interestLogSubEntry) {
    final Color? backgroundColor;
    final Color textColor;
    switch (interestLogSubEntry.type) {
      case LogSubEntryType.ASSERT:
        backgroundColor = Colors.green;
        textColor = Colors.white;
        break;
      case LogSubEntryType.ASSERT_FAIL:
        backgroundColor = Colors.red;
        textColor = Colors.white;
        break;
      case LogSubEntryType.SECTION:
        backgroundColor = Colors.blue;
        textColor = Colors.white;
        break;
      default:
        backgroundColor = null;
        textColor = Colors.black;
        break;
    }

    return SizedBox(
      width: 80,
      child: Align(
        alignment: Alignment.centerLeft,
        child: Container(
          padding: backgroundColor == null ? null : const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
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

      final text = '${interestLogSubEntry.error}\n${interestLogSubEntry.stackTrace}';

      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        margin: const EdgeInsets.only(left: 32),
        decoration: BoxDecoration(
          color: Colors.red[50],
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
                onPressed: () => homePageStore.logEntryExpandErrorInfoMap[logEntryId] = !expand,
                child: Text(
                  '[${expand ? "Collapse" : "Expand"}]',
                  style: const TextStyle(fontSize: 12, color: Colors.black87),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }

  Widget _buildTime({required List<int> logSubEntryIds}) {
    final logStore = GetIt.I.get<LogStore>();

    final testStartTime = logStore.logSubEntryMap[logStore.logSubEntryInTest(testEntryId).first]!.timeTyped;
    final logEntryStartTime = logStore.logSubEntryMap[logSubEntryIds.first]!.timeTyped;
    final logEntryEndTime = logStore.logSubEntryMap[logSubEntryIds.last]!.timeTyped;

    final logEntryStartDisplay = _formatDuration(logEntryStartTime.difference(testStartTime));
    final logEntryEndDisplay = _formatDuration(logEntryEndTime.difference(testStartTime));

    final shouldShowLogEndDisplay = logEntryEndTime.difference(logEntryStartTime) > const Duration(milliseconds: 300);

    return Text(
      '$logEntryStartDisplay${shouldShowLogEndDisplay ? '-$logEntryEndDisplay' : ''}s',
      style: const TextStyle(
        fontSize: 10,
        color: Colors.grey,
        fontFamily: 'RobotoMono',
      ),
    );
  }

  String _formatDuration(Duration d) => (d.inMilliseconds / 1000).toStringAsFixed(1);
}
