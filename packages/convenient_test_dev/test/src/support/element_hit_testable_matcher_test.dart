import 'package:convenient_test_dev/src/support/element_hit_testable_matcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  WidgetController.hitTestWarningShouldBeFatal = true;

  testWidgets('when hit testable, should pass matching', (tester) async {
    await tester
        .pumpWidget(MaterialApp(home: Scaffold(body: IconButton(onPressed: () {}, icon: const Icon(Icons.star)))));
    expect(find.byIcon(Icons.star), ElementHitTestableMatcher(tester));
  });

  testWidgets('when not hit testable, should throw', (tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: Stack(
          children: [
            Positioned.fill(child: IconButton(onPressed: () {}, icon: const Icon(Icons.star))),
            Positioned.fill(child: Container(color: Colors.green)),
          ],
        ),
      ),
    ));
    // await debugWidgetTestSaveScreenshot();

    // // should fail to tap, since it is not hit testable
    // await tester.tap(find.byIcon(Icons.star));
    // await tester.pump();

    expect(
      () => expect(find.byIcon(Icons.star), ElementHitTestableMatcher(tester)),
      throwsA(isA<TestFailure>().having((e) => e.toString(), 'toString', contains('is not hit-testable'))),
    );
  });
}
