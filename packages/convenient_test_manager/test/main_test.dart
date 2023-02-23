import 'dart:io';

import 'package:convenient_test_common_dart/convenient_test_common_dart.dart';
import 'package:convenient_test_manager/main.dart';
import 'package:convenient_test_manager/misc/setup.dart';
import 'package:convenient_test_manager/services/misc_flutter_service.dart';
import 'package:convenient_test_manager_dart/services/vm_service_wrapper_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'fake_vm_service_wrapper.dart';

var isSetup = false;
void main() {
  // color scheme breaks goldens, so we need two variants
  myAppGoldenTest(ThemeMode.light);
  myAppGoldenTest(ThemeMode.dark);
}

Future<void> myAppGoldenTest(ThemeMode theme) async {
  testWidgets('UI Golden theme=$theme', (tester) async {
    await tester.binding.setSurfaceSize(const Size(1920, 1080));

    if (!isSetup) {
      await setup(registerVmServiceWrapper: false, initVLC: false, parseConfigFile: false, setWinSize: false);

      getIt.registerSingleton<VmServiceWrapperService>(FakeVmServiceWrapper());
      isSetup = true;
      Log.d('myAppGoldenTest', 'setup finished');
    }

    final report = File('./test/report.bin').path;
    final mFS = getIt.get<MiscFlutterService>();

    await mFS.pickFileAndReadReport(pathOverride: report, readSync: true, clear: false);

    // mFS.reloadInfo();

    Log.d('myAppGoldenTest', 'before pump widget');
    await tester.pumpWidget(MyApp(theme: theme));
    Log.d('myAppGoldenTest', 'pumped widget');
    await expectLater(find.byType(MyApp), matchesGoldenFile('manager-golden-${theme.name}.png'));
  });
}
