// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'worker_super_run_store.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ITIMState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _ITIMState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return '_ITIMState()';
  }
}

/// @nodoc
class _$ITIMStateCopyWith<$Res> {
  _$ITIMStateCopyWith(_ITIMState _, $Res Function(_ITIMState) __);
}

/// @nodoc

class ITIMStateInitial implements _ITIMState {
  const ITIMStateInitial();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ITIMStateInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return '_ITIMState.initial()';
  }
}

/// @nodoc

class ITIMStateGoOn implements _ITIMState {
  const ITIMStateGoOn({required this.lastExecutedTestName});

  final String lastExecutedTestName;

  /// Create a copy of _ITIMState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ITIMStateGoOnCopyWith<ITIMStateGoOn> get copyWith =>
      _$ITIMStateGoOnCopyWithImpl<ITIMStateGoOn>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ITIMStateGoOn &&
            (identical(other.lastExecutedTestName, lastExecutedTestName) ||
                other.lastExecutedTestName == lastExecutedTestName));
  }

  @override
  int get hashCode => Object.hash(runtimeType, lastExecutedTestName);

  @override
  String toString() {
    return '_ITIMState.goOn(lastExecutedTestName: $lastExecutedTestName)';
  }
}

/// @nodoc
abstract mixin class $ITIMStateGoOnCopyWith<$Res>
    implements _$ITIMStateCopyWith<$Res> {
  factory $ITIMStateGoOnCopyWith(
          ITIMStateGoOn value, $Res Function(ITIMStateGoOn) _then) =
      _$ITIMStateGoOnCopyWithImpl;
  @useResult
  $Res call({String lastExecutedTestName});
}

/// @nodoc
class _$ITIMStateGoOnCopyWithImpl<$Res>
    implements $ITIMStateGoOnCopyWith<$Res> {
  _$ITIMStateGoOnCopyWithImpl(this._self, this._then);

  final ITIMStateGoOn _self;
  final $Res Function(ITIMStateGoOn) _then;

  /// Create a copy of _ITIMState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? lastExecutedTestName = null,
  }) {
    return _then(ITIMStateGoOn(
      lastExecutedTestName: null == lastExecutedTestName
          ? _self.lastExecutedTestName
          : lastExecutedTestName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class ITIMStateRetryLast implements _ITIMState {
  const ITIMStateRetryLast(
      {required this.lastExecutedTestName,
      required this.lastExecutedTestFailCount});

  final String lastExecutedTestName;
  final int lastExecutedTestFailCount;

  /// Create a copy of _ITIMState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ITIMStateRetryLastCopyWith<ITIMStateRetryLast> get copyWith =>
      _$ITIMStateRetryLastCopyWithImpl<ITIMStateRetryLast>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ITIMStateRetryLast &&
            (identical(other.lastExecutedTestName, lastExecutedTestName) ||
                other.lastExecutedTestName == lastExecutedTestName) &&
            (identical(other.lastExecutedTestFailCount,
                    lastExecutedTestFailCount) ||
                other.lastExecutedTestFailCount == lastExecutedTestFailCount));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, lastExecutedTestName, lastExecutedTestFailCount);

  @override
  String toString() {
    return '_ITIMState.retryLast(lastExecutedTestName: $lastExecutedTestName, lastExecutedTestFailCount: $lastExecutedTestFailCount)';
  }
}

/// @nodoc
abstract mixin class $ITIMStateRetryLastCopyWith<$Res>
    implements _$ITIMStateCopyWith<$Res> {
  factory $ITIMStateRetryLastCopyWith(
          ITIMStateRetryLast value, $Res Function(ITIMStateRetryLast) _then) =
      _$ITIMStateRetryLastCopyWithImpl;
  @useResult
  $Res call({String lastExecutedTestName, int lastExecutedTestFailCount});
}

/// @nodoc
class _$ITIMStateRetryLastCopyWithImpl<$Res>
    implements $ITIMStateRetryLastCopyWith<$Res> {
  _$ITIMStateRetryLastCopyWithImpl(this._self, this._then);

  final ITIMStateRetryLast _self;
  final $Res Function(ITIMStateRetryLast) _then;

  /// Create a copy of _ITIMState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? lastExecutedTestName = null,
    Object? lastExecutedTestFailCount = null,
  }) {
    return _then(ITIMStateRetryLast(
      lastExecutedTestName: null == lastExecutedTestName
          ? _self.lastExecutedTestName
          : lastExecutedTestName // ignore: cast_nullable_to_non_nullable
              as String,
      lastExecutedTestFailCount: null == lastExecutedTestFailCount
          ? _self.lastExecutedTestFailCount
          : lastExecutedTestFailCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class ITIMStateFinished implements _ITIMState {
  const ITIMStateFinished();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ITIMStateFinished);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return '_ITIMState.finished()';
  }
}

// dart format on
