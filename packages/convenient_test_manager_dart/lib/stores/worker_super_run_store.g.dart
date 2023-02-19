// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'worker_super_run_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$WorkerSuperRunStore on _WorkerSuperRunStore, Store {
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
flakyTestTotalAttemptCount: ${flakyTestTotalAttemptCount},
autoUpdateGoldenFiles: ${autoUpdateGoldenFiles},
currSuperRunController: ${currSuperRunController}
    ''';
  }
}

mixin _$_WorkerSuperRunControllerIntegrationTestClassicalMode
    on __WorkerSuperRunControllerIntegrationTestClassicalMode, Store {
  late final _$seenTearDownAllAtom = Atom(
      name:
          '__WorkerSuperRunControllerIntegrationTestClassicalMode.seenTearDownAll',
      context: context);

  @override
  bool get seenTearDownAll {
    _$seenTearDownAllAtom.reportRead();
    return super.seenTearDownAll;
  }

  @override
  set seenTearDownAll(bool value) {
    _$seenTearDownAllAtom.reportWrite(value, super.seenTearDownAll, () {
      super.seenTearDownAll = value;
    });
  }

  @override
  String toString() {
    return '''
seenTearDownAll: ${seenTearDownAll}
    ''';
  }
}

mixin _$_WorkerSuperRunControllerIntegrationTestIsolationMode
    on __WorkerSuperRunControllerIntegrationTestIsolationMode, Store {
  late final _$stateAtom = Atom(
      name: '__WorkerSuperRunControllerIntegrationTestIsolationMode.state',
      context: context);

  @override
  _ITIMState get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(_ITIMState value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  @override
  String toString() {
    return '''
state: ${state}
    ''';
  }
}
