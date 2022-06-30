// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: implicit_dynamic_parameter, non_constant_identifier_names, duplicate_ignore

part of 'goldens.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GoldenTolerationEntry _$GoldenTolerationEntryFromJson(
        Map<String, dynamic> json) =>
    GoldenTolerationEntry(
      diffPerPixel: json['diffPerPixel'] as int,
      countPercent: (json['countPercent'] as num).toDouble(),
    );

Map<String, dynamic> _$GoldenTolerationEntryToJson(
        GoldenTolerationEntry instance) =>
    <String, dynamic>{
      'diffPerPixel': instance.diffPerPixel,
      'countPercent': instance.countPercent,
    };

_$GoldenConfigPrimary _$$GoldenConfigPrimaryFromJson(
        Map<String, dynamic> json) =>
    _$GoldenConfigPrimary(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$GoldenConfigPrimaryToJson(
        _$GoldenConfigPrimary instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$GoldenConfigSecondary _$$GoldenConfigSecondaryFromJson(
        Map<String, dynamic> json) =>
    _$GoldenConfigSecondary(
      maxToleration: json['maxToleration'] == null
          ? null
          : GoldenTolerationEntry.fromJson(
              json['maxToleration'] as Map<String, dynamic>),
      greaterThanToleration: (json['greaterThanToleration'] as List<dynamic>?)
          ?.map(
              (e) => GoldenTolerationEntry.fromJson(e as Map<String, dynamic>))
          .toList(),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$GoldenConfigSecondaryToJson(
        _$GoldenConfigSecondary instance) =>
    <String, dynamic>{
      'maxToleration': instance.maxToleration,
      'greaterThanToleration': instance.greaterThanToleration,
      'runtimeType': instance.$type,
    };
