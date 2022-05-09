import 'dart:async';

import 'package:convenient_test_common_dart/convenient_test_common_dart.dart';
import 'package:convenient_test_manager_dart/misc/config.dart';
import 'package:convenient_test_manager_dart/misc/setup.dart';
import 'package:convenient_test_manager_dart/services/misc_dart_service.dart';
import 'package:convenient_test_manager_dart/services/status_periodic_logger.dart';
import 'package:convenient_test_manager_dart/services/vm_service_wrapper_service.dart';
import 'package:get_it/get_it.dart';

const _kTag = 'main';

Future<void> main(List<String> args) async {
  Log.i(_kTag, 'main start');

  // need to set *before* [setup] is called, since that is used there as well
  GlobalConfig.ciMode = true;

  setup();

  Log.i(_kTag, 'step awaitWorkerAvailable');
  await _awaitWorkerAvailable();

  Log.i(_kTag, 'step hotRestartAndRunTests');
  unawaited(GetIt.I.get<MiscDartService>().hotRestartAndRunTests(filterNameRegex: RegexUtils.kMatchEverything));

  StatusPeriodicLogger.run();
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
