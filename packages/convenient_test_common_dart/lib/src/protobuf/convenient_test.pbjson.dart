// This is a generated file - do not edit.
//
// Generated from convenient_test.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports
// ignore_for_file: unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use logSubEntryTypeDescriptor instead')
const LogSubEntryType$json = {
  '1': 'LogSubEntryType',
  '2': [
    {'1': 'INVALID', '2': 0},
    {'1': 'GENERAL_MESSAGE', '2': 1},
    {'1': 'TEST_START', '2': 2},
    {'1': 'TEST_BODY', '2': 3},
    {'1': 'TEST_END', '2': 4},
    {'1': 'ASSERT', '2': 5},
    {'1': 'ASSERT_FAIL', '2': 6},
    {'1': 'SECTION', '2': 7},
  ],
};

/// Descriptor for `LogSubEntryType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List logSubEntryTypeDescriptor =
    $convert.base64Decode('Cg9Mb2dTdWJFbnRyeVR5cGUSCwoHSU5WQUxJRBAAEhMKD0dFTkVSQUxfTUVTU0FHRRABEg4KCl'
        'RFU1RfU1RBUlQQAhINCglURVNUX0JPRFkQAxIMCghURVNUX0VORBAEEgoKBkFTU0VSVBAFEg8K'
        'C0FTU0VSVF9GQUlMEAYSCwoHU0VDVElPThAH');

@$core.Deprecated('Use reportCollectionDescriptor instead')
const ReportCollection$json = {
  '1': 'ReportCollection',
  '2': [
    {'1': 'items', '3': 1, '4': 3, '5': 11, '6': '.ReportItem', '10': 'items'},
  ],
};

/// Descriptor for `ReportCollection`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List reportCollectionDescriptor =
    $convert.base64Decode('ChBSZXBvcnRDb2xsZWN0aW9uEiEKBWl0ZW1zGAEgAygLMgsuUmVwb3J0SXRlbVIFaXRlbXM=');

@$core.Deprecated('Use reportItemDescriptor instead')
const ReportItem$json = {
  '1': 'ReportItem',
  '2': [
    {'1': 'set_up_all', '3': 7, '4': 1, '5': 11, '6': '.SetUpAll', '9': 0, '10': 'setUpAll'},
    {'1': 'tear_down_all', '3': 8, '4': 1, '5': 11, '6': '.TearDownAll', '9': 0, '10': 'tearDownAll'},
    {'1': 'suite_info_proto', '3': 1, '4': 1, '5': 11, '6': '.SuiteInfoProto', '9': 0, '10': 'suiteInfoProto'},
    {'1': 'log_entry', '3': 2, '4': 1, '5': 11, '6': '.LogEntry', '9': 0, '10': 'logEntry'},
    {'1': 'runner_state_change', '3': 3, '4': 1, '5': 11, '6': '.RunnerStateChange', '9': 0, '10': 'runnerStateChange'},
    {'1': 'runner_error', '3': 4, '4': 1, '5': 11, '6': '.RunnerError', '9': 0, '10': 'runnerError'},
    {'1': 'runner_message', '3': 5, '4': 1, '5': 11, '6': '.RunnerMessage', '9': 0, '10': 'runnerMessage'},
    {'1': 'snapshot', '3': 6, '4': 1, '5': 11, '6': '.Snapshot', '9': 0, '10': 'snapshot'},
  ],
  '8': [
    {'1': 'sub_type'},
  ],
};

/// Descriptor for `ReportItem`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List reportItemDescriptor =
    $convert.base64Decode('CgpSZXBvcnRJdGVtEikKCnNldF91cF9hbGwYByABKAsyCS5TZXRVcEFsbEgAUghzZXRVcEFsbB'
        'IyCg10ZWFyX2Rvd25fYWxsGAggASgLMgwuVGVhckRvd25BbGxIAFILdGVhckRvd25BbGwSOwoQ'
        'c3VpdGVfaW5mb19wcm90bxgBIAEoCzIPLlN1aXRlSW5mb1Byb3RvSABSDnN1aXRlSW5mb1Byb3'
        'RvEigKCWxvZ19lbnRyeRgCIAEoCzIJLkxvZ0VudHJ5SABSCGxvZ0VudHJ5EkQKE3J1bm5lcl9z'
        'dGF0ZV9jaGFuZ2UYAyABKAsyEi5SdW5uZXJTdGF0ZUNoYW5nZUgAUhFydW5uZXJTdGF0ZUNoYW'
        '5nZRIxCgxydW5uZXJfZXJyb3IYBCABKAsyDC5SdW5uZXJFcnJvckgAUgtydW5uZXJFcnJvchI3'
        'Cg5ydW5uZXJfbWVzc2FnZRgFIAEoCzIOLlJ1bm5lck1lc3NhZ2VIAFINcnVubmVyTWVzc2FnZR'
        'InCghzbmFwc2hvdBgGIAEoCzIJLlNuYXBzaG90SABSCHNuYXBzaG90QgoKCHN1Yl90eXBl');

@$core.Deprecated('Use setUpAllDescriptor instead')
const SetUpAll$json = {
  '1': 'SetUpAll',
};

/// Descriptor for `SetUpAll`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List setUpAllDescriptor = $convert.base64Decode('CghTZXRVcEFsbA==');

@$core.Deprecated('Use tearDownAllDescriptor instead')
const TearDownAll$json = {
  '1': 'TearDownAll',
  '2': [
    {
      '1': 'resolved_execution_filter',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.ResolvedExecutionFilterProto',
      '10': 'resolvedExecutionFilter'
    },
  ],
};

/// Descriptor for `TearDownAll`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List tearDownAllDescriptor =
    $convert.base64Decode('CgtUZWFyRG93bkFsbBJZChlyZXNvbHZlZF9leGVjdXRpb25fZmlsdGVyGAEgASgLMh0uUmVzb2'
        'x2ZWRFeGVjdXRpb25GaWx0ZXJQcm90b1IXcmVzb2x2ZWRFeGVjdXRpb25GaWx0ZXI=');

@$core.Deprecated('Use logEntryDescriptor instead')
const LogEntry$json = {
  '1': 'LogEntry',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 3, '10': 'id'},
    {'1': 'test_name', '3': 2, '4': 1, '5': 9, '10': 'testName'},
    {'1': 'sub_entries', '3': 3, '4': 3, '5': 11, '6': '.LogSubEntry', '10': 'subEntries'},
  ],
};

/// Descriptor for `LogEntry`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List logEntryDescriptor =
    $convert.base64Decode('CghMb2dFbnRyeRIOCgJpZBgBIAEoA1ICaWQSGwoJdGVzdF9uYW1lGAIgASgJUgh0ZXN0TmFtZR'
        'ItCgtzdWJfZW50cmllcxgDIAMoCzIMLkxvZ1N1YkVudHJ5UgpzdWJFbnRyaWVz');

@$core.Deprecated('Use logSubEntryDescriptor instead')
const LogSubEntry$json = {
  '1': 'LogSubEntry',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 3, '10': 'id'},
    {'1': 'time', '3': 2, '4': 1, '5': 3, '10': 'time'},
    {'1': 'type', '3': 3, '4': 1, '5': 14, '6': '.LogSubEntryType', '10': 'type'},
    {'1': 'title', '3': 4, '4': 1, '5': 9, '10': 'title'},
    {'1': 'message', '3': 5, '4': 1, '5': 9, '10': 'message'},
    {'1': 'error', '3': 6, '4': 1, '5': 9, '10': 'error'},
    {'1': 'stack_trace', '3': 7, '4': 1, '5': 9, '10': 'stackTrace'},
  ],
};

/// Descriptor for `LogSubEntry`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List logSubEntryDescriptor =
    $convert.base64Decode('CgtMb2dTdWJFbnRyeRIOCgJpZBgBIAEoA1ICaWQSEgoEdGltZRgCIAEoA1IEdGltZRIkCgR0eX'
        'BlGAMgASgOMhAuTG9nU3ViRW50cnlUeXBlUgR0eXBlEhQKBXRpdGxlGAQgASgJUgV0aXRsZRIY'
        'CgdtZXNzYWdlGAUgASgJUgdtZXNzYWdlEhQKBWVycm9yGAYgASgJUgVlcnJvchIfCgtzdGFja1'
        '90cmFjZRgHIAEoCVIKc3RhY2tUcmFjZQ==');

@$core.Deprecated('Use suiteInfoProtoDescriptor instead')
const SuiteInfoProto$json = {
  '1': 'SuiteInfoProto',
  '2': [
    {'1': 'group_id', '3': 1, '4': 1, '5': 3, '10': 'groupId'},
    {'1': 'groups', '3': 2, '4': 3, '5': 11, '6': '.GroupInfoProto', '10': 'groups'},
    {'1': 'tests', '3': 3, '4': 3, '5': 11, '6': '.TestInfoProto', '10': 'tests'},
  ],
};

/// Descriptor for `SuiteInfoProto`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List suiteInfoProtoDescriptor =
    $convert.base64Decode('Cg5TdWl0ZUluZm9Qcm90bxIZCghncm91cF9pZBgBIAEoA1IHZ3JvdXBJZBInCgZncm91cHMYAi'
        'ADKAsyDy5Hcm91cEluZm9Qcm90b1IGZ3JvdXBzEiQKBXRlc3RzGAMgAygLMg4uVGVzdEluZm9Q'
        'cm90b1IFdGVzdHM=');

@$core.Deprecated('Use groupInfoProtoDescriptor instead')
const GroupInfoProto$json = {
  '1': 'GroupInfoProto',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 3, '10': 'id'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    {'1': 'parent_id', '3': 3, '4': 1, '5': 3, '10': 'parentId'},
    {'1': 'entry_ids', '3': 4, '4': 3, '5': 3, '10': 'entryIds'},
  ],
};

/// Descriptor for `GroupInfoProto`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List groupInfoProtoDescriptor =
    $convert.base64Decode('Cg5Hcm91cEluZm9Qcm90bxIOCgJpZBgBIAEoA1ICaWQSEgoEbmFtZRgCIAEoCVIEbmFtZRIbCg'
        'lwYXJlbnRfaWQYAyABKANSCHBhcmVudElkEhsKCWVudHJ5X2lkcxgEIAMoA1IIZW50cnlJZHM=');

@$core.Deprecated('Use testInfoProtoDescriptor instead')
const TestInfoProto$json = {
  '1': 'TestInfoProto',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 3, '10': 'id'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    {'1': 'parent_id', '3': 3, '4': 1, '5': 3, '10': 'parentId'},
  ],
};

/// Descriptor for `TestInfoProto`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List testInfoProtoDescriptor =
    $convert.base64Decode('Cg1UZXN0SW5mb1Byb3RvEg4KAmlkGAEgASgDUgJpZBISCgRuYW1lGAIgASgJUgRuYW1lEhsKCX'
        'BhcmVudF9pZBgDIAEoA1IIcGFyZW50SWQ=');

@$core.Deprecated('Use runnerStateChangeDescriptor instead')
const RunnerStateChange$json = {
  '1': 'RunnerStateChange',
  '2': [
    {'1': 'test_name', '3': 1, '4': 1, '5': 9, '10': 'testName'},
    {'1': 'state', '3': 2, '4': 1, '5': 11, '6': '.TestEntryState', '10': 'state'},
  ],
};

/// Descriptor for `RunnerStateChange`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List runnerStateChangeDescriptor =
    $convert.base64Decode('ChFSdW5uZXJTdGF0ZUNoYW5nZRIbCgl0ZXN0X25hbWUYASABKAlSCHRlc3ROYW1lEiUKBXN0YX'
        'RlGAIgASgLMg8uVGVzdEVudHJ5U3RhdGVSBXN0YXRl');

@$core.Deprecated('Use testEntryStateDescriptor instead')
const TestEntryState$json = {
  '1': 'TestEntryState',
  '2': [
    {'1': 'status', '3': 1, '4': 1, '5': 9, '10': 'status'},
    {'1': 'result', '3': 2, '4': 1, '5': 9, '10': 'result'},
  ],
};

/// Descriptor for `TestEntryState`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List testEntryStateDescriptor =
    $convert.base64Decode('Cg5UZXN0RW50cnlTdGF0ZRIWCgZzdGF0dXMYASABKAlSBnN0YXR1cxIWCgZyZXN1bHQYAiABKA'
        'lSBnJlc3VsdA==');

@$core.Deprecated('Use runnerErrorDescriptor instead')
const RunnerError$json = {
  '1': 'RunnerError',
  '2': [
    {'1': 'test_name', '3': 1, '4': 1, '5': 9, '10': 'testName'},
    {'1': 'error', '3': 2, '4': 1, '5': 9, '10': 'error'},
    {'1': 'stack_trace', '3': 3, '4': 1, '5': 9, '10': 'stackTrace'},
  ],
};

/// Descriptor for `RunnerError`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List runnerErrorDescriptor =
    $convert.base64Decode('CgtSdW5uZXJFcnJvchIbCgl0ZXN0X25hbWUYASABKAlSCHRlc3ROYW1lEhQKBWVycm9yGAIgAS'
        'gJUgVlcnJvchIfCgtzdGFja190cmFjZRgDIAEoCVIKc3RhY2tUcmFjZQ==');

@$core.Deprecated('Use runnerMessageDescriptor instead')
const RunnerMessage$json = {
  '1': 'RunnerMessage',
  '2': [
    {'1': 'test_name', '3': 1, '4': 1, '5': 9, '10': 'testName'},
    {'1': 'message', '3': 2, '4': 1, '5': 9, '10': 'message'},
  ],
};

/// Descriptor for `RunnerMessage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List runnerMessageDescriptor =
    $convert.base64Decode('Cg1SdW5uZXJNZXNzYWdlEhsKCXRlc3RfbmFtZRgBIAEoCVIIdGVzdE5hbWUSGAoHbWVzc2FnZR'
        'gCIAEoCVIHbWVzc2FnZQ==');

@$core.Deprecated('Use snapshotDescriptor instead')
const Snapshot$json = {
  '1': 'Snapshot',
  '2': [
    {'1': 'log_entry_id', '3': 1, '4': 1, '5': 3, '10': 'logEntryId'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    {'1': 'image', '3': 3, '4': 1, '5': 12, '10': 'image'},
  ],
};

/// Descriptor for `Snapshot`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List snapshotDescriptor =
    $convert.base64Decode('CghTbmFwc2hvdBIgCgxsb2dfZW50cnlfaWQYASABKANSCmxvZ0VudHJ5SWQSEgoEbmFtZRgCIA'
        'EoCVIEbmFtZRIUCgVpbWFnZRgDIAEoDFIFaW1hZ2U=');

@$core.Deprecated('Use workerCurrentRunConfigDescriptor instead')
const WorkerCurrentRunConfig$json = {
  '1': 'WorkerCurrentRunConfig',
  '2': [
    {
      '1': 'interactive_app',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.WorkerCurrentRunConfig.InteractiveApp',
      '9': 0,
      '10': 'interactiveApp'
    },
    {
      '1': 'integration_test',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.WorkerCurrentRunConfig.IntegrationTest',
      '9': 0,
      '10': 'integrationTest'
    },
  ],
  '3': [WorkerCurrentRunConfig_InteractiveApp$json, WorkerCurrentRunConfig_IntegrationTest$json],
  '8': [
    {'1': 'sub_type'},
  ],
};

@$core.Deprecated('Use workerCurrentRunConfigDescriptor instead')
const WorkerCurrentRunConfig_InteractiveApp$json = {
  '1': 'InteractiveApp',
};

@$core.Deprecated('Use workerCurrentRunConfigDescriptor instead')
const WorkerCurrentRunConfig_IntegrationTest$json = {
  '1': 'IntegrationTest',
  '2': [
    {'1': 'report_suite_info', '3': 1, '4': 1, '5': 8, '10': 'reportSuiteInfo'},
    {'1': 'default_retry_count', '3': 3, '4': 1, '5': 5, '10': 'defaultRetryCount'},
    {'1': 'execution_filter', '3': 2, '4': 1, '5': 11, '6': '.ExecutionFilter', '10': 'executionFilter'},
    {'1': 'auto_update_golden_files', '3': 4, '4': 1, '5': 8, '10': 'autoUpdateGoldenFiles'},
  ],
};

/// Descriptor for `WorkerCurrentRunConfig`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List workerCurrentRunConfigDescriptor =
    $convert.base64Decode('ChZXb3JrZXJDdXJyZW50UnVuQ29uZmlnElEKD2ludGVyYWN0aXZlX2FwcBgBIAEoCzImLldvcm'
        'tlckN1cnJlbnRSdW5Db25maWcuSW50ZXJhY3RpdmVBcHBIAFIOaW50ZXJhY3RpdmVBcHASVAoQ'
        'aW50ZWdyYXRpb25fdGVzdBgCIAEoCzInLldvcmtlckN1cnJlbnRSdW5Db25maWcuSW50ZWdyYX'
        'Rpb25UZXN0SABSD2ludGVncmF0aW9uVGVzdBoQCg5JbnRlcmFjdGl2ZUFwcBrjAQoPSW50ZWdy'
        'YXRpb25UZXN0EioKEXJlcG9ydF9zdWl0ZV9pbmZvGAEgASgIUg9yZXBvcnRTdWl0ZUluZm8SLg'
        'oTZGVmYXVsdF9yZXRyeV9jb3VudBgDIAEoBVIRZGVmYXVsdFJldHJ5Q291bnQSOwoQZXhlY3V0'
        'aW9uX2ZpbHRlchgCIAEoCzIQLkV4ZWN1dGlvbkZpbHRlclIPZXhlY3V0aW9uRmlsdGVyEjcKGG'
        'F1dG9fdXBkYXRlX2dvbGRlbl9maWxlcxgEIAEoCFIVYXV0b1VwZGF0ZUdvbGRlbkZpbGVzQgoK'
        'CHN1Yl90eXBl');

@$core.Deprecated('Use executionFilterDescriptor instead')
const ExecutionFilter$json = {
  '1': 'ExecutionFilter',
  '2': [
    {'1': 'filter_name_regex', '3': 1, '4': 1, '5': 9, '10': 'filterNameRegex'},
    {'1': 'strategy', '3': 2, '4': 1, '5': 11, '6': '.ExecutionFilter.Strategy', '10': 'strategy'},
  ],
  '3': [ExecutionFilter_Strategy$json],
};

@$core.Deprecated('Use executionFilterDescriptor instead')
const ExecutionFilter_Strategy$json = {
  '1': 'Strategy',
  '2': [
    {
      '1': 'first_match',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.ExecutionFilter.Strategy.FirstMatch',
      '9': 0,
      '10': 'firstMatch'
    },
    {'1': 'next_match', '3': 2, '4': 1, '5': 11, '6': '.ExecutionFilter.Strategy.NextMatch', '9': 0, '10': 'nextMatch'},
    {'1': 'all_match', '3': 3, '4': 1, '5': 11, '6': '.ExecutionFilter.Strategy.AllMatch', '9': 0, '10': 'allMatch'},
  ],
  '3': [
    ExecutionFilter_Strategy_FirstMatch$json,
    ExecutionFilter_Strategy_NextMatch$json,
    ExecutionFilter_Strategy_AllMatch$json
  ],
  '8': [
    {'1': 'sub_type'},
  ],
};

@$core.Deprecated('Use executionFilterDescriptor instead')
const ExecutionFilter_Strategy_FirstMatch$json = {
  '1': 'FirstMatch',
};

@$core.Deprecated('Use executionFilterDescriptor instead')
const ExecutionFilter_Strategy_NextMatch$json = {
  '1': 'NextMatch',
  '2': [
    {'1': 'prev_test_name', '3': 1, '4': 1, '5': 9, '10': 'prevTestName'},
  ],
};

@$core.Deprecated('Use executionFilterDescriptor instead')
const ExecutionFilter_Strategy_AllMatch$json = {
  '1': 'AllMatch',
};

/// Descriptor for `ExecutionFilter`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List executionFilterDescriptor =
    $convert.base64Decode('Cg9FeGVjdXRpb25GaWx0ZXISKgoRZmlsdGVyX25hbWVfcmVnZXgYASABKAlSD2ZpbHRlck5hbW'
        'VSZWdleBI1CghzdHJhdGVneRgCIAEoCzIZLkV4ZWN1dGlvbkZpbHRlci5TdHJhdGVneVIIc3Ry'
        'YXRlZ3katQIKCFN0cmF0ZWd5EkcKC2ZpcnN0X21hdGNoGAEgASgLMiQuRXhlY3V0aW9uRmlsdG'
        'VyLlN0cmF0ZWd5LkZpcnN0TWF0Y2hIAFIKZmlyc3RNYXRjaBJECgpuZXh0X21hdGNoGAIgASgL'
        'MiMuRXhlY3V0aW9uRmlsdGVyLlN0cmF0ZWd5Lk5leHRNYXRjaEgAUgluZXh0TWF0Y2gSQQoJYW'
        'xsX21hdGNoGAMgASgLMiIuRXhlY3V0aW9uRmlsdGVyLlN0cmF0ZWd5LkFsbE1hdGNoSABSCGFs'
        'bE1hdGNoGgwKCkZpcnN0TWF0Y2gaMQoJTmV4dE1hdGNoEiQKDnByZXZfdGVzdF9uYW1lGAEgAS'
        'gJUgxwcmV2VGVzdE5hbWUaCgoIQWxsTWF0Y2hCCgoIc3ViX3R5cGU=');

@$core.Deprecated('Use resolvedExecutionFilterProtoDescriptor instead')
const ResolvedExecutionFilterProto$json = {
  '1': 'ResolvedExecutionFilterProto',
  '2': [
    {'1': 'allow_execute_test_names', '3': 1, '4': 3, '5': 9, '10': 'allowExecuteTestNames'},
  ],
};

/// Descriptor for `ResolvedExecutionFilterProto`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List resolvedExecutionFilterProtoDescriptor =
    $convert.base64Decode('ChxSZXNvbHZlZEV4ZWN1dGlvbkZpbHRlclByb3RvEjcKGGFsbG93X2V4ZWN1dGVfdGVzdF9uYW'
        '1lcxgBIAMoCVIVYWxsb3dFeGVjdXRlVGVzdE5hbWVz');

@$core.Deprecated('Use emptyDescriptor instead')
const Empty$json = {
  '1': 'Empty',
};

/// Descriptor for `Empty`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List emptyDescriptor = $convert.base64Decode('CgVFbXB0eQ==');
