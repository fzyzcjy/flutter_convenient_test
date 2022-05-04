import 'package:convenient_test_dev/convenient_test_dev.dart';
import 'package:convenient_test_example/main.dart' as app;
import 'package:convenient_test_example/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  convenientTestMain(MyConvenientTestSlot(), () {
    group('sample group one', () {
      tTestWidgets('empty test', (t) async {
        // just an empty test
      });

      tTestWidgets('deliberately failing test', (t) async {
        expect(1, 0, reason: 'this expect should deliberately fail');
      });
    });

    group('sample group two', () {
      tTestWidgets('tap counter', (t) async {
        await t.get(find.textContaining('No tap')).should(findsOneWidget);
        await t.get(MyAppMark.button).tap();
        await t.get(find.textContaining('1 tap')).should(findsOneWidget);
        await t.get(MyAppMark.button).tap();
        await t.get(find.textContaining('2 taps')).should(findsOneWidget);
      });
    });
  });
}

class MyConvenientTestSlot extends ConvenientTestSlot {
  @override
  Future<void> startApp(ConvenientTest t) async {
    app.main();
  }

  @override
  BuildContext? getNavContext(ConvenientTest t) => MyApp.navigatorKey.currentContext;

  @override
  String get managerHost => '192.168.0.107'; // TODO
}
