// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_recorder_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$VideoRecorderStore on _VideoRecorderStore, Store {
  late final _$recordingVideoInfoAtom =
      Atom(name: '_VideoRecorderStore.recordingVideoInfo', context: context);

  @override
  VideoInfo? get recordingVideoInfo {
    _$recordingVideoInfoAtom.reportRead();
    return super.recordingVideoInfo;
  }

  @override
  set recordingVideoInfo(VideoInfo? value) {
    _$recordingVideoInfoAtom.reportWrite(value, super.recordingVideoInfo, () {
      super.recordingVideoInfo = value;
    });
  }

  late final _$startRecordAsyncAction =
      AsyncAction('_VideoRecorderStore.startRecord', context: context);

  @override
  Future<void> startRecord() {
    return _$startRecordAsyncAction.run(() => super.startRecord());
  }

  late final _$stopRecordAsyncAction =
      AsyncAction('_VideoRecorderStore.stopRecord', context: context);

  @override
  Future<void> stopRecord() {
    return _$stopRecordAsyncAction.run(() => super.stopRecord());
  }

  @override
  String toString() {
    return '''
recordingVideoInfo: ${recordingVideoInfo}
    ''';
  }
}
