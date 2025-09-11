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
      : GoldenTolerationEntry.fromJson(
          json['maxToleration'] as Map<String, dynamic>,
        ),
  greaterThanToleration: (json['greaterThanToleration'] as List<dynamic>?)
      ?.map((e) => GoldenTolerationEntry.fromJson(e as Map<String, dynamic>))
      .toList(),
  cropBbox: _$JsonConverterFromJson<Map<String, Object?>, Rectangle<int>>(
    json['cropBbox'],
    const _RectangleIntJsonConverter().fromJson,
  ),
);

Map<String, dynamic> _$GoldenConfigToJson(GoldenConfig instance) =>
    <String, dynamic>{
      'allowUpdate': instance.allowUpdate,
      'maxToleration': instance.maxToleration,
      'greaterThanToleration': instance.greaterThanToleration,
      'cropBbox': _$JsonConverterToJson<Map<String, Object?>, Rectangle<int>>(
        instance.cropBbox,
        const _RectangleIntJsonConverter().toJson,
      ),
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) => json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) => value == null ? null : toJson(value);

GoldenTolerationEntry _$GoldenTolerationEntryFromJson(
  Map<String, dynamic> json,
) => GoldenTolerationEntry(
  diffPerPixel: (json['diffPerPixel'] as num).toInt(),
  countPercent: (json['countPercent'] as num).toDouble(),
);

Map<String, dynamic> _$GoldenTolerationEntryToJson(
  GoldenTolerationEntry instance,
) => <String, dynamic>{
  'diffPerPixel': instance.diffPerPixel,
  'countPercent': instance.countPercent,
};
