import 'dart:async';
import 'dart:convert';

import 'package:convenient_test_dev/src/functions/instance.dart';
import 'package:convenient_test_dev/src/functions/log.dart';
import 'package:convenient_test_dev/src/support/get_it.dart';
import 'package:convenient_test_dev/src/support/slot.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

extension ConvenientTestInteraction on ConvenientTest {
  Future<void> visit(String routeName, {Object? arguments}) async {
    final log = this.log('VISIT', routeName + (arguments != null ? ' arg=${jsonEncode(arguments)}' : ''));

    await pump();
    await log.snapshot(name: 'before');

    // If await, will wait forever until the page is popped - surely we do not want that
    unawaited(
        Navigator.pushNamed(myGetIt.get<ConvenientTestSlot>().getNavContext(this)!, routeName, arguments: arguments));

    await pumpAndSettleWithRunAsync();
    await log.snapshot(name: 'after');
  }

  Future<void> pageBack() async {
    final log = this.log('POP', '');

    await pump();
    await log.snapshot(name: 'before');

    await tester.pageBack();

    await pumpAndSettleWithRunAsync();
    await log.snapshot(name: 'after');
  }

  Future<void> pullDownToRefresh() async {
    final log = this.log('PULL REFRESH', '');

    await pump();
    await log.snapshot(name: 'before');

    // ref https://github.com/peng8350/flutter_pulltorefresh/blob/master/test/refresh_test.dart
    await tester.drag(find.byType(MaterialApp), const Offset(0, 100));

    await pumpAndSettleWithRunAsync();
    await log.snapshot(name: 'after');
  }

  Future<void> pump([Duration? duration]) => tester.pump(duration);

  Future<int> pumpAndSettle() => tester.pumpAndSettle();

  // need `runAsync` between pumps, because when running in widget test, the time in pump is fake.
  // If we do not `runAsync` and *really* sleep, things like real network requests may not be able to be finished.
  // https://github.com/fzyzcjy/yplusplus/issues/8477#issuecomment-1528799681
  Future<void> pumpAndSettleWithRunAsync({
    int maxCount = 50,
    Duration pumpDuration = const Duration(milliseconds: 100),
    Duration realDelayDuration = const Duration(milliseconds: 100),
  }) {
    // impl ref `pumpAndSettle`
    return TestAsyncUtils.guard<int>(() async {
      int count = 0;
      do {
        if (count >= maxCount) throw FlutterError('pumpAndSettleWithRunAsync timed out');
        await tester.binding.pump(pumpDuration);
        await tester.runAsync(() => Future<void>.delayed(realDelayDuration));
        count += 1;
      } while (tester.binding.hasScheduledFrame);
      return count;
    });
  }
}
