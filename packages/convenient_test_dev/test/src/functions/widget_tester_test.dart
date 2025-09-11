import 'package:convenient_test_dev/convenient_test_dev.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('debugWidgetTestSaveScreenshot simple', (tester) async {
    await tester.pumpWidget(Container());
    await debugWidgetTestSaveScreenshot(
      find.byType(Container),
    ); // should not have error
  });

  testWidgets('runAsync when error', (tester) async {
    await tester.runAsync(() async => throw Exception('hello'));
    final Object? exception = tester.binding.safeTakeExceptionOrDetails();
    debugPrint('exception=$exception');
    expect(exception, isNotNull);
  });
}
