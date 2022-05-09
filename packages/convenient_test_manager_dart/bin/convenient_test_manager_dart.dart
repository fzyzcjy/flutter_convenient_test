import 'dart:async';

import 'package:convenient_test_common_dart/convenient_test_common_dart.dart';
import 'package:convenient_test_manager_dart/misc/config.dart';
import 'package:convenient_test_manager_dart/misc/setup.dart';
import 'package:convenient_test_manager_dart/services/misc_dart_service.dart';
import 'package:get_it/get_it.dart';

const _kTag = 'main';

Future<void> main(List<String> args) async {
  Log.i(_kTag, 'main start');

  // need to set *before* [setup] is called, since that is used there as well
  GlobalConfig.ciMode = true;

  setup();

  unawaited(GetIt.I.get<MiscDartService>().hotRestartAndRunTests(filterNameRegex: RegexUtils.kMatchEverything));
}
