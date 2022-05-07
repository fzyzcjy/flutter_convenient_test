// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'worker_task_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$WorkerTaskStore on _WorkerTaskStore, Store {
  late final _$runModeAtom =
      Atom(name: '_WorkerTaskStore.runMode', context: context);

  @override
  WorkerRunMode get runMode {
    _$runModeAtom.reportRead();
    return super.runMode;
  }

  @override
  set runMode(WorkerRunMode value) {
    _$runModeAtom.reportWrite(value, super.runMode, () {
      super.runMode = value;
    });
  }

  late final _$filterNameRegexAtom =
      Atom(name: '_WorkerTaskStore.filterNameRegex', context: context);

  @override
  String get filterNameRegex {
    _$filterNameRegexAtom.reportRead();
    return super.filterNameRegex;
  }

  @override
  set filterNameRegex(String value) {
    _$filterNameRegexAtom.reportWrite(value, super.filterNameRegex, () {
      super.filterNameRegex = value;
    });
  }

  @override
  String toString() {
    return '''
runMode: ${runMode},
filterNameRegex: ${filterNameRegex}
    ''';
  }
}
