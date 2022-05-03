///
//  Generated code. Do not modify.
//  source: convenient_test.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

// ignore_for_file: UNDEFINED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class LogEntryType extends $pb.ProtobufEnum {
  static const LogEntryType INVALID =
      LogEntryType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'INVALID');
  static const LogEntryType GENERAL_MESSAGE =
      LogEntryType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'GENERAL_MESSAGE');
  static const LogEntryType TEST_START =
      LogEntryType._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'TEST_START');
  static const LogEntryType TEST_BODY =
      LogEntryType._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'TEST_BODY');
  static const LogEntryType TEST_END =
      LogEntryType._(4, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'TEST_END');
  static const LogEntryType ASSERT =
      LogEntryType._(5, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'ASSERT');
  static const LogEntryType ASSERT_FAIL =
      LogEntryType._(6, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'ASSERT_FAIL');

  static const $core.List<LogEntryType> values = <LogEntryType>[
    INVALID,
    GENERAL_MESSAGE,
    TEST_START,
    TEST_BODY,
    TEST_END,
    ASSERT,
    ASSERT_FAIL,
  ];

  static final $core.Map<$core.int, LogEntryType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static LogEntryType? valueOf($core.int value) => _byValue[value];

  const LogEntryType._($core.int v, $core.String n) : super(v, n);
}
