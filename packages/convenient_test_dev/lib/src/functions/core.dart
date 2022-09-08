import 'dart:async';

import 'package:convenient_test/convenient_test.dart';
import 'package:convenient_test_common/convenient_test_common.dart';
import 'package:convenient_test_dev/src/functions/binding.dart';
import 'package:convenient_test_dev/src/functions/goldens.dart';
import 'package:convenient_test_dev/src/functions/interaction.dart';
import 'package:convenient_test_dev/src/functions/log.dart';
import 'package:convenient_test_dev/src/support/compile_time_config.dart';
import 'package:convenient_test_dev/src/support/executor.dart';
import 'package:convenient_test_dev/src/support/get_it.dart';
import 'package:convenient_test_dev/src/support/manager_rpc_service.dart';
import 'package:convenient_test_dev/src/support/setup.dart';
import 'package:convenient_test_dev/src/support/slot.dart';
import 'package:convenient_test_dev/src/third_party/my_test_compat.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:meta/meta.dart';
import 'package:path/path.dart' as path;

class ConvenientTest {
  final WidgetTester tester;

  ConvenientTest(this.tester);

  static ConvenientTest? get maybeActiveInstance => _activeInstance;

  @internal
  static ConvenientTest get activeInstance => _activeInstance!;
  static ConvenientTest? _activeInstance;

  static set activeInstance(ConvenientTest? value) {
    if (!((value != null) ^ (_activeInstance != null))) {
      throw Exception(
          'Cannot set activeInstance, either overwrite existing instance or removing non-existing instance. '
          'old=$_activeInstance new=$value');
    }
    _activeInstance = value;
  }

  static Future<void> withActiveInstance(WidgetTester tester, Future<void> Function(ConvenientTest) body) async {
    final t = ConvenientTest(tester);
    activeInstance = t;
    try {
      await body(t);
    } finally {
      activeInstance = null;
    }
  }
}

/// Please make this the only method in your "main" method.
Future<void> convenientTestMain(ConvenientTestSlot slot, VoidCallback testBody) async {
  myGetIt.registerSingleton<ConvenientTestSlot>(slot);
  // MUST do it this early, because we really need the rpc client immediately
  myGetIt.registerSingleton<ConvenientTestManagerClient>(ExtConvenientTestManagerClient.create());

  final currentRunConfig = await myGetIt.get<ConvenientTestManagerClient>().getWorkerCurrentRunConfig(Empty());
  switch (currentRunConfig.whichSubType()) {
    case WorkerCurrentRunConfig_SubType.interactiveApp:
      return _runModeInteractiveApp();
    case WorkerCurrentRunConfig_SubType.integrationTest:
      return _runModeIntegrationTest(testBody, currentRunConfig.integrationTest);
    case WorkerCurrentRunConfig_SubType.notSet:
      throw Exception('Unknown WorkerCurrentRunConfig_SubType: $currentRunConfig');
  }
}

Future<void> _runModeInteractiveApp() async {
  await myGetIt.get<ConvenientTestSlot>().appMain(AppMainExecuteMode.interactiveApp);
}

Future<void> _runModeIntegrationTest(
  VoidCallback testBody,
  WorkerCurrentRunConfig_IntegrationTest currentRunConfig,
) async {
  runZonedGuarded(() {
    ConvenientTestWrapperWidget.convenientTestActive = true;
    _configureGoldens(currentRunConfig);

    final declarer = collectIntoDeclarer(
      defaultRetry: currentRunConfig.defaultRetryCount,
      body: () {
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
          print('Please do *not* initialize `WidgetsBinding.instance` outside `convenientTestMain`.');
          rethrow;
        }

        unawaited(myGetIt.get<ConvenientTestManagerClient>().reportSingle(ReportItem(setUpAll: SetUpAll())));

        setup();

        setUpLogTestStartAndEnd();
        testBody();
      },
    );

    myGetIt.get<ConvenientTestExecutor>()
      ..input = ConvenientTestExecutorInput(
        declarer: declarer,
        reportSuiteInfo: currentRunConfig.reportSuiteInfo,
        executionFilter: currentRunConfig.executionFilter,
      )
      ..execute();
  }, (e, s) {
    Log.w('ConvenientTestMain',
        'ConvenientTest captured error (via runZonedGuarded). type(e)=${e.runtimeType} exception=$e stackTrace=$s');
  });
}

void _configureGoldens(WorkerCurrentRunConfig_IntegrationTest currentRunConfig) {
  const _kTag = 'ConfigureGoldens';

  goldenFileComparator = EnhancedLocalFileComparator(
      Uri.file(path.join(CompileTimeConfig.kAppCodeDir, 'integration_test/dummy.dart')),
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

  // need to `await` to ensure it is sent
  await myGetIt.get<ConvenientTestManagerClient>().reportSingle(ReportItem(
        tearDownAll: TearDownAll(
          resolvedExecutionFilter: myGetIt.get<ConvenientTestExecutor>().resolvedExecutionFilter.toProto(),
        ),
      ));

  // TODO
  // if (CompileTimeConfig.kCIMode) {
  //   Log.i(_kTag, 'wait for a few seconds, hoping everything is really finished');
  //   await Future<void>.delayed(const Duration(seconds: 3));
  //
  //   Log.i(_kTag, 'exit the process');
  //   exit(0);
  // }
}

typedef TWidgetTesterCallback = Future<void> Function(ConvenientTest t);

/// Wrapper around [testWidgets].
///
/// If the app's main widget contains a widget that never settles (for example:
/// has animations that repeat infinitely), set [settle] to false.
@isTest
void tTestWidgets(
  // ... forward the arguments ...
  String description,
  TWidgetTesterCallback callback, {
  bool skip = false,
  bool settle = true,
}) {
  testWidgets(
    description,
    (tester) async => await ConvenientTest.withActiveInstance(tester, (t) async {
      final log = t.log('START APP', '');
      await myGetIt.get<ConvenientTestSlot>().appMain(AppMainExecuteMode.integrationTest);
      settle ? await t.pumpAndSettle() : await t.pump();
      await log.snapshot(name: 'after');

      await callback(t);

      // hack, otherwise `hot restart` sometimes makes this variable set strangely, making assertions failed
      // TODO is it ok?
      debugDefaultTargetPlatformOverride = null;
    }),
    skip: skip,
  );
}
