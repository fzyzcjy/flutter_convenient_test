// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_player_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$VideoPlayerStore on _VideoPlayerStore, Store {
  late final _$displayVideoInfoAtom = Atom(name: '_VideoPlayerStore.displayVideoInfo', context: context);

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

  late final _$displayRangeAtom = Atom(name: '_VideoPlayerStore.displayRange', context: context);

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

  late final _$playerPositionCorrespondingLogEntryIdAtom =
      Atom(name: '_VideoPlayerStore.playerPositionCorrespondingLogEntryId', context: context);

  @override
  int? get playerPositionCorrespondingLogEntryId {
    _$playerPositionCorrespondingLogEntryIdAtom.reportRead();
    return super.playerPositionCorrespondingLogEntryId;
  }

  @override
  set playerPositionCorrespondingLogEntryId(int? value) {
    _$playerPositionCorrespondingLogEntryIdAtom.reportWrite(value, super.playerPositionCorrespondingLogEntryId, () {
      super.playerPositionCorrespondingLogEntryId = value;
    });
  }

  @override
  String toString() {
    return '''
displayVideoInfo: ${displayVideoInfo},
displayRange: ${displayRange},
playerPositionCorrespondingLogEntryId: ${playerPositionCorrespondingLogEntryId}
    ''';
  }
}
