import 'package:convenient_test_common/convenient_test_common.dart';
import 'package:convenient_test_manager/components/misc/enhanced_selectable_text.dart';
import 'package:convenient_test_manager/components/misc/rotate_animation.dart';
import 'package:convenient_test_manager/stores/log_store.dart';
import 'package:convenient_test_manager/stores/organization_store.dart';
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
    final organizationStore = GetIt.I.get<OrganizationStore>();

    // const kSkipTypes = [
    //   LogEntryType.TEST_START,
    //   LogEntryType.TEST_BODY,
    //   LogEntryType.TEST_END,
    // ];

    return Observer(builder: (_) {
      final logEntry = logStore.logEntryMap[logEntryId]!;

      // if (kSkipTypes.contains(logEntry.type)) {
      //   return Container();
      // }

      final active = logStore.activeLogEntryId == logEntryId;

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onHover: (hovering) {
              if (hovering) {
                logStore.activeLogEntryId = logEntryId;
                organizationStore.activeTestEntryId = testEntryId;
              }
            },
            onTap: () {
              final targetState = !active;
              logStore.activeLogEntryId = targetState ? logEntryId : null;
              organizationStore.activeTestEntryId = targetState ? testEntryId : null;
            },
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 8),
              margin: const EdgeInsets.only(left: 32),
              decoration: BoxDecoration(
                color: active ? Colors.green[50] : (running ? Colors.blue[50] : Colors.blueGrey[50]!.withAlpha(150)),
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
                  _buildTitle(logEntry),
                  Container(width: 12),
                  Expanded(
                    child: EnhancedSelectableText(
                      logEntry.message,
                      // style: const TextStyle(fontFamily: 'RobotoMono'),
                      enableCopyAllButton: false,
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (logEntry.error.isNotEmpty) _buildError(context, logEntry)
        ],
      );
    });
  }

  Widget _buildTitle(LogEntry logEntry) {
    return SizedBox(
      width: 80,
      child: Builder(
        builder: (_) {
          Color? backgroundColor;
          var textColor = Colors.black;
          if (logEntry.type == LogEntryType.ASSERT) {
            backgroundColor = Colors.green;
            textColor = Colors.white;
          }
          if (logEntry.type == LogEntryType.ASSERT_FAIL) {
            backgroundColor = Colors.red;
            textColor = Colors.white;
          }

          return Align(
            alignment: Alignment.centerLeft,
            child: Container(
              padding: backgroundColor == null ? null : const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
              decoration: BoxDecoration(
                color: backgroundColor,
              ),
              child: Text(
                logEntry.title,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: textColor,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildError(BuildContext context, LogEntry logEntry) {
    final text = '${logEntry.error}\n${logEntry.stackTrace}';

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      margin: const EdgeInsets.only(left: 32),
      decoration: BoxDecoration(
        color: Colors.red[50],
        border: Border(left: BorderSide(color: Colors.red[200]!, width: 2)),
      ),
      child: EnhancedSelectableText(
        text,
        style: const TextStyle(fontSize: 13, fontFamily: 'RobotoMono'),
      ),
    );
  }
}
