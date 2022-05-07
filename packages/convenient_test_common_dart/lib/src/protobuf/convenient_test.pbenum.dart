///
import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class OverallExecution extends $pb.ProtobufEnum {
  static const OverallExecution OVERALL_EXECUTION_INVALID = OverallExecution._(
      0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'OVERALL_EXECUTION_INVALID');
  static const OverallExecution SET_UP_ALL =
      OverallExecution._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'SET_UP_ALL');
  static const OverallExecution TEAR_DOWN_ALL =
      OverallExecution._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'TEAR_DOWN_ALL');

  static const $core.List<OverallExecution> values = <OverallExecution>[
    OVERALL_EXECUTION_INVALID,
    SET_UP_ALL,
    TEAR_DOWN_ALL,
  ];

  static final $core.Map<$core.int, OverallExecution> _byValue = $pb.ProtobufEnum.initByValue(values);

  static OverallExecution? valueOf($core.int value) => _byValue[value];

  const OverallExecution._($core.int v, $core.String n) : super(v, n);
}

class LogSubEntryType extends $pb.ProtobufEnum {
  static const LogSubEntryType INVALID =
      LogSubEntryType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'INVALID');
  static const LogSubEntryType GENERAL_MESSAGE =
      LogSubEntryType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'GENERAL_MESSAGE');
  static const LogSubEntryType TEST_START =
      LogSubEntryType._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'TEST_START');
  static const LogSubEntryType TEST_BODY =
      LogSubEntryType._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'TEST_BODY');
  static const LogSubEntryType TEST_END =
      LogSubEntryType._(4, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'TEST_END');
  static const LogSubEntryType ASSERT =
      LogSubEntryType._(5, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'ASSERT');
  static const LogSubEntryType ASSERT_FAIL =
      LogSubEntryType._(6, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'ASSERT_FAIL');
  static const LogSubEntryType SECTION =
      LogSubEntryType._(7, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'SECTION');

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

  static final $core.Map<$core.int, LogSubEntryType> _byValue = $pb.ProtobufEnum.initByValue(values);

  static LogSubEntryType? valueOf($core.int value) => _byValue[value];

  const LogSubEntryType._($core.int v, $core.String n) : super(v, n);
}
