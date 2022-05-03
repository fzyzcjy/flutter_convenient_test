import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:efficient_test_dev/efficient_test_dev.dart';
import 'package:efficient_test_example/main.dart' as app;
import 'package:efficient_test_example/main.dart';

void main() {
  testToolMain(MyTestToolSlot(), () {
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
        await t.get(find.textContaining('Count: 0')).should(findsOneWidget);
        await t.get(MyAppMark.button).tap();
        await t.get(find.textContaining('Count: 1')).should(findsOneWidget);
      });
    });
  });
}

class MyTestToolSlot extends TestToolSlot {
  @override
  Future<void> startApp(TestTool t) async {
    app.main();
  }

  @override
  BuildContext? getNavContext(TestTool t) => MyApp.navigatorKey.currentContext;

  @override
  String get managerHost => '192.168.0.107'; // TODO
}
