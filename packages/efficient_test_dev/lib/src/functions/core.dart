import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:integration_test/integration_test.dart';
import 'package:meta/meta.dart';
import 'package:test_tool_common/test_tool_common.dart';
import 'package:test_tool_worker/test_tool_worker.dart';
import 'package:test_tool_worker_dev/src/functions/log.dart';
import 'package:test_tool_worker_dev/src/support/executor.dart';
import 'package:test_tool_worker_dev/src/support/setup.dart';
import 'package:test_tool_worker_dev/src/support/slot.dart';
import 'package:test_tool_worker_dev/src/third_party/my_test_compat.dart';

class TestTool {
  @internal
  final WidgetTester tester;

  TestTool(this.tester);
}

/// Please make this the only method in your "main" method.
void testToolMain(TestToolSlot slot, VoidCallback body) {
  runZonedGuarded(() {
    TestToolWrapperWidget.testToolActive = true;

    final declarer = collectIntoDeclarer(() {
      if (WidgetsBinding.instance != null) {
        // This is because:
        // (1) Must call [runZonedGuarded] *outside* [ensureInitialized], otherwise no errors will be captured.
        //     See https://docs.flutter.dev/testing/errors#errors-not-caught-by-flutter for details.
        // (2) [IntegrationTestWidgetsFlutterBinding] must be called *inside* `collectIntoDeclarer`,
        //     because it calls some logic inside it.
        throw Exception('Please do *not* initialize `WidgetsBinding.instance` outside `testToolMain`.');
      }
      IntegrationTestWidgetsFlutterBinding.ensureInitialized();

      setupTestTool(slot);

      setUpLogTestStartAndEnd();
      body();
    });

    TestToolExecutor.execute(declarer);
  }, (e, s) {
    Log.w('TestToolMain',
        'TestTool captured error (via runZonedGuarded). type(e)=${e.runtimeType} exception=$e stackTrace=$s');
  });
}

typedef TWidgetTesterCallback = Future<void> Function(TestTool t);

@isTest
void tTestWidgets(
  // ... forward the arguments ...
  String description,
  TWidgetTesterCallback callback, {
  bool skip = false,
}) {
  testWidgets(
    description,
    (tester) async {
      testToolLog('BODY', '', type: LogEntryType.TEST_BODY);

      final t = TestTool(tester);

      await GetIt.I.get<TestToolSlot>().startApp(t);

      await callback(t);

      // hack, otherwise `hot restart` sometimes makes this variable set strangely, making assertions failed
      // TODO is it ok?
      debugDefaultTargetPlatformOverride = null;
    },
    skip: skip,
  );
}
