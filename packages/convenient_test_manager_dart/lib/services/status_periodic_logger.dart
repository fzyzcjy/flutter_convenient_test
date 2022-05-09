import 'dart:async';
import 'dart:math';

import 'package:convenient_test_manager_dart/stores/log_store.dart';
import 'package:convenient_test_manager_dart/stores/suite_info_store.dart';
import 'package:get_it/get_it.dart';

class StatusPeriodicLogger {
  final _startTime = DateTime.now();

  StatusPeriodicLogger.run() {
    Timer.periodic(const Duration(seconds: 2), (_) => _handlePeriodic());
  }

  void _handlePeriodic() {
    final suiteInfoStore = GetIt.I.get<SuiteInfoStore>();
    final logStore = GetIt.I.get<LogStore>();

    final duration = DateTime.now().difference(_startTime);
    final durationHint = '${duration.inMinutes}:${(duration.inSeconds % 60).toString().padLeft(2, "0")}';

    final suiteInfo = suiteInfoStore.suiteInfo;
    final stateCountMap = suiteInfo == null ? null : suiteInfoStore.calcStateCountMap(suiteInfo.rootGroup);
    final stateCountHint = stateCountMap?.entries //
        .where((e) => e.value > 0)
        .map((e) => '${e.value}x ${e.key.name}')
        .join(', ');

    final maxLogSubEntryId = logStore.logSubEntryMap.keys.fold(0, max);
    final interestTestId = logStore.testIdOfLogEntry[logStore.logEntryIdOfLogSubEntry[maxLogSubEntryId]];
    final interestTest = suiteInfo?.entryMap[interestTestId];
    final interestTestHint = 'Test=${interestTest?.name}';

    // ignore: avoid_print
    print('[STATUS] [$durationHint] [$stateCountHint] [$interestTestHint]');
  }
}
