import 'package:convenient_test_common_dart/convenient_test_common_dart.dart';
import 'package:convenient_test_manager/main.dart';
import 'package:convenient_test_manager/misc/setup.dart';
import 'package:convenient_test_manager_dart/services/convenient_test_manager_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

var isSetup = false;
void main() {
  // color scheme breaks goldens, so we need two variants
  group('UI GOLDENS', () {
    myAppGoldenTest(ThemeMode.light);
    myAppGoldenTest(ThemeMode.dark);
  });
}

Future<void> myAppGoldenTest(ThemeMode theme) async {
  testWidgets('UI golden in theme=$theme', (tester) async {
    if (!isSetup) {
      await setup();
      isSetup = true;
    }

    await ConvenientTestManagerService().reportInner(ReportCollection(
      items: [
        ReportItem(
          logEntry: LogEntry(testName: 'Test test'),
        )
      ],
    ));

    await tester.pumpWidget(MyApp(theme: theme));
    await expectLater(find.byType(MyApp),
        matchesGoldenFile('manager-golden-${theme.name}.png'));
  });
}
