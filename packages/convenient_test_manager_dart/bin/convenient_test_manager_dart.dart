import 'dart:async';
import 'dart:io';

import 'package:convenient_test_common_dart/convenient_test_common_dart.dart';
import 'package:convenient_test_manager_dart/misc/setup.dart';
import 'package:convenient_test_manager_dart/services/misc_dart_service.dart';
import 'package:convenient_test_manager_dart/services/status_periodic_logger.dart';
import 'package:convenient_test_manager_dart/services/vm_service_wrapper_service.dart';
import 'package:convenient_test_manager_dart/stores/global_config_store.dart';
import 'package:convenient_test_manager_dart/stores/suite_info_store.dart';
import 'package:convenient_test_manager_dart/stores/worker_super_run_store.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

const _kTag = 'main';

const kExitCodeFinishExecutionButHasFailure = 1;
const kExitCodeWorkerDisappeared = 2;

Future<void> main(List<String> args) async {
  Log.i(_kTag, 'main start');

  await setup(headlessMode: true, args: args);

  Log.i(_kTag, 'step awaitWorkerAvailable');
  await _awaitWorkerAvailable();

  unawaited(_monitorWorkerAvailable());

  // to avoid #4575
  Log.i(_kTag, 'step extra sleep to avoid too quickly hot-restart worker');
  await Future<void>.delayed(const Duration(seconds: 6));

  Log.i(_kTag, 'step reloadInfo');
  GetIt.I.get<MiscDartService>().reloadInfo();
  await _awaitSuiteInfoNonEmpty();

  Log.i(_kTag, 'step hotRestartAndRunTests');
  final regExp = GlobalConfigStore.config.runOnly != null
      ? RegexUtils.matchPrefix(GlobalConfigStore.config.runOnly!)
      : RegexUtils.kMatchEverything;
  GetIt.I.get<MiscDartService>().hotRestartAndRunTests(filterNameRegex: regExp);

  StatusPeriodicLogger.run();

  Log.i(_kTag, 'step awaitSuperRunStatusTestAllDone');
  await _awaitSuperRunStatusTestAllDone();

  Log.i(_kTag, 'step exit');
  exit(_calcExitCode());
}

Future<void> _awaitWorkerAvailable() async {
  final vmServiceWrapperService = GetIt.I.get<VmServiceWrapperService>();

  Log.i(_kTag, 'waitWorkerAvailable start');

  while (true) {
    Log.i(_kTag, 'waitWorkerAvailable check');
    if (vmServiceWrapperService.hotRestartAvailable) {
      return;
    }

    // for example, manager has started + worker has not started. Then the initial `connect` will immediately fail.
    // without this re-connect, it will forever non-connected
    if (!vmServiceWrapperService.connected) {
      await vmServiceWrapperService.connect();
    }

    await Future<void>.delayed(const Duration(seconds: 3));
  }
}

Future<void> _monitorWorkerAvailable() async {
  final vmServiceWrapperService = GetIt.I.get<VmServiceWrapperService>();

  while (true) {
    Log.i(_kTag, 'monitorWorkerAvailable check');
    if (!vmServiceWrapperService.hotRestartAvailable) {
      Log.e(
          _kTag,
          'monitorWorkerAvailable see hot restart not available, thus exit with code=$kExitCodeWorkerDisappeared '
          '(vmServiceWrapperService.hotRestartAvailable=${vmServiceWrapperService.hotRestartAvailable}, '
          'vmServiceWrapperService.connected=${vmServiceWrapperService.connected})');
      exit(kExitCodeWorkerDisappeared);
    }

    await Future<void>.delayed(const Duration(seconds: 5));
  }
}

Future<void> _awaitSuiteInfoNonEmpty() async {
  final suiteInfoStore = GetIt.I.get<SuiteInfoStore>();

  while (true) {
    final suiteInfo = suiteInfoStore.suiteInfo;
    final numGroupEntries = suiteInfo?.entryMap.length ?? 0;
    Log.i(
        _kTag, 'awaitSuiteInfoNonEmpty check numGroupEntries=$numGroupEntries');

    if (numGroupEntries > 0) return;

    await Future<void>.delayed(const Duration(seconds: 3));
  }
}

Future<void> _awaitSuperRunStatusTestAllDone() async {
  final workerSuperRunStore = GetIt.I.get<WorkerSuperRunStore>();

  if (workerSuperRunStore.currSuperRunController.superRunStatus ==
      WorkerSuperRunStatus.testAllDone) {
    throw AssertionError;
  }

  await asyncWhen((_) =>
      workerSuperRunStore.currSuperRunController.superRunStatus ==
      WorkerSuperRunStatus.testAllDone);
}

int _calcExitCode() {
  final suiteInfoStore = GetIt.I.get<SuiteInfoStore>();

  final stateCountMap =
      suiteInfoStore.calcStateCountMap(suiteInfoStore.suiteInfo!.rootGroup);

  if (stateCountMap[SimplifiedStateEnum.pending] > 0) throw AssertionError;

  if (stateCountMap[SimplifiedStateEnum.completeSuccessButFlaky] > 0) {
    Log.w(_kTag, 'See flaky tests.');
  }

  final hasFailure =
      stateCountMap[SimplifiedStateEnum.completeFailureOrError] > 0;
  if (hasFailure) {
    Log.w(_kTag, 'See failed tests.');
  }

  final ans = hasFailure ? kExitCodeFinishExecutionButHasFailure : 0;
  Log.d(_kTag, 'calcExitCode=$ans');
  return ans;
}
