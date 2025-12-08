import 'dart:io';

import 'package:convenient_test_common_dart/convenient_test_common_dart.dart';
import 'package:convenient_test_manager/components/home_page/header/header_panel.dart';
import 'package:convenient_test_manager/main.dart';
import 'package:convenient_test_manager/misc/setup.dart';
import 'package:convenient_test_manager/services/misc_flutter_service.dart';
import 'package:convenient_test_manager/stores/home_page_store.dart';
import 'package:convenient_test_manager_dart/services/vm_service_wrapper_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'fake_vm_service_wrapper.dart';

Future<void> setupForTesting() async {
  await setup(
    registerVmServiceWrapper: false,
    initVLC: false,
    parseConfigFile: false,
  );

  getIt.registerSingleton<VmServiceWrapperService>(FakeVmServiceWrapper());
  Log.d('goldenMain', 'setup finished');
}

void main() async {
  await setupForTesting();
  // color scheme breaks goldens, so we need two variants
  await goldenMain(ThemeMode.light);
  await goldenMain(ThemeMode.dark);
}

Future<void> goldenMain(ThemeMode theme) async {
  for (final size in [
    const Size(2000, 400),
    const Size(1080, 400),
    const Size(720, 400),
  ]) {
    headerBar(theme: theme, size: size);
  }

  report(theme);
}

void headerBar({required ThemeMode theme, required Size size}) =>
    testWidgets('Header Golden ($theme)', (tester) async {
      await tester.binding.setSurfaceSize(size);
      getIt.get<HomePageStore>().displayLoadedReportMode = false;
      await tester.pumpWidget(
        MyApp(
          themeMode: theme,
          builder: (context, _) => const Scaffold(body: HomePageHeaderPanel()),
        ),
      );

      await expectLater(
        find.byType(HomePageHeaderPanel),
        matchesGoldenFile(
          './goldens/header-golden-${size.width}-${theme.name}.png',
        ),
      );
    });

void report(ThemeMode theme) =>
    testWidgets('Report Golden ($theme)', (tester) async {
      await tester.binding.setSurfaceSize(const Size(1920, 1080));

      // you can generate this report
      // by running the app in packages/convenient_test/example
      // and using the save report functionality of the manager.
      final report = File('./test/report.bin').path;
      final miscFlutterService = getIt.get<MiscFlutterService>();

      await miscFlutterService.pickFileAndReadReport(
        pathOverride: report,
        readSync: true,
        clear: false,
      );

      Log.d('goldenMain', 'before pump widget');
      await tester.pumpWidget(MyApp(themeMode: theme));
      Log.d('goldenMain', 'pumped widget');
      await expectLater(
        find.byType(MyApp),
        matchesGoldenFile('./goldens/report-golden-${theme.name}.png'),
      );
    });
