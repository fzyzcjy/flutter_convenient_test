import 'package:convenient_test_dev/convenient_test_dev.dart';
import 'package:convenient_test_example/home_page.dart';
import 'package:convenient_test_example/main.dart' as app;
import 'package:convenient_test_example/main.dart';
import 'package:convenient_test_example/zoom_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  convenientTestMain(MyConvenientTestSlot(), () {
    group('simple test group', () {
      tTestWidgets('choose some fruits', (t) async {
        await t.get(HomePageMark.fetchFruits).tap();
        await find.text('HomePage').should(findsOneWidget);
        await find.text('You chose nothing').should(findsOneWidget);

        await find.text('Cherry').tap();
        await find.text('You chose: Cherry').should(findsOneWidget);

        await t.tester.scrollUntilVisible(find.text('Orange'), 100);
        await find.text('Orange').tap();
        await find.text('You chose: Cherry, Orange').should(findsOneWidget);

        await t.get(HomePageMark.fab).tap();
        await find.text('HomePage').should(findsNothing);
        await find.text('SecondPage').should(findsOneWidget);
        await find.text('See fruits: Cherry, Orange').should(findsOneWidget);

        await t.pageBack();
        await find.text('HomePage').should(findsOneWidget);
      });

      tTestWidgets('deliberately failing test', (t) async {
        expect(1, 0, reason: 'this expect should deliberately fail');
      });

      tTestWidgets('deliberately flaky test', (t) async {
        final shouldFailThisTime = !_deliberatelyFlakyTestHasRun;
        _deliberatelyFlakyTestHasRun = true;

        await t.get(HomePageMark.fetchFruits).tap();

        if (shouldFailThisTime) {
          await find.text('NotExistString').should(findsOneWidget);
        } else {
          await find.text('Apple').should(findsOneWidget);
        }
      });

      tTestWidgets('navigation', (t) async {
        await t.visit('/second');
        await find.text('HomePage').should(findsNothing);
        await find.text('SecondPage').should(findsOneWidget);

        // you can also assert route names
        await t.routeName().shouldEquals('/second');

        await t.pageBack();
        await find.text('HomePage').should(findsOneWidget);
        await find.text('SecondPage').should(findsNothing);
      });

      tTestWidgets('golden test', (t) async {
        await find.text('HomePage').should(findsOneWidget);

        await find.byType(MaterialApp).should(matchesGoldenFile('goldens/sample_golden.png'));
      });

      tTestWidgets('custom logging and snapshotting', (t) async {
        // suppose you do something normal...
        await find.text('HomePage').should(findsOneWidget);

        // then you want to log and snapshot
        final log = t.log('HELLO', 'Just a demonstration of custom logging');
        await log.snapshot();
      });

      tTestWidgets('custom commands', (t) async {
        await t.myCustomCommand();
      });

      tTestWidgets('sections', (t) async {
        t.section('sample section one');

        // do something
        await t.get(HomePageMark.fetchFruits).tap();
        await find.text('Apple').tap();
        await find.text('Banana').tap();
        await find.text('Cherry').tap();

        t.section('sample section two');

        // do something
        await find.text('Apple').tap();
        await find.text('Banana').tap();
        await find.text('Cherry').tap();
        await find.text('HomePage').should(findsOneWidget);
      });

      tTestWidgets('timer page', (t) async {
        await t.visit('/timer');

        for (var iter = 0; iter < 5; ++iter) {
          final log = t.log('HELLO', 'Wait a second to have a look (#$iter)');
          await log.snapshot(name: 'before');

          final stopwatch = Stopwatch()..start();
          while (stopwatch.elapsed < const Duration(seconds: 1)) {
            await t.tester.pump();
          }

          await log.snapshot(name: 'after');
        }

        await t.pageBack();
      });

      tTestWidgets('enter and append text', (t) async {
        void _logTestTextInput() {
          final testTextInput = t.tester.testTextInput;
          t.log(
            'HELLO',
            // ignore: invalid_use_of_protected_member
            'TestWidgetsFlutterBinding.registerTestTextInput=${(TestWidgetsFlutterBinding.ensureInitialized() as TestWidgetsFlutterBinding).registerTestTextInput} '
                'testTextInput {'
                'setClientArgs: ${testTextInput.setClientArgs}, '
                'editingState: ${testTextInput.editingState}, '
                'isRegistered: ${testTextInput.isRegistered}, '
                // 'hasAnyClients: ${testTextInput.hasAnyClients}, '
                '}',
          );
        }

        await t.visit('/text_field');

        _logTestTextInput();

        await find.byType(TextField).enterText('first');
        await find.text('first').should(findsOneWidget);
        _logTestTextInput();

        t.tester.widget<TextField>(find.byType(TextField)).focusNode!.requestFocus();
        await t.pumpAndSettle();

        // "Returns true if the key down event was handled by the framework." so assert the result
        expect(await t.tester.sendKeyEvent(LogicalKeyboardKey.keyA), true);
        expect(await t.tester.sendKeyEvent(LogicalKeyboardKey.keyB), true);
        expect(await t.tester.sendKeyEvent(LogicalKeyboardKey.keyC), true);
        await find.text('firstabc').should(findsOneWidget);
        // await find.byType(TextField).enterText('first second');
        // await find.text('first second').should(findsOneWidget);
        _logTestTextInput();
      });

      group('zoom page', () {
        tTestWidgets('single finger drag', (t) async {
          await t.visit('/zoom');
          await t.pumpAndSettle();

          await find.get(ZoomPageMark.palette).should(matchesGoldenFile('goldens/zoom_page_drag_before.png'));

          await find.get(ZoomPageMark.palette).drag(const Offset(0, -50));

          await find.get(ZoomPageMark.palette).should(matchesGoldenFile('goldens/zoom_page_drag_after.png'));

          // alternative approach
          // await t.tester.drag(find.get(ZoomPageMark.palette), const Offset(0, -50));

          // sample logging
          // await t.tester.pumpAndSettle();
          // await t.log('HELLO', 'look at it').snapshot();
        });

        tTestWidgets('double finger zooming', (t) async {
          await t.visit('/zoom');

          await find.get(ZoomPageMark.palette).should(matchesGoldenFile('goldens/zoom_page_zoom_before.png'));

          await find.get(ZoomPageMark.palette).multiDrag(
                firstDownOffset: const Offset(0, -30),
                secondDownOffset: const Offset(0, 30),
                firstFingerOffsets: const [Offset(0, -20), Offset(0, -20), Offset(0, -10)],
                secondFingerOffsets: const [Offset(0, 20), Offset(0, 20), Offset(0, 10)],
                logMove: true,
              );

          await find.get(ZoomPageMark.palette).should(matchesGoldenFile('goldens/zoom_page_zoom_after.png'));
        });
      });
    });

    group('some other test group', () {
      tTestWidgets('empty test', (t) async {});

      group('sample sub-group', () {
        tTestWidgets('another empty test', (t) async {});

        group('sample sub-sub-group', () {
          tTestWidgets('yet another empty test', (t) async {});
        });
      });
    });
  });
}

var _deliberatelyFlakyTestHasRun = false;

class MyConvenientTestSlot extends ConvenientTestSlot {
  @override
  Future<void> appMain(AppMainExecuteMode mode) async => app.main();

  @override
  BuildContext? getNavContext(ConvenientTest t) => MyApp.navigatorKey.currentContext;
}

extension on ConvenientTest {
  Future<void> myCustomCommand() async {
    // Do anything you like... This is just a normal function
    debugPrint('Hello, world!');
  }
}
