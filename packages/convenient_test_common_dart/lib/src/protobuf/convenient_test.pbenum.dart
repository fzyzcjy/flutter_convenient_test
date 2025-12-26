// This is a generated file - do not edit.
//
// Generated from convenient_test.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class LogSubEntryType extends $pb.ProtobufEnum {
  static const LogSubEntryType INVALID =
      LogSubEntryType._(0, _omitEnumNames ? '' : 'INVALID');
  static const LogSubEntryType GENERAL_MESSAGE =
      LogSubEntryType._(1, _omitEnumNames ? '' : 'GENERAL_MESSAGE');
  static const LogSubEntryType TEST_START =
      LogSubEntryType._(2, _omitEnumNames ? '' : 'TEST_START');
  static const LogSubEntryType TEST_BODY =
      LogSubEntryType._(3, _omitEnumNames ? '' : 'TEST_BODY');
  static const LogSubEntryType TEST_END =
      LogSubEntryType._(4, _omitEnumNames ? '' : 'TEST_END');
  static const LogSubEntryType ASSERT =
      LogSubEntryType._(5, _omitEnumNames ? '' : 'ASSERT');
  static const LogSubEntryType ASSERT_FAIL =
      LogSubEntryType._(6, _omitEnumNames ? '' : 'ASSERT_FAIL');
  static const LogSubEntryType SECTION =
      LogSubEntryType._(7, _omitEnumNames ? '' : 'SECTION');

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

  static final $core.List<LogSubEntryType?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 7);
  static LogSubEntryType? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const LogSubEntryType._(super.value, super.name);
}

const $core.bool _omitEnumNames =
    $core.bool.fromEnvironment('protobuf.omit_enum_names');
