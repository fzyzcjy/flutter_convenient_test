import 'dart:io';

import 'package:convenient_test_common_dart/convenient_test_common_dart.dart';
import 'package:convenient_test_manager/main.dart';
import 'package:convenient_test_manager/misc/setup.dart';
import 'package:convenient_test_manager/services/misc_flutter_service.dart';
import 'package:convenient_test_manager_dart/services/vm_service_wrapper_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'fake_vm_service_wrapper.dart';

Future<void> setupForTesting() async {
  await setup(
      registerVmServiceWrapper: false,
      initVLC: false,
      parseConfigFile: false,
      setWinSize: false);

  getIt.registerSingleton<VmServiceWrapperService>(FakeVmServiceWrapper());
  Log.d('myAppGoldenTest', 'setup finished');
}

void main() async {
  await setupForTesting();
  // color scheme breaks goldens, so we need two variants
  await myAppGoldenTest(ThemeMode.light);
  await myAppGoldenTest(ThemeMode.dark);
}

Future<void> myAppGoldenTest(ThemeMode theme) async {
  testWidgets('UI Golden theme=$theme', (tester) async {
    await tester.binding.setSurfaceSize(const Size(1920, 1080));

    // you can generate this report
    // by running the app in packages/convenient_test/example
    // and using the save report functionality of the manager.
    final report = File('./test/report.bin').path;
    final miscFlutterService = getIt.get<MiscFlutterService>();

    await miscFlutterService.pickFileAndReadReport(
        pathOverride: report, readSync: true, clear: false);

    Log.d('myAppGoldenTest', 'before pump widget');
    await tester.pumpWidget(MyApp(themeMode: theme));
    Log.d('myAppGoldenTest', 'pumped widget');
    await expectLater(find.byType(MyApp),
        matchesGoldenFile('manager-golden-${theme.name}.png'));
  });
}
