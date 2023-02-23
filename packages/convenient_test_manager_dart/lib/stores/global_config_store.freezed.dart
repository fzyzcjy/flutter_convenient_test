// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'global_config_store.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GlobalConfigNullable _$GlobalConfigNullableFromJson(Map<String, dynamic> json) {
  return _GlobalConfigNullable.fromJson(json);
}

/// @nodoc
mixin _$GlobalConfigNullable {
  bool? get isolationMode => throw _privateConstructorUsedError;
  bool? get enableReportSaver => throw _privateConstructorUsedError;
  String? get goldenDiffGitRepo => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GlobalConfigNullableCopyWith<GlobalConfigNullable> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GlobalConfigNullableCopyWith<$Res> {
  factory $GlobalConfigNullableCopyWith(GlobalConfigNullable value, $Res Function(GlobalConfigNullable) then) =
      _$GlobalConfigNullableCopyWithImpl<$Res, GlobalConfigNullable>;
  @useResult
  $Res call({bool? isolationMode, bool? enableReportSaver, String? goldenDiffGitRepo});
}

/// @nodoc
class _$GlobalConfigNullableCopyWithImpl<$Res, $Val extends GlobalConfigNullable>
    implements $GlobalConfigNullableCopyWith<$Res> {
  _$GlobalConfigNullableCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isolationMode = freezed,
    Object? enableReportSaver = freezed,
    Object? goldenDiffGitRepo = freezed,
  }) {
    return _then(_value.copyWith(
      isolationMode: freezed == isolationMode
          ? _value.isolationMode
          : isolationMode // ignore: cast_nullable_to_non_nullable
              as bool?,
      enableReportSaver: freezed == enableReportSaver
          ? _value.enableReportSaver
          : enableReportSaver // ignore: cast_nullable_to_non_nullable
              as bool?,
      goldenDiffGitRepo: freezed == goldenDiffGitRepo
          ? _value.goldenDiffGitRepo
          : goldenDiffGitRepo // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_GlobalConfigNullableCopyWith<$Res> implements $GlobalConfigNullableCopyWith<$Res> {
  factory _$$_GlobalConfigNullableCopyWith(_$_GlobalConfigNullable value, $Res Function(_$_GlobalConfigNullable) then) =
      __$$_GlobalConfigNullableCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool? isolationMode, bool? enableReportSaver, String? goldenDiffGitRepo});
}

/// @nodoc
class __$$_GlobalConfigNullableCopyWithImpl<$Res>
    extends _$GlobalConfigNullableCopyWithImpl<$Res, _$_GlobalConfigNullable>
    implements _$$_GlobalConfigNullableCopyWith<$Res> {
  __$$_GlobalConfigNullableCopyWithImpl(_$_GlobalConfigNullable _value, $Res Function(_$_GlobalConfigNullable) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isolationMode = freezed,
    Object? enableReportSaver = freezed,
    Object? goldenDiffGitRepo = freezed,
  }) {
    return _then(_$_GlobalConfigNullable(
      isolationMode: freezed == isolationMode
          ? _value.isolationMode
          : isolationMode // ignore: cast_nullable_to_non_nullable
              as bool?,
      enableReportSaver: freezed == enableReportSaver
          ? _value.enableReportSaver
          : enableReportSaver // ignore: cast_nullable_to_non_nullable
              as bool?,
      goldenDiffGitRepo: freezed == goldenDiffGitRepo
          ? _value.goldenDiffGitRepo
          : goldenDiffGitRepo // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_GlobalConfigNullable implements _GlobalConfigNullable {
  _$_GlobalConfigNullable({this.isolationMode, this.enableReportSaver, this.goldenDiffGitRepo});

  factory _$_GlobalConfigNullable.fromJson(Map<String, dynamic> json) => _$$_GlobalConfigNullableFromJson(json);

  @override
  final bool? isolationMode;
  @override
  final bool? enableReportSaver;
  @override
  final String? goldenDiffGitRepo;

  @override
  String toString() {
    return 'GlobalConfigNullable(isolationMode: $isolationMode, enableReportSaver: $enableReportSaver, goldenDiffGitRepo: $goldenDiffGitRepo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GlobalConfigNullable &&
            (identical(other.isolationMode, isolationMode) || other.isolationMode == isolationMode) &&
            (identical(other.enableReportSaver, enableReportSaver) || other.enableReportSaver == enableReportSaver) &&
            (identical(other.goldenDiffGitRepo, goldenDiffGitRepo) || other.goldenDiffGitRepo == goldenDiffGitRepo));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, isolationMode, enableReportSaver, goldenDiffGitRepo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GlobalConfigNullableCopyWith<_$_GlobalConfigNullable> get copyWith =>
      __$$_GlobalConfigNullableCopyWithImpl<_$_GlobalConfigNullable>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GlobalConfigNullableToJson(
      this,
    );
  }
}

abstract class _GlobalConfigNullable implements GlobalConfigNullable {
  factory _GlobalConfigNullable(
      {final bool? isolationMode,
      final bool? enableReportSaver,
      final String? goldenDiffGitRepo}) = _$_GlobalConfigNullable;

  factory _GlobalConfigNullable.fromJson(Map<String, dynamic> json) = _$_GlobalConfigNullable.fromJson;

  @override
  bool? get isolationMode;
  @override
  bool? get enableReportSaver;
  @override
  String? get goldenDiffGitRepo;
  @override
  @JsonKey(ignore: true)
  _$$_GlobalConfigNullableCopyWith<_$_GlobalConfigNullable> get copyWith => throw _privateConstructorUsedError;
}
