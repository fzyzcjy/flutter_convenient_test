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

/// @nodoc
mixin _$GlobalConfigNullable {
  bool? get isolationMode => throw _privateConstructorUsedError;
  bool? get enableReportSaver => throw _privateConstructorUsedError;
  String? get goldenDiffGitRepo => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GlobalConfigNullableCopyWith<GlobalConfigNullable> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GlobalConfigNullableCopyWith<$Res> {
  factory $GlobalConfigNullableCopyWith(GlobalConfigNullable value,
          $Res Function(GlobalConfigNullable) then) =
      _$GlobalConfigNullableCopyWithImpl<$Res>;
  $Res call(
      {bool? isolationMode,
      bool? enableReportSaver,
      String? goldenDiffGitRepo});
}

/// @nodoc
class _$GlobalConfigNullableCopyWithImpl<$Res>
    implements $GlobalConfigNullableCopyWith<$Res> {
  _$GlobalConfigNullableCopyWithImpl(this._value, this._then);

  final GlobalConfigNullable _value;
  // ignore: unused_field
  final $Res Function(GlobalConfigNullable) _then;

  @override
  $Res call({
    Object? isolationMode = freezed,
    Object? enableReportSaver = freezed,
    Object? goldenDiffGitRepo = freezed,
  }) {
    return _then(_value.copyWith(
      isolationMode: isolationMode == freezed
          ? _value.isolationMode
          : isolationMode // ignore: cast_nullable_to_non_nullable
              as bool?,
      enableReportSaver: enableReportSaver == freezed
          ? _value.enableReportSaver
          : enableReportSaver // ignore: cast_nullable_to_non_nullable
              as bool?,
      goldenDiffGitRepo: goldenDiffGitRepo == freezed
          ? _value.goldenDiffGitRepo
          : goldenDiffGitRepo // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_GlobalConfigNullableCopyWith<$Res>
    implements $GlobalConfigNullableCopyWith<$Res> {
  factory _$$_GlobalConfigNullableCopyWith(_$_GlobalConfigNullable value,
          $Res Function(_$_GlobalConfigNullable) then) =
      __$$_GlobalConfigNullableCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool? isolationMode,
      bool? enableReportSaver,
      String? goldenDiffGitRepo});
}

/// @nodoc
class __$$_GlobalConfigNullableCopyWithImpl<$Res>
    extends _$GlobalConfigNullableCopyWithImpl<$Res>
    implements _$$_GlobalConfigNullableCopyWith<$Res> {
  __$$_GlobalConfigNullableCopyWithImpl(_$_GlobalConfigNullable _value,
      $Res Function(_$_GlobalConfigNullable) _then)
      : super(_value, (v) => _then(v as _$_GlobalConfigNullable));

  @override
  _$_GlobalConfigNullable get _value => super._value as _$_GlobalConfigNullable;

  @override
  $Res call({
    Object? isolationMode = freezed,
    Object? enableReportSaver = freezed,
    Object? goldenDiffGitRepo = freezed,
  }) {
    return _then(_$_GlobalConfigNullable(
      isolationMode: isolationMode == freezed
          ? _value.isolationMode
          : isolationMode // ignore: cast_nullable_to_non_nullable
              as bool?,
      enableReportSaver: enableReportSaver == freezed
          ? _value.enableReportSaver
          : enableReportSaver // ignore: cast_nullable_to_non_nullable
              as bool?,
      goldenDiffGitRepo: goldenDiffGitRepo == freezed
          ? _value.goldenDiffGitRepo
          : goldenDiffGitRepo // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_GlobalConfigNullable implements _GlobalConfigNullable {
  _$_GlobalConfigNullable(
      {this.isolationMode, this.enableReportSaver, this.goldenDiffGitRepo});

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
            const DeepCollectionEquality()
                .equals(other.isolationMode, isolationMode) &&
            const DeepCollectionEquality()
                .equals(other.enableReportSaver, enableReportSaver) &&
            const DeepCollectionEquality()
                .equals(other.goldenDiffGitRepo, goldenDiffGitRepo));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(isolationMode),
      const DeepCollectionEquality().hash(enableReportSaver),
      const DeepCollectionEquality().hash(goldenDiffGitRepo));

  @JsonKey(ignore: true)
  @override
  _$$_GlobalConfigNullableCopyWith<_$_GlobalConfigNullable> get copyWith =>
      __$$_GlobalConfigNullableCopyWithImpl<_$_GlobalConfigNullable>(
          this, _$identity);
}

abstract class _GlobalConfigNullable implements GlobalConfigNullable {
  factory _GlobalConfigNullable(
      {final bool? isolationMode,
      final bool? enableReportSaver,
      final String? goldenDiffGitRepo}) = _$_GlobalConfigNullable;

  @override
  bool? get isolationMode => throw _privateConstructorUsedError;
  @override
  bool? get enableReportSaver => throw _privateConstructorUsedError;
  @override
  String? get goldenDiffGitRepo => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_GlobalConfigNullableCopyWith<_$_GlobalConfigNullable> get copyWith =>
      throw _privateConstructorUsedError;
}
