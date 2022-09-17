import 'dart:async';
import 'dart:convert';

import 'package:convenient_test_dev/src/functions/core.dart';
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

    await pumpAndSettle();
    await log.snapshot(name: 'after');
  }

  Future<void> pageBack() async {
    final log = this.log('POP', '');

    await pump();
    await log.snapshot(name: 'before');

    await tester.pageBack();

    await pumpAndSettle();
    await log.snapshot(name: 'after');
  }

  Future<void> pullDownToRefresh() async {
    final log = this.log('PULL REFRESH', '');

    await pump();
    await log.snapshot(name: 'before');

    // ref https://github.com/peng8350/flutter_pulltorefresh/blob/master/test/refresh_test.dart
    await tester.drag(find.byType(MaterialApp), const Offset(0, 100));

    await pumpAndSettle();
    await log.snapshot(name: 'after');
  }

  Future<void> pump([Duration? duration]) => tester.pump(duration);

  Future<int> pumpAndSettle() => tester.pumpAndSettle();
}
