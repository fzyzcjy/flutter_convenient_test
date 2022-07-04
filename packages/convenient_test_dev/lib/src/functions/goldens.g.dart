// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: implicit_dynamic_parameter, non_constant_identifier_names, duplicate_ignore

part of 'goldens.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GoldenConfig _$GoldenConfigFromJson(Map<String, dynamic> json) => GoldenConfig(
      allowUpdate: json['allowUpdate'] as bool,
      maxToleration: json['maxToleration'] == null
          ? null
          : GoldenTolerationEntry.fromJson(json['maxToleration'] as Map<String, dynamic>),
      greaterThanToleration: (json['greaterThanToleration'] as List<dynamic>?)
          ?.map((e) => GoldenTolerationEntry.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GoldenConfigToJson(GoldenConfig instance) => <String, dynamic>{
      'allowUpdate': instance.allowUpdate,
      'maxToleration': instance.maxToleration,
      'greaterThanToleration': instance.greaterThanToleration,
    };

GoldenTolerationEntry _$GoldenTolerationEntryFromJson(Map<String, dynamic> json) => GoldenTolerationEntry(
      diffPerPixel: json['diffPerPixel'] as int,
      countPercent: (json['countPercent'] as num).toDouble(),
    );

Map<String, dynamic> _$GoldenTolerationEntryToJson(GoldenTolerationEntry instance) => <String, dynamic>{
      'diffPerPixel': instance.diffPerPixel,
      'countPercent': instance.countPercent,
    };
