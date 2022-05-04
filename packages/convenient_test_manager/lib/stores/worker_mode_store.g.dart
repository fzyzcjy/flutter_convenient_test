// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'worker_mode_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$WorkerModeStore on _WorkerModeStore, Store {
  late final _$activeWorkerModeAtom =
      Atom(name: '_WorkerModeStore.activeWorkerMode', context: context);

  @override
  WorkerMode get activeWorkerMode {
    _$activeWorkerModeAtom.reportRead();
    return super.activeWorkerMode;
  }

  @override
  set activeWorkerMode(WorkerMode value) {
    _$activeWorkerModeAtom.reportWrite(value, super.activeWorkerMode, () {
      super.activeWorkerMode = value;
    });
  }

  @override
  String toString() {
    return '''
activeWorkerMode: ${activeWorkerMode}
    ''';
  }
}
