import 'dart:async';
import 'dart:convert';

import 'package:convenient_test_dev/convenient_test_dev.dart';
import 'package:convenient_test_dev/src/support/get_it.dart';
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

  Future<void> pumpAndSettleWithRunAsync() => tester.pumpAndSettleWithRunAsync();
}
