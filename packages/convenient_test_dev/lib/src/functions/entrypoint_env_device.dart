import 'dart:async';

import 'package:convenient_test_common/convenient_test_common.dart';
import 'package:convenient_test_dev/src/functions/binding.dart';
import 'package:convenient_test_dev/src/functions/goldens.dart';
import 'package:convenient_test_dev/src/support/executor.dart';
import 'package:convenient_test_dev/src/support/get_it.dart';
import 'package:convenient_test_dev/src/support/manager_rpc_service.dart';
import 'package:convenient_test_dev/src/support/reporter_service.dart';
import 'package:convenient_test_dev/src/support/setup.dart';
import 'package:convenient_test_dev/src/support/slot.dart';
import 'package:convenient_test_dev/src/support/spy_declarer.dart';
import 'package:convenient_test_dev/src/support/static_config.dart';
import 'package:convenient_test_dev/src/third_party/my_test_compat.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:meta/meta.dart';
import 'package:path/path.dart' as path;

@internal
Future<void> convenientTestEntrypointWhenEnvDevice(
    FutureOr<void> Function() testBody) async {
  myGetIt.registerSingleton<ConvenientTestManagerRpcService>(
      ConvenientTestManagerRpcService());
  myGetIt.registerSingleton<WorkerReportSaverService>(
      WorkerReportSaverServiceSendToManager());

  final currentRunConfig = await myGetIt
      .get<ConvenientTestManagerRpcService>()
      .getWorkerCurrentRunConfig();
  switch (currentRunConfig.whichSubType()) {
    case WorkerCurrentRunConfig_SubType.interactiveApp:
      return _runModeInteractiveApp();
    case WorkerCurrentRunConfig_SubType.integrationTest:
      return _runModeIntegrationTest(
          testBody, currentRunConfig.integrationTest);
    case WorkerCurrentRunConfig_SubType.notSet:
      throw Exception(
          'Unknown WorkerCurrentRunConfig_SubType: $currentRunConfig');
  }
}

Future<void> _runModeInteractiveApp() async {
  await myGetIt
      .get<ConvenientTestSlot>()
      .appMain(AppMainExecuteMode.interactiveApp);
}

Future<void> _runModeIntegrationTest(
  FutureOr<void> Function() testBody,
  WorkerCurrentRunConfig_IntegrationTest currentRunConfig,
) async {
  runZonedGuarded(() {
    _configureGoldens(currentRunConfig);

    late final SpyDeclarerGroup spyDeclarerGroup;
    final declarer = collectIntoDeclarer(
      defaultRetry: currentRunConfig.defaultRetryCount,
      body: () {
        spyDeclarerGroup = SpyDeclarer.withSpy(() {
          // put this tearDownAll *before* everything else (including
          // `IntegrationTestWidgetsFlutterBinding.ensureInitialized` which adds another tearDownAll)
          // thus it should be run lastly
          tearDownAll(_lastTearDownAll);

          try {
            // use *constructor* instead of `ensureInitialized`, such that if it is already initialized it will throw
            // (TODO add tests)
            MyIntegrationTestWidgetsFlutterBinding(); // initialize it
          } catch (e) {
            // This is because:
            // (1) Must call [runZonedGuarded] *outside* [ensureInitialized], otherwise no errors will be captured.
            //     See https://docs.flutter.dev/testing/errors#errors-not-caught-by-flutter for details.
            // (2) [IntegrationTestWidgetsFlutterBinding] must be called *inside* `collectIntoDeclarer`,
            //     because it calls some logic inside it.
            // ignore: avoid_print
            print(
                'Please do *not* initialize `WidgetsBinding.instance` outside `convenientTestMain`.');
            rethrow;
          }

          unawaited(WorkerReportSaverService.I
              ?.report(ReportItem(setUpAll: SetUpAll())));

          setup();

          // https://github.com/fzyzcjy/yplusplus/issues/8554#issuecomment-1530977507
          // setUpLogTestStartAndEnd();

          testBody();
        }).item2;
      },
    );

    if (currentRunConfig.reportSuiteInfo) {
      WorkerReportSaverService.I?.reportSuiteInfo(spyDeclarerGroup);
    }

    myGetIt.get<ConvenientTestExecutor>()
      ..input = ConvenientTestExecutorInput(
        declarer: declarer,
        executionFilter: currentRunConfig.executionFilter,
      )
      ..execute();
  }, (e, s) {
    Log.w('ConvenientTestMain',
        'ConvenientTest captured error (via runZonedGuarded). type(e)=${e.runtimeType} exception=$e stackTrace=$s');
  });
}

void _configureGoldens(
    WorkerCurrentRunConfig_IntegrationTest currentRunConfig) {
  const _kTag = 'ConfigureGoldens';

  goldenFileComparator = EnhancedLocalFileComparator(
      Uri.file(
          path.join(StaticConfig.kAppCodeDir, 'integration_test/dummy.dart')),
      captureFailure: true);
  autoUpdateGoldenFiles = currentRunConfig.autoUpdateGoldenFiles;

  Log.d(
      _kTag,
      'configure '
      'autoUpdateGoldenFiles=$autoUpdateGoldenFiles '
      'comparator.basedir=${(goldenFileComparator as LocalFileComparator).basedir}');
}

Future<void> _lastTearDownAll() async {
  // const _kTag = 'LastTearDownAll';

  final reporterService = WorkerReportSaverService.I;
  if (reporterService != null) {
    // need to `await` to ensure it is sent
    await reporterService.report(ReportItem(
      tearDownAll: TearDownAll(
        resolvedExecutionFilter: myGetIt
            .get<ConvenientTestExecutor>()
            .resolvedExecutionFilter
            .toProto(),
      ),
    ));
  }

  // TODO
  // if (CompileTimeConfig.kCIMode) {
  //   Log.i(_kTag, 'wait for a few seconds, hoping everything is really finished');
  //   await Future<void>.delayed(const Duration(seconds: 3));
  //
  //   Log.i(_kTag, 'exit the process');
  //   exit(0);
  // }
}
