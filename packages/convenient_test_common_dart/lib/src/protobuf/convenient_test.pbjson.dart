///
//  Generated code. Do not modify.
//  source: convenient_test.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use overallExecutionDescriptor instead')
const OverallExecution$json = const {
  '1': 'OverallExecution',
  '2': const [
    const {'1': 'OVERALL_EXECUTION_INVALID', '2': 0},
    const {'1': 'SET_UP_ALL', '2': 1},
    const {'1': 'TEAR_DOWN_ALL', '2': 2},
  ],
};

/// Descriptor for `OverallExecution`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List overallExecutionDescriptor = $convert.base64Decode(
    'ChBPdmVyYWxsRXhlY3V0aW9uEh0KGU9WRVJBTExfRVhFQ1VUSU9OX0lOVkFMSUQQABIOCgpTRVRfVVBfQUxMEAESEQoNVEVBUl9ET1dOX0FMTBAC');
@$core.Deprecated('Use logSubEntryTypeDescriptor instead')
const LogSubEntryType$json = const {
  '1': 'LogSubEntryType',
  '2': const [
    const {'1': 'INVALID', '2': 0},
    const {'1': 'GENERAL_MESSAGE', '2': 1},
    const {'1': 'TEST_START', '2': 2},
    const {'1': 'TEST_BODY', '2': 3},
    const {'1': 'TEST_END', '2': 4},
    const {'1': 'ASSERT', '2': 5},
    const {'1': 'ASSERT_FAIL', '2': 6},
    const {'1': 'SECTION', '2': 7},
  ],
};

/// Descriptor for `LogSubEntryType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List logSubEntryTypeDescriptor = $convert.base64Decode(
    'Cg9Mb2dTdWJFbnRyeVR5cGUSCwoHSU5WQUxJRBAAEhMKD0dFTkVSQUxfTUVTU0FHRRABEg4KClRFU1RfU1RBUlQQAhINCglURVNUX0JPRFkQAxIMCghURVNUX0VORBAEEgoKBkFTU0VSVBAFEg8KC0FTU0VSVF9GQUlMEAYSCwoHU0VDVElPThAH');
@$core.Deprecated('Use reportCollectionDescriptor instead')
const ReportCollection$json = const {
  '1': 'ReportCollection',
  '2': const [
    const {'1': 'items', '3': 1, '4': 3, '5': 11, '6': '.ReportItem', '10': 'items'},
  ],
};

/// Descriptor for `ReportCollection`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List reportCollectionDescriptor =
    $convert.base64Decode('ChBSZXBvcnRDb2xsZWN0aW9uEiEKBWl0ZW1zGAEgAygLMgsuUmVwb3J0SXRlbVIFaXRlbXM=');
@$core.Deprecated('Use reportItemDescriptor instead')
const ReportItem$json = const {
  '1': 'ReportItem',
  '2': const [
    const {
      '1': 'overall_execution',
      '3': 7,
      '4': 1,
      '5': 14,
      '6': '.OverallExecution',
      '9': 0,
      '10': 'overallExecution'
    },
    const {'1': 'suite_info_proto', '3': 1, '4': 1, '5': 11, '6': '.SuiteInfoProto', '9': 0, '10': 'suiteInfoProto'},
    const {'1': 'log_entry', '3': 2, '4': 1, '5': 11, '6': '.LogEntry', '9': 0, '10': 'logEntry'},
    const {
      '1': 'runner_state_change',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.RunnerStateChange',
      '9': 0,
      '10': 'runnerStateChange'
    },
    const {'1': 'runner_error', '3': 4, '4': 1, '5': 11, '6': '.RunnerError', '9': 0, '10': 'runnerError'},
    const {'1': 'runner_message', '3': 5, '4': 1, '5': 11, '6': '.RunnerMessage', '9': 0, '10': 'runnerMessage'},
    const {'1': 'snapshot', '3': 6, '4': 1, '5': 11, '6': '.Snapshot', '9': 0, '10': 'snapshot'},
  ],
  '8': const [
    const {'1': 'sub_type'},
  ],
};

/// Descriptor for `ReportItem`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List reportItemDescriptor = $convert.base64Decode(
    'CgpSZXBvcnRJdGVtEkAKEW92ZXJhbGxfZXhlY3V0aW9uGAcgASgOMhEuT3ZlcmFsbEV4ZWN1dGlvbkgAUhBvdmVyYWxsRXhlY3V0aW9uEjsKEHN1aXRlX2luZm9fcHJvdG8YASABKAsyDy5TdWl0ZUluZm9Qcm90b0gAUg5zdWl0ZUluZm9Qcm90bxIoCglsb2dfZW50cnkYAiABKAsyCS5Mb2dFbnRyeUgAUghsb2dFbnRyeRJEChNydW5uZXJfc3RhdGVfY2hhbmdlGAMgASgLMhIuUnVubmVyU3RhdGVDaGFuZ2VIAFIRcnVubmVyU3RhdGVDaGFuZ2USMQoMcnVubmVyX2Vycm9yGAQgASgLMgwuUnVubmVyRXJyb3JIAFILcnVubmVyRXJyb3ISNwoOcnVubmVyX21lc3NhZ2UYBSABKAsyDi5SdW5uZXJNZXNzYWdlSABSDXJ1bm5lck1lc3NhZ2USJwoIc25hcHNob3QYBiABKAsyCS5TbmFwc2hvdEgAUghzbmFwc2hvdEIKCghzdWJfdHlwZQ==');
@$core.Deprecated('Use logEntryDescriptor instead')
const LogEntry$json = const {
  '1': 'LogEntry',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 5, '10': 'id'},
    const {'1': 'entry_locators', '3': 2, '4': 3, '5': 9, '10': 'entryLocators'},
    const {'1': 'sub_entries', '3': 3, '4': 3, '5': 11, '6': '.LogSubEntry', '10': 'subEntries'},
  ],
};

/// Descriptor for `LogEntry`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List logEntryDescriptor = $convert.base64Decode(
    'CghMb2dFbnRyeRIOCgJpZBgBIAEoBVICaWQSJQoOZW50cnlfbG9jYXRvcnMYAiADKAlSDWVudHJ5TG9jYXRvcnMSLQoLc3ViX2VudHJpZXMYAyADKAsyDC5Mb2dTdWJFbnRyeVIKc3ViRW50cmllcw==');
@$core.Deprecated('Use logSubEntryDescriptor instead')
const LogSubEntry$json = const {
  '1': 'LogSubEntry',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 5, '10': 'id'},
    const {'1': 'time', '3': 2, '4': 1, '5': 3, '10': 'time'},
    const {'1': 'type', '3': 3, '4': 1, '5': 14, '6': '.LogSubEntryType', '10': 'type'},
    const {'1': 'title', '3': 4, '4': 1, '5': 9, '10': 'title'},
    const {'1': 'message', '3': 5, '4': 1, '5': 9, '10': 'message'},
    const {'1': 'error', '3': 6, '4': 1, '5': 9, '10': 'error'},
    const {'1': 'stack_trace', '3': 7, '4': 1, '5': 9, '10': 'stackTrace'},
  ],
};

/// Descriptor for `LogSubEntry`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List logSubEntryDescriptor = $convert.base64Decode(
    'CgtMb2dTdWJFbnRyeRIOCgJpZBgBIAEoBVICaWQSEgoEdGltZRgCIAEoA1IEdGltZRIkCgR0eXBlGAMgASgOMhAuTG9nU3ViRW50cnlUeXBlUgR0eXBlEhQKBXRpdGxlGAQgASgJUgV0aXRsZRIYCgdtZXNzYWdlGAUgASgJUgdtZXNzYWdlEhQKBWVycm9yGAYgASgJUgVlcnJvchIfCgtzdGFja190cmFjZRgHIAEoCVIKc3RhY2tUcmFjZQ==');
@$core.Deprecated('Use suiteInfoProtoDescriptor instead')
const SuiteInfoProto$json = const {
  '1': 'SuiteInfoProto',
  '2': const [
    const {'1': 'group_id', '3': 1, '4': 1, '5': 5, '10': 'groupId'},
    const {'1': 'groups', '3': 2, '4': 3, '5': 11, '6': '.GroupInfoProto', '10': 'groups'},
    const {'1': 'tests', '3': 3, '4': 3, '5': 11, '6': '.TestInfoProto', '10': 'tests'},
  ],
};

/// Descriptor for `SuiteInfoProto`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List suiteInfoProtoDescriptor = $convert.base64Decode(
    'Cg5TdWl0ZUluZm9Qcm90bxIZCghncm91cF9pZBgBIAEoBVIHZ3JvdXBJZBInCgZncm91cHMYAiADKAsyDy5Hcm91cEluZm9Qcm90b1IGZ3JvdXBzEiQKBXRlc3RzGAMgAygLMg4uVGVzdEluZm9Qcm90b1IFdGVzdHM=');
@$core.Deprecated('Use groupInfoProtoDescriptor instead')
const GroupInfoProto$json = const {
  '1': 'GroupInfoProto',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 5, '10': 'id'},
    const {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'parent_id', '3': 3, '4': 1, '5': 5, '10': 'parentId'},
    const {'1': 'entry_ids', '3': 4, '4': 3, '5': 5, '10': 'entryIds'},
  ],
};

/// Descriptor for `GroupInfoProto`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List groupInfoProtoDescriptor = $convert.base64Decode(
    'Cg5Hcm91cEluZm9Qcm90bxIOCgJpZBgBIAEoBVICaWQSEgoEbmFtZRgCIAEoCVIEbmFtZRIbCglwYXJlbnRfaWQYAyABKAVSCHBhcmVudElkEhsKCWVudHJ5X2lkcxgEIAMoBVIIZW50cnlJZHM=');
@$core.Deprecated('Use testInfoProtoDescriptor instead')
const TestInfoProto$json = const {
  '1': 'TestInfoProto',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 5, '10': 'id'},
    const {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'parent_id', '3': 3, '4': 1, '5': 5, '10': 'parentId'},
  ],
};

/// Descriptor for `TestInfoProto`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List testInfoProtoDescriptor = $convert.base64Decode(
    'Cg1UZXN0SW5mb1Byb3RvEg4KAmlkGAEgASgFUgJpZBISCgRuYW1lGAIgASgJUgRuYW1lEhsKCXBhcmVudF9pZBgDIAEoBVIIcGFyZW50SWQ=');
@$core.Deprecated('Use runnerStateChangeDescriptor instead')
const RunnerStateChange$json = const {
  '1': 'RunnerStateChange',
  '2': const [
    const {'1': 'entry_locators', '3': 1, '4': 3, '5': 9, '10': 'entryLocators'},
    const {'1': 'state', '3': 2, '4': 1, '5': 11, '6': '.TestEntryState', '10': 'state'},
  ],
};

/// Descriptor for `RunnerStateChange`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List runnerStateChangeDescriptor = $convert.base64Decode(
    'ChFSdW5uZXJTdGF0ZUNoYW5nZRIlCg5lbnRyeV9sb2NhdG9ycxgBIAMoCVINZW50cnlMb2NhdG9ycxIlCgVzdGF0ZRgCIAEoCzIPLlRlc3RFbnRyeVN0YXRlUgVzdGF0ZQ==');
@$core.Deprecated('Use testEntryStateDescriptor instead')
const TestEntryState$json = const {
  '1': 'TestEntryState',
  '2': const [
    const {'1': 'status', '3': 1, '4': 1, '5': 9, '10': 'status'},
    const {'1': 'result', '3': 2, '4': 1, '5': 9, '10': 'result'},
  ],
};

/// Descriptor for `TestEntryState`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List testEntryStateDescriptor =
    $convert.base64Decode('Cg5UZXN0RW50cnlTdGF0ZRIWCgZzdGF0dXMYASABKAlSBnN0YXR1cxIWCgZyZXN1bHQYAiABKAlSBnJlc3VsdA==');
@$core.Deprecated('Use runnerErrorDescriptor instead')
const RunnerError$json = const {
  '1': 'RunnerError',
  '2': const [
    const {'1': 'entry_locators', '3': 1, '4': 3, '5': 9, '10': 'entryLocators'},
    const {'1': 'error', '3': 2, '4': 1, '5': 9, '10': 'error'},
    const {'1': 'stack_trace', '3': 3, '4': 1, '5': 9, '10': 'stackTrace'},
  ],
};

/// Descriptor for `RunnerError`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List runnerErrorDescriptor = $convert.base64Decode(
    'CgtSdW5uZXJFcnJvchIlCg5lbnRyeV9sb2NhdG9ycxgBIAMoCVINZW50cnlMb2NhdG9ycxIUCgVlcnJvchgCIAEoCVIFZXJyb3ISHwoLc3RhY2tfdHJhY2UYAyABKAlSCnN0YWNrVHJhY2U=');
@$core.Deprecated('Use runnerMessageDescriptor instead')
const RunnerMessage$json = const {
  '1': 'RunnerMessage',
  '2': const [
    const {'1': 'entry_locators', '3': 1, '4': 3, '5': 9, '10': 'entryLocators'},
    const {'1': 'message', '3': 2, '4': 1, '5': 9, '10': 'message'},
  ],
};

/// Descriptor for `RunnerMessage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List runnerMessageDescriptor = $convert.base64Decode(
    'Cg1SdW5uZXJNZXNzYWdlEiUKDmVudHJ5X2xvY2F0b3JzGAEgAygJUg1lbnRyeUxvY2F0b3JzEhgKB21lc3NhZ2UYAiABKAlSB21lc3NhZ2U=');
@$core.Deprecated('Use snapshotDescriptor instead')
const Snapshot$json = const {
  '1': 'Snapshot',
  '2': const [
    const {'1': 'log_entry_id', '3': 1, '4': 1, '5': 5, '10': 'logEntryId'},
    const {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'image', '3': 3, '4': 1, '5': 12, '10': 'image'},
  ],
};

/// Descriptor for `Snapshot`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List snapshotDescriptor = $convert.base64Decode(
    'CghTbmFwc2hvdBIgCgxsb2dfZW50cnlfaWQYASABKAVSCmxvZ0VudHJ5SWQSEgoEbmFtZRgCIAEoCVIEbmFtZRIUCgVpbWFnZRgDIAEoDFIFaW1hZ2U=');
@$core.Deprecated('Use workerModeDescriptor instead')
const WorkerMode$json = const {
  '1': 'WorkerMode',
  '2': const [
    const {
      '1': 'interactive_app',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.WorkerModeInteractiveApp',
      '9': 0,
      '10': 'interactiveApp'
    },
    const {
      '1': 'integration_test',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.WorkerModeIntegrationTest',
      '9': 0,
      '10': 'integrationTest'
    },
  ],
  '8': const [
    const {'1': 'sub_type'},
  ],
};

/// Descriptor for `WorkerMode`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List workerModeDescriptor = $convert.base64Decode(
    'CgpXb3JrZXJNb2RlEkQKD2ludGVyYWN0aXZlX2FwcBgBIAEoCzIZLldvcmtlck1vZGVJbnRlcmFjdGl2ZUFwcEgAUg5pbnRlcmFjdGl2ZUFwcBJHChBpbnRlZ3JhdGlvbl90ZXN0GAIgASgLMhouV29ya2VyTW9kZUludGVncmF0aW9uVGVzdEgAUg9pbnRlZ3JhdGlvblRlc3RCCgoIc3ViX3R5cGU=');
@$core.Deprecated('Use workerModeInteractiveAppDescriptor instead')
const WorkerModeInteractiveApp$json = const {
  '1': 'WorkerModeInteractiveApp',
};

/// Descriptor for `WorkerModeInteractiveApp`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List workerModeInteractiveAppDescriptor =
    $convert.base64Decode('ChhXb3JrZXJNb2RlSW50ZXJhY3RpdmVBcHA=');
@$core.Deprecated('Use workerModeIntegrationTestDescriptor instead')
const WorkerModeIntegrationTest$json = const {
  '1': 'WorkerModeIntegrationTest',
  '2': const [
    const {'1': 'filter_name_regex', '3': 1, '4': 1, '5': 9, '10': 'filterNameRegex'},
    const {'1': 'report_suite_info', '3': 2, '4': 1, '5': 8, '10': 'reportSuiteInfo'},
  ],
};

/// Descriptor for `WorkerModeIntegrationTest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List workerModeIntegrationTestDescriptor = $convert.base64Decode(
    'ChlXb3JrZXJNb2RlSW50ZWdyYXRpb25UZXN0EioKEWZpbHRlcl9uYW1lX3JlZ2V4GAEgASgJUg9maWx0ZXJOYW1lUmVnZXgSKgoRcmVwb3J0X3N1aXRlX2luZm8YAiABKAhSD3JlcG9ydFN1aXRlSW5mbw==');
@$core.Deprecated('Use emptyDescriptor instead')
const Empty$json = const {
  '1': 'Empty',
};

/// Descriptor for `Empty`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List emptyDescriptor = $convert.base64Decode('CgVFbXB0eQ==');
