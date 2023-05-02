import 'package:convenient_test_common_dart/convenient_test_common_dart.dart';
import 'package:convenient_test_dev/src/functions/instance.dart';
import 'package:convenient_test_dev/src/functions/interaction.dart';
import 'package:convenient_test_dev/src/functions/log.dart';
import 'package:convenient_test_dev/src/support/get_it.dart';
import 'package:convenient_test_dev/src/support/slot.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:meta/meta.dart';

/// Wrapper around [testWidgets].
///
/// If the app's main widget contains a widget that never settles (for example:
/// has animations that repeat infinitely), set [settle] to false.
@isTest
void tTestWidgets(
  // ... forward the arguments ...
  String description,
  TWidgetTesterCallback callback, {
  bool skip = false,
  bool settle = true,
  Timeout? timeout,
}) {
  testWidgets(
    description,
    (tester) async => await ConvenientTest.withActiveInstance(tester, (t) async {
      // Only log START/END for the `tTestWidgets`. Thus, when using `test` or `testWidgets`, i.e. when
      // users setup convenient_test but not use it for that specific test, we do not waste time doing logging
      // https://github.com/fzyzcjy/yplusplus/issues/8554#issuecomment-1530977507
      convenientTestLog('START', '', type: LogSubEntryType.TEST_START);
      addTearDown(() => convenientTestLog('END', '', type: LogSubEntryType.TEST_END));
      // t.log('START APP', '');

      await tester.runAsync(() async {
        await myGetIt.get<ConvenientTestSlot>().appMain(AppMainExecuteMode.integrationTest);
      });
      settle ? await t.pumpAndSettleWithRunAsync() : await t.pump();
      // https://github.com/fzyzcjy/yplusplus/issues/8470#issuecomment-1528784564
      // await log.snapshot(name: 'after');

      await callback(t);

      // hack, otherwise `hot restart` sometimes makes this variable set strangely, making assertions failed
      // TODO is it ok?
      debugDefaultTargetPlatformOverride = null;
    }),
    skip: skip,
    timeout: timeout,
  );
}

typedef TWidgetTesterCallback = Future<void> Function(ConvenientTest t);
