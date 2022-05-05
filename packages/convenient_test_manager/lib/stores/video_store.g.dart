// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$VideoStore on _VideoStore, Store {
  late final _$recordingVideoPathAtom =
      Atom(name: '_VideoStore.recordingVideoPath', context: context);

  @override
  String? get recordingVideoPath {
    _$recordingVideoPathAtom.reportRead();
    return super.recordingVideoPath;
  }

  @override
  set recordingVideoPath(String? value) {
    _$recordingVideoPathAtom.reportWrite(value, super.recordingVideoPath, () {
      super.recordingVideoPath = value;
    });
  }

  late final _$displayVideoPathAtom =
      Atom(name: '_VideoStore.displayVideoPath', context: context);

  @override
  String? get displayVideoPath {
    _$displayVideoPathAtom.reportRead();
    return super.displayVideoPath;
  }

  @override
  set displayVideoPath(String? value) {
    _$displayVideoPathAtom.reportWrite(value, super.displayVideoPath, () {
      super.displayVideoPath = value;
    });
  }

  late final _$startRecordAsyncAction =
      AsyncAction('_VideoStore.startRecord', context: context);

  @override
  Future<void> startRecord() {
    return _$startRecordAsyncAction.run(() => super.startRecord());
  }

  late final _$stopRecordAsyncAction =
      AsyncAction('_VideoStore.stopRecord', context: context);

  @override
  Future<void> stopRecord() {
    return _$stopRecordAsyncAction.run(() => super.stopRecord());
  }

  @override
  String toString() {
    return '''
recordingVideoPath: ${recordingVideoPath},
displayVideoPath: ${displayVideoPath}
    ''';
  }
}
