// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'worker_super_run_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$WorkerSuperRunStore on _WorkerSuperRunStore, Store {
  late final _$isolationModeAtom =
      Atom(name: '_WorkerSuperRunStore.isolationMode', context: context);

  @override
  bool get isolationMode {
    _$isolationModeAtom.reportRead();
    return super.isolationMode;
  }

  @override
  set isolationMode(bool value) {
    _$isolationModeAtom.reportWrite(value, super.isolationMode, () {
      super.isolationMode = value;
    });
  }

  late final _$flakyTestTotalAttemptCountAtom = Atom(
      name: '_WorkerSuperRunStore.flakyTestTotalAttemptCount',
      context: context);

  @override
  int get flakyTestTotalAttemptCount {
    _$flakyTestTotalAttemptCountAtom.reportRead();
    return super.flakyTestTotalAttemptCount;
  }

  @override
  set flakyTestTotalAttemptCount(int value) {
    _$flakyTestTotalAttemptCountAtom
        .reportWrite(value, super.flakyTestTotalAttemptCount, () {
      super.flakyTestTotalAttemptCount = value;
    });
  }

  late final _$autoUpdateGoldenFilesAtom = Atom(
      name: '_WorkerSuperRunStore.autoUpdateGoldenFiles', context: context);

  @override
  bool get autoUpdateGoldenFiles {
    _$autoUpdateGoldenFilesAtom.reportRead();
    return super.autoUpdateGoldenFiles;
  }

  @override
  set autoUpdateGoldenFiles(bool value) {
    _$autoUpdateGoldenFilesAtom.reportWrite(value, super.autoUpdateGoldenFiles,
        () {
      super.autoUpdateGoldenFiles = value;
    });
  }

  late final _$currSuperRunControllerAtom = Atom(
      name: '_WorkerSuperRunStore.currSuperRunController', context: context);

  @override
  WorkerSuperRunController get currSuperRunController {
    _$currSuperRunControllerAtom.reportRead();
    return super.currSuperRunController;
  }

  @override
  set currSuperRunController(WorkerSuperRunController value) {
    _$currSuperRunControllerAtom
        .reportWrite(value, super.currSuperRunController, () {
      super.currSuperRunController = value;
    });
  }

  @override
  String toString() {
    return '''
isolationMode: ${isolationMode},
flakyTestTotalAttemptCount: ${flakyTestTotalAttemptCount},
autoUpdateGoldenFiles: ${autoUpdateGoldenFiles},
currSuperRunController: ${currSuperRunController}
    ''';
  }
}
