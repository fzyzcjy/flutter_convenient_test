import 'package:convenient_test_common_dart/convenient_test_common_dart.dart';
import 'package:convenient_test_manager/main.dart';
import 'package:convenient_test_manager/misc/setup.dart';
import 'package:convenient_test_manager_dart/services/convenient_test_manager_service.dart';
import 'package:convenient_test_manager_dart/services/vm_service_wrapper_service.dart';
import 'package:convenient_test_manager_dart/stores/suite_info_store.dart';
import 'package:fixnum/fixnum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'fake_vm_service_wrapper.dart';

var isSetup = false;
void main() {
  // color scheme breaks goldens, so we need two variants
  myAppGoldenTest(ThemeMode.light);
  myAppGoldenTest(ThemeMode.dark);
}

Future<void> myAppGoldenTest(ThemeMode theme) async {
  testWidgets('UI Golden theme=$theme', (tester) async {
    await tester.binding.setSurfaceSize(const Size(1920, 1080));

    if (!isSetup) {
      await setup(registerVmServiceWrapper: false);
      getIt.registerSingleton<VmServiceWrapperService>(FakeVmServiceWrapper());
      isSetup = true;
      Log.d('myAppGoldenTest', 'setup finished');
    }

    await tester.pumpWidget(MyApp(theme: theme));
    await sendTestCalls();
    await expectLater(find.byType(MyApp),
        matchesGoldenFile('manager-golden-${theme.name}.png'));
  });
}

Future<void> sendTestCalls() async {
  final mService = getIt.get<ConvenientTestManagerService>();

  final groupID = Counter.next();
  final testID = Counter.next();
  const testName = 'Test';
  ReportItem logEntryItem(List<LogSubEntry> items) => ReportItem(
      logEntry: LogEntry(
          testName: testName,
          id: Counter.next(),
          subEntries: items.map(
            (x) => x
              ..id = Counter.next()
              ..time = msse64(),
          )));

  final suite = SuiteInfoProto(groupId: 0.toInt64(), groups: [
    GroupInfoProto(
      id: groupID,
      name: 'Group',
      parentId: 0.toInt64(),
      entryIds: [testID],
    ),
  ], tests: [
    TestInfoProto(
      id: testID,
      parentId: groupID,
      name: testName,
    )
  ]);

  await mService.reportSingle(ReportItem(setUpAll: SetUpAll()));
  await mService.reportSingle(ReportItem(suiteInfoProto: suite));
  await Future<void>.delayed(const Duration(seconds: 5));

  await mService.reportSingle(ReportItem(
    runnerStateChange: RunnerStateChange(
      state: TestEntryState(result: 'success', status: 'running'),
      testName: testName,
    ),
  ));

  await mService.reportSingle(logEntryItem(
      [LogSubEntry(title: 'START', type: LogSubEntryType.TEST_START)]));

  await mService.reportSingle(logEntryItem([
    LogSubEntry(type: LogSubEntryType.GENERAL_MESSAGE, title: 'START APP')
  ]));
  await mService.reportSingle(logEntryItem([
    LogSubEntry(
        type: LogSubEntryType.GENERAL_MESSAGE,
        title: 'TAP',
        message: 'NonExistentButton')
  ]));
  await mService.reportSingle(logEntryItem([
    LogSubEntry(
        type: LogSubEntryType.SECTION, title: 'SECTION', message: 'Section')
  ]));
  await mService.reportSingle(logEntryItem([
    LogSubEntry(
      type: LogSubEntryType.TEST_END,
      title: 'END',
    )
  ]));

  await mService.reportSingle(ReportItem(
      runnerStateChange: RunnerStateChange(
          state: TestEntryState(result: 'success', status: 'running'))));
  await mService.reportSingle(ReportItem(
      tearDownAll: TearDownAll(
          resolvedExecutionFilter: ResolvedExecutionFilterProto(
              allowExecuteTestNames: [testName]))));
  await mService.reportSingle(ReportItem(
      runnerStateChange: RunnerStateChange(
          testName: '(tearDownAll)',
          state: TestEntryState(status: 'complete', result: 'success'))));
  Log.d('sendTestCalls', 'waiting for 5 seconds to let the UI build');
  await Future<void>.delayed(const Duration(seconds: 5));
}

extension ReportSingle on ConvenientTestManagerService {
  Future<void> reportSingle(ReportItem item) =>
      reportInner(ReportCollection(items: [item]));
}

class Counter {
  static int value = 0;
  static Int64 next() {
    value = value + 1;
    return (value + 1).toInt64();
  }
}

Int64 msse64() => DateTime.now().millisecondsSinceEpoch.toInt64();
