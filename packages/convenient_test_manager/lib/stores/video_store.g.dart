// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$VideoStore on _VideoStore, Store {
  late final _$recordingVideoInfoAtom =
      Atom(name: '_VideoStore.recordingVideoInfo', context: context);

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

  late final _$displayVideoInfoAtom =
      Atom(name: '_VideoStore.displayVideoInfo', context: context);

  @override
  VideoInfo? get displayVideoInfo {
    _$displayVideoInfoAtom.reportRead();
    return super.displayVideoInfo;
  }

  @override
  set displayVideoInfo(VideoInfo? value) {
    _$displayVideoInfoAtom.reportWrite(value, super.displayVideoInfo, () {
      super.displayVideoInfo = value;
    });
  }

  late final _$displayRangeAtom =
      Atom(name: '_VideoStore.displayRange', context: context);

  @override
  Tuple2<Duration, Duration> get displayRange {
    _$displayRangeAtom.reportRead();
    return super.displayRange;
  }

  @override
  set displayRange(Tuple2<Duration, Duration> value) {
    _$displayRangeAtom.reportWrite(value, super.displayRange, () {
      super.displayRange = value;
    });
  }

  late final _$playerPositionCorrespondingLogEntryIdAtom = Atom(
      name: '_VideoStore.playerPositionCorrespondingLogEntryId',
      context: context);

  @override
  int? get playerPositionCorrespondingLogEntryId {
    _$playerPositionCorrespondingLogEntryIdAtom.reportRead();
    return super.playerPositionCorrespondingLogEntryId;
  }

  @override
  set playerPositionCorrespondingLogEntryId(int? value) {
    _$playerPositionCorrespondingLogEntryIdAtom
        .reportWrite(value, super.playerPositionCorrespondingLogEntryId, () {
      super.playerPositionCorrespondingLogEntryId = value;
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
recordingVideoInfo: ${recordingVideoInfo},
displayVideoInfo: ${displayVideoInfo},
displayRange: ${displayRange},
playerPositionCorrespondingLogEntryId: ${playerPositionCorrespondingLogEntryId}
    ''';
  }
}
