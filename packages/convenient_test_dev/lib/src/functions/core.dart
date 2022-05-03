import 'dart:async';

import 'package:convenient_test/convenient_test.dart';
import 'package:convenient_test_common/convenient_test_common.dart';
import 'package:convenient_test_dev/src/functions/log.dart';
import 'package:convenient_test_dev/src/support/executor.dart';
import 'package:convenient_test_dev/src/support/setup.dart';
import 'package:convenient_test_dev/src/support/slot.dart';
import 'package:convenient_test_dev/src/third_party/my_test_compat.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:integration_test/integration_test.dart';
import 'package:meta/meta.dart';

class ConvenientTest {
  @internal
  final WidgetTester tester;

  ConvenientTest(this.tester);
}

/// Please make this the only method in your "main" method.
void convenientTestMain(ConvenientTestSlot slot, VoidCallback body) {
  runZonedGuarded(() {
    ConvenientTestWrapperWidget.convenientTestActive = true;

    final declarer = collectIntoDeclarer(() {
      if (WidgetsBinding.instance != null) {
        // This is because:
        // (1) Must call [runZonedGuarded] *outside* [ensureInitialized], otherwise no errors will be captured.
        //     See https://docs.flutter.dev/testing/errors#errors-not-caught-by-flutter for details.
        // (2) [IntegrationTestWidgetsFlutterBinding] must be called *inside* `collectIntoDeclarer`,
        //     because it calls some logic inside it.
        throw Exception('Please do *not* initialize `WidgetsBinding.instance` outside `convenientTestMain`.');
      }
      IntegrationTestWidgetsFlutterBinding.ensureInitialized();

      setupConvenientTest(slot);

      setUpLogTestStartAndEnd();
      body();
    });

    ConvenientTestExecutor.execute(declarer);
  }, (e, s) {
    Log.w('ConvenientTestMain',
        'ConvenientTest captured error (via runZonedGuarded). type(e)=${e.runtimeType} exception=$e stackTrace=$s');
  });
}

typedef TWidgetTesterCallback = Future<void> Function(ConvenientTest t);

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
      convenientTestLog('BODY', '', type: LogEntryType.TEST_BODY);

      final t = ConvenientTest(tester);

      await GetIt.I.get<ConvenientTestSlot>().startApp(t);

      await callback(t);

      // hack, otherwise `hot restart` sometimes makes this variable set strangely, making assertions failed
      // TODO is it ok?
      debugDefaultTargetPlatformOverride = null;
    },
    skip: skip,
  );
}
