import 'package:convenient_test_common_dart/convenient_test_common_dart.dart';
import 'package:convenient_test_manager/main.dart';
import 'package:convenient_test_manager/misc/setup.dart';
import 'package:convenient_test_manager_dart/services/convenient_test_manager_service.dart';
import 'package:convenient_test_manager_dart/services/vm_service_wrapper_service.dart';
import 'package:convenient_test_manager_dart/stores/suite_info_store.dart';
import 'package:fixnum/fixnum.dart';
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
      await setup(registerVmServiceWrapper: false);
      getIt.registerSingleton<VmServiceWrapperService>(FakeVmServiceWrapper());
      isSetup = true;
      getIt.get<SuiteInfoStore>().suiteInfo = SuiteInfo.fromProto(
          SuiteInfoProto(tests: [
        TestInfoProto(name: 'this is an example test', id: Int64())
      ]));

      Log.d('myAppGoldenTest', 'setup finished');
    }

    await tester.pumpWidget(MyApp(theme: theme));

    final mService = getIt.get<ConvenientTestManagerService>();
     await mService.reportInner(ReportCollection(
       items: [
         ReportItem(
          runnerMessage: RunnerMessage(message: 'the test passed') 
         )
       ],
     ));

    await expectLater(find.byType(MyApp),
        matchesGoldenFile('manager-golden-${theme.name}.png'));
  });
}
