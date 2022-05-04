// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'log_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LogStore on _LogStore, Store {
  Computed<String?>? _$effectiveActiveSnapshotNameComputed;

  @override
  String? get effectiveActiveSnapshotName => (_$effectiveActiveSnapshotNameComputed ??=
          Computed<String?>(() => super.effectiveActiveSnapshotName, name: '_LogStore.effectiveActiveSnapshotName'))
      .value;

  late final _$activeLogEntryIdAtom = Atom(name: '_LogStore.activeLogEntryId', context: context);

  @override
  int? get activeLogEntryId {
    _$activeLogEntryIdAtom.reportRead();
    return super.activeLogEntryId;
  }

  @override
  set activeLogEntryId(int? value) {
    _$activeLogEntryIdAtom.reportWrite(value, super.activeLogEntryId, () {
      super.activeLogEntryId = value;
    });
  }

  late final _$activeSnapshotNameAtom = Atom(name: '_LogStore.activeSnapshotName', context: context);

  @override
  String? get activeSnapshotName {
    _$activeSnapshotNameAtom.reportRead();
    return super.activeSnapshotName;
  }

  @override
  set activeSnapshotName(String? value) {
    _$activeSnapshotNameAtom.reportWrite(value, super.activeSnapshotName, () {
      super.activeSnapshotName = value;
    });
  }

  @override
  String toString() {
    return '''
activeLogEntryId: ${activeLogEntryId},
activeSnapshotName: ${activeSnapshotName},
effectiveActiveSnapshotName: ${effectiveActiveSnapshotName}
    ''';
  }
}
