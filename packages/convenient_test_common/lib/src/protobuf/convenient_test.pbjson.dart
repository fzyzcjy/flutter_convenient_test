///
//  Generated code. Do not modify.
//  source: convenient_test.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use logEntryTypeDescriptor instead')
const LogEntryType$json = const {
  '1': 'LogEntryType',
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

/// Descriptor for `LogEntryType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List logEntryTypeDescriptor = $convert.base64Decode(
    'CgxMb2dFbnRyeVR5cGUSCwoHSU5WQUxJRBAAEhMKD0dFTkVSQUxfTUVTU0FHRRABEg4KClRFU1RfU1RBUlQQAhINCglURVNUX0JPRFkQAxIMCghURVNUX0VORBAEEgoKBkFTU0VSVBAFEg8KC0FTU0VSVF9GQUlMEAYSCwoHU0VDVElPThAH');
@$core.Deprecated('Use logEntryDescriptor instead')
const LogEntry$json = const {
  '1': 'LogEntry',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 5, '10': 'id'},
    const {'1': 'test_group_name', '3': 2, '4': 1, '5': 9, '10': 'testGroupName'},
    const {'1': 'test_entry_name', '3': 3, '4': 1, '5': 9, '10': 'testEntryName'},
    const {'1': 'type', '3': 6, '4': 1, '5': 14, '6': '.LogEntryType', '10': 'type'},
    const {'1': 'title', '3': 5, '4': 1, '5': 9, '10': 'title'},
    const {'1': 'message', '3': 4, '4': 1, '5': 9, '10': 'message'},
    const {'1': 'error', '3': 7, '4': 1, '5': 9, '10': 'error'},
    const {'1': 'stack_trace', '3': 8, '4': 1, '5': 9, '10': 'stackTrace'},
  ],
};

/// Descriptor for `LogEntry`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List logEntryDescriptor = $convert.base64Decode(
    'CghMb2dFbnRyeRIOCgJpZBgBIAEoBVICaWQSJgoPdGVzdF9ncm91cF9uYW1lGAIgASgJUg10ZXN0R3JvdXBOYW1lEiYKD3Rlc3RfZW50cnlfbmFtZRgDIAEoCVINdGVzdEVudHJ5TmFtZRIhCgR0eXBlGAYgASgOMg0uTG9nRW50cnlUeXBlUgR0eXBlEhQKBXRpdGxlGAUgASgJUgV0aXRsZRIYCgdtZXNzYWdlGAQgASgJUgdtZXNzYWdlEhQKBWVycm9yGAcgASgJUgVlcnJvchIfCgtzdGFja190cmFjZRgIIAEoCVIKc3RhY2tUcmFjZQ==');
@$core.Deprecated('Use testInfoPackDescriptor instead')
const TestInfoPack$json = const {
  '1': 'TestInfoPack',
  '2': const [
    const {'1': 'entries', '3': 1, '4': 3, '5': 11, '6': '.TestEntryInfo', '10': 'entries'},
  ],
};

/// Descriptor for `TestInfoPack`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List testInfoPackDescriptor =
    $convert.base64Decode('CgxUZXN0SW5mb1BhY2sSKAoHZW50cmllcxgBIAMoCzIOLlRlc3RFbnRyeUluZm9SB2VudHJpZXM=');
@$core.Deprecated('Use testEntryInfoDescriptor instead')
const TestEntryInfo$json = const {
  '1': 'TestEntryInfo',
  '2': const [
    const {'1': 'test_group_name', '3': 1, '4': 1, '5': 9, '10': 'testGroupName'},
    const {'1': 'test_entry_name', '3': 2, '4': 1, '5': 9, '10': 'testEntryName'},
  ],
};

/// Descriptor for `TestEntryInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List testEntryInfoDescriptor = $convert.base64Decode(
    'Cg1UZXN0RW50cnlJbmZvEiYKD3Rlc3RfZ3JvdXBfbmFtZRgBIAEoCVINdGVzdEdyb3VwTmFtZRImCg90ZXN0X2VudHJ5X25hbWUYAiABKAlSDXRlc3RFbnRyeU5hbWU=');
@$core.Deprecated('Use runnerStateChangeDescriptor instead')
const RunnerStateChange$json = const {
  '1': 'RunnerStateChange',
  '2': const [
    const {'1': 'test_entry_name', '3': 1, '4': 1, '5': 9, '10': 'testEntryName'},
    const {'1': 'state', '3': 2, '4': 1, '5': 11, '6': '.TestEntryState', '10': 'state'},
  ],
};

/// Descriptor for `RunnerStateChange`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List runnerStateChangeDescriptor = $convert.base64Decode(
    'ChFSdW5uZXJTdGF0ZUNoYW5nZRImCg90ZXN0X2VudHJ5X25hbWUYASABKAlSDXRlc3RFbnRyeU5hbWUSJQoFc3RhdGUYAiABKAsyDy5UZXN0RW50cnlTdGF0ZVIFc3RhdGU=');
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
    const {'1': 'test_entry_name', '3': 1, '4': 1, '5': 9, '10': 'testEntryName'},
    const {'1': 'error', '3': 2, '4': 1, '5': 9, '10': 'error'},
    const {'1': 'stack_trace', '3': 3, '4': 1, '5': 9, '10': 'stackTrace'},
  ],
};

/// Descriptor for `RunnerError`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List runnerErrorDescriptor = $convert.base64Decode(
    'CgtSdW5uZXJFcnJvchImCg90ZXN0X2VudHJ5X25hbWUYASABKAlSDXRlc3RFbnRyeU5hbWUSFAoFZXJyb3IYAiABKAlSBWVycm9yEh8KC3N0YWNrX3RyYWNlGAMgASgJUgpzdGFja1RyYWNl');
@$core.Deprecated('Use runnerMessageDescriptor instead')
const RunnerMessage$json = const {
  '1': 'RunnerMessage',
  '2': const [
    const {'1': 'test_entry_name', '3': 1, '4': 1, '5': 9, '10': 'testEntryName'},
    const {'1': 'message', '3': 2, '4': 1, '5': 9, '10': 'message'},
  ],
};

/// Descriptor for `RunnerMessage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List runnerMessageDescriptor = $convert.base64Decode(
    'Cg1SdW5uZXJNZXNzYWdlEiYKD3Rlc3RfZW50cnlfbmFtZRgBIAEoCVINdGVzdEVudHJ5TmFtZRIYCgdtZXNzYWdlGAIgASgJUgdtZXNzYWdl');
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
  ],
};

/// Descriptor for `WorkerModeIntegrationTest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List workerModeIntegrationTestDescriptor = $convert
    .base64Decode('ChlXb3JrZXJNb2RlSW50ZWdyYXRpb25UZXN0EioKEWZpbHRlcl9uYW1lX3JlZ2V4GAEgASgJUg9maWx0ZXJOYW1lUmVnZXg=');
@$core.Deprecated('Use managerToWorkerActionDescriptor instead')
const ManagerToWorkerAction$json = const {
  '1': 'ManagerToWorkerAction',
};

/// Descriptor for `ManagerToWorkerAction`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List managerToWorkerActionDescriptor = $convert.base64Decode('ChVNYW5hZ2VyVG9Xb3JrZXJBY3Rpb24=');
@$core.Deprecated('Use emptyDescriptor instead')
const Empty$json = const {
  '1': 'Empty',
};

/// Descriptor for `Empty`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List emptyDescriptor = $convert.base64Decode('CgVFbXB0eQ==');
