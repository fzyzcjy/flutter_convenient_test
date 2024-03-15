///
//  Generated code. Do not modify.
//  source: convenient_test.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

// ignore_for_file: UNDEFINED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class LogSubEntryType extends $pb.ProtobufEnum {
  static const LogSubEntryType INVALID = LogSubEntryType._(
      0,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'INVALID');
  static const LogSubEntryType GENERAL_MESSAGE = LogSubEntryType._(
      1,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'GENERAL_MESSAGE');
  static const LogSubEntryType TEST_START = LogSubEntryType._(
      2,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'TEST_START');
  static const LogSubEntryType TEST_BODY = LogSubEntryType._(
      3,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'TEST_BODY');
  static const LogSubEntryType TEST_END = LogSubEntryType._(
      4,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'TEST_END');
  static const LogSubEntryType ASSERT = LogSubEntryType._(
      5,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'ASSERT');
  static const LogSubEntryType ASSERT_FAIL = LogSubEntryType._(
      6,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'ASSERT_FAIL');
  static const LogSubEntryType SECTION = LogSubEntryType._(
      7,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'SECTION');

  static const $core.List<LogSubEntryType> values = <LogSubEntryType>[
    INVALID,
    GENERAL_MESSAGE,
    TEST_START,
    TEST_BODY,
    TEST_END,
    ASSERT,
    ASSERT_FAIL,
    SECTION,
  ];

  static final $core.Map<$core.int, LogSubEntryType> _byValue =
      $pb.ProtobufEnum.initByValue(values);
  static LogSubEntryType? valueOf($core.int value) => _byValue[value];

  const LogSubEntryType._($core.int v, $core.String n) : super(v, n);
}
