// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'highlight_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HighlightStore on _HighlightStore, Store {
  Computed<String?>? _$effectiveActiveSnapshotNameComputed;

  @override
  String? get effectiveActiveSnapshotName =>
      (_$effectiveActiveSnapshotNameComputed ??= Computed<String?>(() => super.effectiveActiveSnapshotName,
              name: '_HighlightStore.effectiveActiveSnapshotName'))
          .value;

  late final _$enableAutoExpandAtom = Atom(name: '_HighlightStore.enableAutoExpand', context: context);

  @override
  bool get enableAutoExpand {
    _$enableAutoExpandAtom.reportRead();
    return super.enableAutoExpand;
  }

  @override
  set enableAutoExpand(bool value) {
    _$enableAutoExpandAtom.reportWrite(value, super.enableAutoExpand, () {
      super.enableAutoExpand = value;
    });
  }

  late final _$enableAutoJumpAtom = Atom(name: '_HighlightStore.enableAutoJump', context: context);

  @override
  bool get enableAutoJump {
    _$enableAutoJumpAtom.reportRead();
    return super.enableAutoJump;
  }

  @override
  set enableAutoJump(bool value) {
    _$enableAutoJumpAtom.reportWrite(value, super.enableAutoJump, () {
      super.enableAutoJump = value;
    });
  }

  late final _$enableHoverModeAtom = Atom(name: '_HighlightStore.enableHoverMode', context: context);

  @override
  bool get enableHoverMode {
    _$enableHoverModeAtom.reportRead();
    return super.enableHoverMode;
  }

  @override
  set enableHoverMode(bool value) {
    _$enableHoverModeAtom.reportWrite(value, super.enableHoverMode, () {
      super.enableHoverMode = value;
    });
  }

  late final _$highlightTestEntryIdAtom = Atom(name: '_HighlightStore.highlightTestEntryId', context: context);

  @override
  int? get highlightTestEntryId {
    _$highlightTestEntryIdAtom.reportRead();
    return super.highlightTestEntryId;
  }

  @override
  set highlightTestEntryId(int? value) {
    _$highlightTestEntryIdAtom.reportWrite(value, super.highlightTestEntryId, () {
      super.highlightTestEntryId = value;
    });
  }

  late final _$highlightLogEntryIdAtom = Atom(name: '_HighlightStore.highlightLogEntryId', context: context);

  @override
  int? get highlightLogEntryId {
    _$highlightLogEntryIdAtom.reportRead();
    return super.highlightLogEntryId;
  }

  @override
  set highlightLogEntryId(int? value) {
    _$highlightLogEntryIdAtom.reportWrite(value, super.highlightLogEntryId, () {
      super.highlightLogEntryId = value;
    });
  }

  late final _$highlightSnapshotNameAtom = Atom(name: '_HighlightStore.highlightSnapshotName', context: context);

  @override
  String? get highlightSnapshotName {
    _$highlightSnapshotNameAtom.reportRead();
    return super.highlightSnapshotName;
  }

  @override
  set highlightSnapshotName(String? value) {
    _$highlightSnapshotNameAtom.reportWrite(value, super.highlightSnapshotName, () {
      super.highlightSnapshotName = value;
    });
  }

  late final _$_HighlightStoreActionController = ActionController(name: '_HighlightStore', context: context);

  @override
  void expandSeriesForTest({required int testInfoId}) {
    final _$actionInfo = _$_HighlightStoreActionController.startAction(name: '_HighlightStore.expandSeriesForTest');
    try {
      return super.expandSeriesForTest(testInfoId: testInfoId);
    } finally {
      _$_HighlightStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
enableAutoExpand: ${enableAutoExpand},
enableAutoJump: ${enableAutoJump},
enableHoverMode: ${enableHoverMode},
highlightTestEntryId: ${highlightTestEntryId},
highlightLogEntryId: ${highlightLogEntryId},
highlightSnapshotName: ${highlightSnapshotName},
effectiveActiveSnapshotName: ${effectiveActiveSnapshotName}
    ''';
  }
}
