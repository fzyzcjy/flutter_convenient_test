import 'package:convenient_test_dev/src/support/element_hit_testable_matcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
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
            IconButton(onPressed: () {}, icon: const Icon(Icons.star)),
            const Positioned.fill(child: Placeholder()),
          ],
        ),
      ),
    ));
    expect(
      () => expect(find.byIcon(Icons.star), ElementHitTestableMatcher(tester)),
      throwsA(isA<TestFailure>()),
    );
  });
}
