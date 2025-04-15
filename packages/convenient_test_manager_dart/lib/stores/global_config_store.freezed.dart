// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'global_config_store.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GlobalConfigNullable {
  bool? get isolationMode;
  bool? get enableReportSaver;
  String? get goldenDiffGitRepo;
  String? get runOnly;
  String? get reportSavePath;

  /// Create a copy of GlobalConfigNullable
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GlobalConfigNullableCopyWith<GlobalConfigNullable> get copyWith =>
      _$GlobalConfigNullableCopyWithImpl<GlobalConfigNullable>(
          this as GlobalConfigNullable, _$identity);

  /// Serializes this GlobalConfigNullable to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GlobalConfigNullable &&
            (identical(other.isolationMode, isolationMode) ||
                other.isolationMode == isolationMode) &&
            (identical(other.enableReportSaver, enableReportSaver) ||
                other.enableReportSaver == enableReportSaver) &&
            (identical(other.goldenDiffGitRepo, goldenDiffGitRepo) ||
                other.goldenDiffGitRepo == goldenDiffGitRepo) &&
            (identical(other.runOnly, runOnly) || other.runOnly == runOnly) &&
            (identical(other.reportSavePath, reportSavePath) ||
                other.reportSavePath == reportSavePath));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, isolationMode, enableReportSaver,
      goldenDiffGitRepo, runOnly, reportSavePath);

  @override
  String toString() {
    return 'GlobalConfigNullable(isolationMode: $isolationMode, enableReportSaver: $enableReportSaver, goldenDiffGitRepo: $goldenDiffGitRepo, runOnly: $runOnly, reportSavePath: $reportSavePath)';
  }
}

/// @nodoc
abstract mixin class $GlobalConfigNullableCopyWith<$Res> {
  factory $GlobalConfigNullableCopyWith(GlobalConfigNullable value,
          $Res Function(GlobalConfigNullable) _then) =
      _$GlobalConfigNullableCopyWithImpl;
  @useResult
  $Res call(
      {bool? isolationMode,
      bool? enableReportSaver,
      String? goldenDiffGitRepo,
      String? runOnly,
      String? reportSavePath});
}

/// @nodoc
class _$GlobalConfigNullableCopyWithImpl<$Res>
    implements $GlobalConfigNullableCopyWith<$Res> {
  _$GlobalConfigNullableCopyWithImpl(this._self, this._then);

  final GlobalConfigNullable _self;
  final $Res Function(GlobalConfigNullable) _then;

  /// Create a copy of GlobalConfigNullable
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isolationMode = freezed,
    Object? enableReportSaver = freezed,
    Object? goldenDiffGitRepo = freezed,
    Object? runOnly = freezed,
    Object? reportSavePath = freezed,
  }) {
    return _then(_self.copyWith(
      isolationMode: freezed == isolationMode
          ? _self.isolationMode
          : isolationMode // ignore: cast_nullable_to_non_nullable
              as bool?,
      enableReportSaver: freezed == enableReportSaver
          ? _self.enableReportSaver
          : enableReportSaver // ignore: cast_nullable_to_non_nullable
              as bool?,
      goldenDiffGitRepo: freezed == goldenDiffGitRepo
          ? _self.goldenDiffGitRepo
          : goldenDiffGitRepo // ignore: cast_nullable_to_non_nullable
              as String?,
      runOnly: freezed == runOnly
          ? _self.runOnly
          : runOnly // ignore: cast_nullable_to_non_nullable
              as String?,
      reportSavePath: freezed == reportSavePath
          ? _self.reportSavePath
          : reportSavePath // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _GlobalConfigNullable implements GlobalConfigNullable {
  _GlobalConfigNullable(
      {this.isolationMode,
      this.enableReportSaver,
      this.goldenDiffGitRepo,
      this.runOnly,
      this.reportSavePath});
  factory _GlobalConfigNullable.fromJson(Map<String, dynamic> json) =>
      _$GlobalConfigNullableFromJson(json);

  @override
  final bool? isolationMode;
  @override
  final bool? enableReportSaver;
  @override
  final String? goldenDiffGitRepo;
  @override
  final String? runOnly;
  @override
  final String? reportSavePath;

  /// Create a copy of GlobalConfigNullable
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$GlobalConfigNullableCopyWith<_GlobalConfigNullable> get copyWith =>
      __$GlobalConfigNullableCopyWithImpl<_GlobalConfigNullable>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$GlobalConfigNullableToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _GlobalConfigNullable &&
            (identical(other.isolationMode, isolationMode) ||
                other.isolationMode == isolationMode) &&
            (identical(other.enableReportSaver, enableReportSaver) ||
                other.enableReportSaver == enableReportSaver) &&
            (identical(other.goldenDiffGitRepo, goldenDiffGitRepo) ||
                other.goldenDiffGitRepo == goldenDiffGitRepo) &&
            (identical(other.runOnly, runOnly) || other.runOnly == runOnly) &&
            (identical(other.reportSavePath, reportSavePath) ||
                other.reportSavePath == reportSavePath));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, isolationMode, enableReportSaver,
      goldenDiffGitRepo, runOnly, reportSavePath);

  @override
  String toString() {
    return 'GlobalConfigNullable(isolationMode: $isolationMode, enableReportSaver: $enableReportSaver, goldenDiffGitRepo: $goldenDiffGitRepo, runOnly: $runOnly, reportSavePath: $reportSavePath)';
  }
}

/// @nodoc
abstract mixin class _$GlobalConfigNullableCopyWith<$Res>
    implements $GlobalConfigNullableCopyWith<$Res> {
  factory _$GlobalConfigNullableCopyWith(_GlobalConfigNullable value,
          $Res Function(_GlobalConfigNullable) _then) =
      __$GlobalConfigNullableCopyWithImpl;
  @override
  @useResult
  $Res call(
      {bool? isolationMode,
      bool? enableReportSaver,
      String? goldenDiffGitRepo,
      String? runOnly,
      String? reportSavePath});
}

/// @nodoc
class __$GlobalConfigNullableCopyWithImpl<$Res>
    implements _$GlobalConfigNullableCopyWith<$Res> {
  __$GlobalConfigNullableCopyWithImpl(this._self, this._then);

  final _GlobalConfigNullable _self;
  final $Res Function(_GlobalConfigNullable) _then;

  /// Create a copy of GlobalConfigNullable
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? isolationMode = freezed,
    Object? enableReportSaver = freezed,
    Object? goldenDiffGitRepo = freezed,
    Object? runOnly = freezed,
    Object? reportSavePath = freezed,
  }) {
    return _then(_GlobalConfigNullable(
      isolationMode: freezed == isolationMode
          ? _self.isolationMode
          : isolationMode // ignore: cast_nullable_to_non_nullable
              as bool?,
      enableReportSaver: freezed == enableReportSaver
          ? _self.enableReportSaver
          : enableReportSaver // ignore: cast_nullable_to_non_nullable
              as bool?,
      goldenDiffGitRepo: freezed == goldenDiffGitRepo
          ? _self.goldenDiffGitRepo
          : goldenDiffGitRepo // ignore: cast_nullable_to_non_nullable
              as String?,
      runOnly: freezed == runOnly
          ? _self.runOnly
          : runOnly // ignore: cast_nullable_to_non_nullable
              as String?,
      reportSavePath: freezed == reportSavePath
          ? _self.reportSavePath
          : reportSavePath // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
