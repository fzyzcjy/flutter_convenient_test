import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:test_tool_common/test_tool_common.dart';
import 'package:test_tool_manager/components/misc/rotate_animation.dart';
import 'package:test_tool_manager/stores/log_store.dart';

class HomePageLogEntryWidget extends StatelessWidget {
  final int order;
  final int logEntryId;
  final bool running;

  const HomePageLogEntryWidget({
    Key? key,
    required this.order,
    required this.logEntryId,
    required this.running,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logStore = GetIt.I.get<LogStore>();

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
              if (hovering) logStore.activeLogEntryId = logEntryId;
            },
            onTap: () {
              logStore.activeLogEntryId = active ? null : logEntryId;
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
                              duration: Duration(seconds: 1),
                              child: Icon(
                                Icons.autorenew,
                                size: 16,
                                color: Colors.grey,
                              ),
                            )
                          : Text(
                              '$order',
                              style: const TextStyle(color: Colors.grey),
                            ),
                    ),
                  ),
                  Container(width: 12),
                  SizedBox(
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
                            padding:
                                backgroundColor == null ? null : const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
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
                  ),
                  Container(width: 12),
                  Expanded(
                    child: Text(logEntry.message),
                  ),
                ],
              ),
            ),
          ),
          if (logEntry.error.isNotEmpty)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              margin: const EdgeInsets.only(left: 32),
              decoration: BoxDecoration(
                color: Colors.red[50],
                border: Border(left: BorderSide(color: Colors.red[200]!, width: 2)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(logEntry.error),
                  Text(logEntry.stackTrace),
                ],
              ),
            )
        ],
      );
    });
  }
}
