import 'dart:async';
import 'dart:convert';

import 'package:convenient_test_dev/convenient_test_dev.dart';
import 'package:convenient_test_dev/src/support/get_it.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

extension ConvenientTestInteraction on ConvenientTest {
  Future<void> visit(String routeName,
      {Object? arguments, bool? settle, bool replace = false}) async {
    final log = this.log(
        'VISIT',
        routeName +
            (arguments != null ? ' arg=${jsonEncode(arguments)}' : '') +
            (replace ? ' , replace' : ''));

    await pump();
    await log.snapshot(name: 'before');

    // If await, will wait forever until the page is popped - surely we do not want that
    final context = myGetIt.get<ConvenientTestSlot>().getNavContext(this)!;
    if (replace) {
      // ignore: use_build_context_synchronously
      unawaited(Navigator.pushReplacementNamed(context, routeName,
          arguments: arguments));
    } else {
      // ignore: use_build_context_synchronously
      unawaited(Navigator.pushNamed(context, routeName, arguments: arguments));
    }

    await tester.pumpAndMaybeSettleWithRunAsync(settle: settle);
    await log.snapshot(name: 'after');
  }

  Future<void> pageBack({bool? settle}) async {
    final log = this.log('POP', '');

    await pump();
    await log.snapshot(name: 'before');

    await tester.pageBack();

    await tester.pumpAndMaybeSettleWithRunAsync(settle: settle);
    await log.snapshot(name: 'after');
  }

  Future<void> pullDownToRefresh({bool? settle}) async {
    final log = this.log('PULL REFRESH', '');

    await pump();
    await log.snapshot(name: 'before');

    // ref https://github.com/peng8350/flutter_pulltorefresh/blob/master/test/refresh_test.dart
    await tester.drag(find.byType(MaterialApp), const Offset(0, 100));

    await tester.pumpAndMaybeSettleWithRunAsync(settle: settle);
    await log.snapshot(name: 'after');
  }

  Future<void> pump([Duration? duration]) => tester.pump(duration);

  Future<int> pumpAndSettle() => tester.pumpAndSettle();

  Future<void> pumpAndSettleWithRunAsync() =>
      tester.pumpAndSettleWithRunAsync();
}
