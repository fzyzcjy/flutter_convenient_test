// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'goldens.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GoldenConfig _$GoldenConfigFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'primary':
      return GoldenConfigPrimary.fromJson(json);
    case 'secondary':
      return GoldenConfigSecondary.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'GoldenConfig',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$GoldenConfig {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() primary,
    required TResult Function(GoldenTolerationEntry? maxToleration,
            List<GoldenTolerationEntry>? greaterThanToleration)
        secondary,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? primary,
    TResult Function(GoldenTolerationEntry? maxToleration,
            List<GoldenTolerationEntry>? greaterThanToleration)?
        secondary,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? primary,
    TResult Function(GoldenTolerationEntry? maxToleration,
            List<GoldenTolerationEntry>? greaterThanToleration)?
        secondary,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GoldenConfigPrimary value) primary,
    required TResult Function(GoldenConfigSecondary value) secondary,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(GoldenConfigPrimary value)? primary,
    TResult Function(GoldenConfigSecondary value)? secondary,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GoldenConfigPrimary value)? primary,
    TResult Function(GoldenConfigSecondary value)? secondary,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GoldenConfigCopyWith<$Res> {
  factory $GoldenConfigCopyWith(
          GoldenConfig value, $Res Function(GoldenConfig) then) =
      _$GoldenConfigCopyWithImpl<$Res>;
}

/// @nodoc
class _$GoldenConfigCopyWithImpl<$Res> implements $GoldenConfigCopyWith<$Res> {
  _$GoldenConfigCopyWithImpl(this._value, this._then);

  final GoldenConfig _value;
  // ignore: unused_field
  final $Res Function(GoldenConfig) _then;
}

/// @nodoc
abstract class _$$GoldenConfigPrimaryCopyWith<$Res> {
  factory _$$GoldenConfigPrimaryCopyWith(_$GoldenConfigPrimary value,
          $Res Function(_$GoldenConfigPrimary) then) =
      __$$GoldenConfigPrimaryCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GoldenConfigPrimaryCopyWithImpl<$Res>
    extends _$GoldenConfigCopyWithImpl<$Res>
    implements _$$GoldenConfigPrimaryCopyWith<$Res> {
  __$$GoldenConfigPrimaryCopyWithImpl(
      _$GoldenConfigPrimary _value, $Res Function(_$GoldenConfigPrimary) _then)
      : super(_value, (v) => _then(v as _$GoldenConfigPrimary));

  @override
  _$GoldenConfigPrimary get _value => super._value as _$GoldenConfigPrimary;
}

/// @nodoc
@JsonSerializable()
class _$GoldenConfigPrimary
    with DiagnosticableTreeMixin
    implements GoldenConfigPrimary {
  const _$GoldenConfigPrimary({final String? $type})
      : $type = $type ?? 'primary';

  factory _$GoldenConfigPrimary.fromJson(Map<String, dynamic> json) =>
      _$$GoldenConfigPrimaryFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'GoldenConfig.primary()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'GoldenConfig.primary'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GoldenConfigPrimary);
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() primary,
    required TResult Function(GoldenTolerationEntry? maxToleration,
            List<GoldenTolerationEntry>? greaterThanToleration)
        secondary,
  }) {
    return primary();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? primary,
    TResult Function(GoldenTolerationEntry? maxToleration,
            List<GoldenTolerationEntry>? greaterThanToleration)?
        secondary,
  }) {
    return primary?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? primary,
    TResult Function(GoldenTolerationEntry? maxToleration,
            List<GoldenTolerationEntry>? greaterThanToleration)?
        secondary,
    required TResult orElse(),
  }) {
    if (primary != null) {
      return primary();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GoldenConfigPrimary value) primary,
    required TResult Function(GoldenConfigSecondary value) secondary,
  }) {
    return primary(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(GoldenConfigPrimary value)? primary,
    TResult Function(GoldenConfigSecondary value)? secondary,
  }) {
    return primary?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GoldenConfigPrimary value)? primary,
    TResult Function(GoldenConfigSecondary value)? secondary,
    required TResult orElse(),
  }) {
    if (primary != null) {
      return primary(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$GoldenConfigPrimaryToJson(this);
  }
}

abstract class GoldenConfigPrimary implements GoldenConfig {
  const factory GoldenConfigPrimary() = _$GoldenConfigPrimary;

  factory GoldenConfigPrimary.fromJson(Map<String, dynamic> json) =
      _$GoldenConfigPrimary.fromJson;
}

/// @nodoc
abstract class _$$GoldenConfigSecondaryCopyWith<$Res> {
  factory _$$GoldenConfigSecondaryCopyWith(_$GoldenConfigSecondary value,
          $Res Function(_$GoldenConfigSecondary) then) =
      __$$GoldenConfigSecondaryCopyWithImpl<$Res>;
  $Res call(
      {GoldenTolerationEntry? maxToleration,
      List<GoldenTolerationEntry>? greaterThanToleration});
}

/// @nodoc
class __$$GoldenConfigSecondaryCopyWithImpl<$Res>
    extends _$GoldenConfigCopyWithImpl<$Res>
    implements _$$GoldenConfigSecondaryCopyWith<$Res> {
  __$$GoldenConfigSecondaryCopyWithImpl(_$GoldenConfigSecondary _value,
      $Res Function(_$GoldenConfigSecondary) _then)
      : super(_value, (v) => _then(v as _$GoldenConfigSecondary));

  @override
  _$GoldenConfigSecondary get _value => super._value as _$GoldenConfigSecondary;

  @override
  $Res call({
    Object? maxToleration = freezed,
    Object? greaterThanToleration = freezed,
  }) {
    return _then(_$GoldenConfigSecondary(
      maxToleration: maxToleration == freezed
          ? _value.maxToleration
          : maxToleration // ignore: cast_nullable_to_non_nullable
              as GoldenTolerationEntry?,
      greaterThanToleration: greaterThanToleration == freezed
          ? _value._greaterThanToleration
          : greaterThanToleration // ignore: cast_nullable_to_non_nullable
              as List<GoldenTolerationEntry>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GoldenConfigSecondary
    with DiagnosticableTreeMixin
    implements GoldenConfigSecondary {
  const _$GoldenConfigSecondary(
      {this.maxToleration,
      final List<GoldenTolerationEntry>? greaterThanToleration,
      final String? $type})
      : _greaterThanToleration = greaterThanToleration,
        $type = $type ?? 'secondary';

  factory _$GoldenConfigSecondary.fromJson(Map<String, dynamic> json) =>
      _$$GoldenConfigSecondaryFromJson(json);

  @override
  final GoldenTolerationEntry? maxToleration;
  final List<GoldenTolerationEntry>? _greaterThanToleration;
  @override
  List<GoldenTolerationEntry>? get greaterThanToleration {
    final value = _greaterThanToleration;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'GoldenConfig.secondary(maxToleration: $maxToleration, greaterThanToleration: $greaterThanToleration)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'GoldenConfig.secondary'))
      ..add(DiagnosticsProperty('maxToleration', maxToleration))
      ..add(
          DiagnosticsProperty('greaterThanToleration', greaterThanToleration));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GoldenConfigSecondary &&
            const DeepCollectionEquality()
                .equals(other.maxToleration, maxToleration) &&
            const DeepCollectionEquality()
                .equals(other._greaterThanToleration, _greaterThanToleration));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(maxToleration),
      const DeepCollectionEquality().hash(_greaterThanToleration));

  @JsonKey(ignore: true)
  @override
  _$$GoldenConfigSecondaryCopyWith<_$GoldenConfigSecondary> get copyWith =>
      __$$GoldenConfigSecondaryCopyWithImpl<_$GoldenConfigSecondary>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() primary,
    required TResult Function(GoldenTolerationEntry? maxToleration,
            List<GoldenTolerationEntry>? greaterThanToleration)
        secondary,
  }) {
    return secondary(maxToleration, greaterThanToleration);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? primary,
    TResult Function(GoldenTolerationEntry? maxToleration,
            List<GoldenTolerationEntry>? greaterThanToleration)?
        secondary,
  }) {
    return secondary?.call(maxToleration, greaterThanToleration);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? primary,
    TResult Function(GoldenTolerationEntry? maxToleration,
            List<GoldenTolerationEntry>? greaterThanToleration)?
        secondary,
    required TResult orElse(),
  }) {
    if (secondary != null) {
      return secondary(maxToleration, greaterThanToleration);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GoldenConfigPrimary value) primary,
    required TResult Function(GoldenConfigSecondary value) secondary,
  }) {
    return secondary(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(GoldenConfigPrimary value)? primary,
    TResult Function(GoldenConfigSecondary value)? secondary,
  }) {
    return secondary?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GoldenConfigPrimary value)? primary,
    TResult Function(GoldenConfigSecondary value)? secondary,
    required TResult orElse(),
  }) {
    if (secondary != null) {
      return secondary(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$GoldenConfigSecondaryToJson(this);
  }
}

abstract class GoldenConfigSecondary implements GoldenConfig {
  const factory GoldenConfigSecondary(
          {final GoldenTolerationEntry? maxToleration,
          final List<GoldenTolerationEntry>? greaterThanToleration}) =
      _$GoldenConfigSecondary;

  factory GoldenConfigSecondary.fromJson(Map<String, dynamic> json) =
      _$GoldenConfigSecondary.fromJson;

  GoldenTolerationEntry? get maxToleration =>
      throw _privateConstructorUsedError;
  List<GoldenTolerationEntry>? get greaterThanToleration =>
      throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$GoldenConfigSecondaryCopyWith<_$GoldenConfigSecondary> get copyWith =>
      throw _privateConstructorUsedError;
}
