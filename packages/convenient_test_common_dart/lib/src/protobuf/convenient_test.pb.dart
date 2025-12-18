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

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'convenient_test.pbenum.dart';

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

export 'convenient_test.pbenum.dart';

class ReportCollection extends $pb.GeneratedMessage {
  factory ReportCollection({
    $core.Iterable<ReportItem>? items,
  }) {
    final result = create();
    if (items != null) result.items.addAll(items);
    return result;
  }

  ReportCollection._();

  factory ReportCollection.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ReportCollection.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ReportCollection',
      createEmptyInstance: create)
    ..pPM<ReportItem>(1, _omitFieldNames ? '' : 'items',
        subBuilder: ReportItem.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ReportCollection clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ReportCollection copyWith(void Function(ReportCollection) updates) =>
      super.copyWith((message) => updates(message as ReportCollection))
          as ReportCollection;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ReportCollection create() => ReportCollection._();
  @$core.override
  ReportCollection createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ReportCollection getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ReportCollection>(create);
  static ReportCollection? _defaultInstance;

  /// use "repeated" + single-field, thus can concat multiple ReportCollection together
  @$pb.TagNumber(1)
  $pb.PbList<ReportItem> get items => $_getList(0);
}

enum ReportItem_SubType {
  suiteInfoProto,
  logEntry,
  runnerStateChange,
  runnerError,
  runnerMessage,
  snapshot,
  setUpAll,
  tearDownAll,
  notSet
}

class ReportItem extends $pb.GeneratedMessage {
  factory ReportItem({
    SuiteInfoProto? suiteInfoProto,
    LogEntry? logEntry,
    RunnerStateChange? runnerStateChange,
    RunnerError? runnerError,
    RunnerMessage? runnerMessage,
    Snapshot? snapshot,
    SetUpAll? setUpAll,
    TearDownAll? tearDownAll,
  }) {
    final result = create();
    if (suiteInfoProto != null) result.suiteInfoProto = suiteInfoProto;
    if (logEntry != null) result.logEntry = logEntry;
    if (runnerStateChange != null) result.runnerStateChange = runnerStateChange;
    if (runnerError != null) result.runnerError = runnerError;
    if (runnerMessage != null) result.runnerMessage = runnerMessage;
    if (snapshot != null) result.snapshot = snapshot;
    if (setUpAll != null) result.setUpAll = setUpAll;
    if (tearDownAll != null) result.tearDownAll = tearDownAll;
    return result;
  }

  ReportItem._();

  factory ReportItem.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ReportItem.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static const $core.Map<$core.int, ReportItem_SubType>
      _ReportItem_SubTypeByTag = {
    1: ReportItem_SubType.suiteInfoProto,
    2: ReportItem_SubType.logEntry,
    3: ReportItem_SubType.runnerStateChange,
    4: ReportItem_SubType.runnerError,
    5: ReportItem_SubType.runnerMessage,
    6: ReportItem_SubType.snapshot,
    7: ReportItem_SubType.setUpAll,
    8: ReportItem_SubType.tearDownAll,
    0: ReportItem_SubType.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ReportItem',
      createEmptyInstance: create)
    ..oo(0, [1, 2, 3, 4, 5, 6, 7, 8])
    ..aOM<SuiteInfoProto>(1, _omitFieldNames ? '' : 'suiteInfoProto',
        subBuilder: SuiteInfoProto.create)
    ..aOM<LogEntry>(2, _omitFieldNames ? '' : 'logEntry',
        subBuilder: LogEntry.create)
    ..aOM<RunnerStateChange>(3, _omitFieldNames ? '' : 'runnerStateChange',
        subBuilder: RunnerStateChange.create)
    ..aOM<RunnerError>(4, _omitFieldNames ? '' : 'runnerError',
        subBuilder: RunnerError.create)
    ..aOM<RunnerMessage>(5, _omitFieldNames ? '' : 'runnerMessage',
        subBuilder: RunnerMessage.create)
    ..aOM<Snapshot>(6, _omitFieldNames ? '' : 'snapshot',
        subBuilder: Snapshot.create)
    ..aOM<SetUpAll>(7, _omitFieldNames ? '' : 'setUpAll',
        subBuilder: SetUpAll.create)
    ..aOM<TearDownAll>(8, _omitFieldNames ? '' : 'tearDownAll',
        subBuilder: TearDownAll.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ReportItem clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ReportItem copyWith(void Function(ReportItem) updates) =>
      super.copyWith((message) => updates(message as ReportItem)) as ReportItem;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ReportItem create() => ReportItem._();
  @$core.override
  ReportItem createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ReportItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ReportItem>(create);
  static ReportItem? _defaultInstance;

  @$pb.TagNumber(1)
  @$pb.TagNumber(2)
  @$pb.TagNumber(3)
  @$pb.TagNumber(4)
  @$pb.TagNumber(5)
  @$pb.TagNumber(6)
  @$pb.TagNumber(7)
  @$pb.TagNumber(8)
  ReportItem_SubType whichSubType() =>
      _ReportItem_SubTypeByTag[$_whichOneof(0)]!;
  @$pb.TagNumber(1)
  @$pb.TagNumber(2)
  @$pb.TagNumber(3)
  @$pb.TagNumber(4)
  @$pb.TagNumber(5)
  @$pb.TagNumber(6)
  @$pb.TagNumber(7)
  @$pb.TagNumber(8)
  void clearSubType() => $_clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  SuiteInfoProto get suiteInfoProto => $_getN(0);
  @$pb.TagNumber(1)
  set suiteInfoProto(SuiteInfoProto value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasSuiteInfoProto() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuiteInfoProto() => $_clearField(1);
  @$pb.TagNumber(1)
  SuiteInfoProto ensureSuiteInfoProto() => $_ensure(0);

  @$pb.TagNumber(2)
  LogEntry get logEntry => $_getN(1);
  @$pb.TagNumber(2)
  set logEntry(LogEntry value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasLogEntry() => $_has(1);
  @$pb.TagNumber(2)
  void clearLogEntry() => $_clearField(2);
  @$pb.TagNumber(2)
  LogEntry ensureLogEntry() => $_ensure(1);

  @$pb.TagNumber(3)
  RunnerStateChange get runnerStateChange => $_getN(2);
  @$pb.TagNumber(3)
  set runnerStateChange(RunnerStateChange value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasRunnerStateChange() => $_has(2);
  @$pb.TagNumber(3)
  void clearRunnerStateChange() => $_clearField(3);
  @$pb.TagNumber(3)
  RunnerStateChange ensureRunnerStateChange() => $_ensure(2);

  @$pb.TagNumber(4)
  RunnerError get runnerError => $_getN(3);
  @$pb.TagNumber(4)
  set runnerError(RunnerError value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasRunnerError() => $_has(3);
  @$pb.TagNumber(4)
  void clearRunnerError() => $_clearField(4);
  @$pb.TagNumber(4)
  RunnerError ensureRunnerError() => $_ensure(3);

  @$pb.TagNumber(5)
  RunnerMessage get runnerMessage => $_getN(4);
  @$pb.TagNumber(5)
  set runnerMessage(RunnerMessage value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasRunnerMessage() => $_has(4);
  @$pb.TagNumber(5)
  void clearRunnerMessage() => $_clearField(5);
  @$pb.TagNumber(5)
  RunnerMessage ensureRunnerMessage() => $_ensure(4);

  @$pb.TagNumber(6)
  Snapshot get snapshot => $_getN(5);
  @$pb.TagNumber(6)
  set snapshot(Snapshot value) => $_setField(6, value);
  @$pb.TagNumber(6)
  $core.bool hasSnapshot() => $_has(5);
  @$pb.TagNumber(6)
  void clearSnapshot() => $_clearField(6);
  @$pb.TagNumber(6)
  Snapshot ensureSnapshot() => $_ensure(5);

  @$pb.TagNumber(7)
  SetUpAll get setUpAll => $_getN(6);
  @$pb.TagNumber(7)
  set setUpAll(SetUpAll value) => $_setField(7, value);
  @$pb.TagNumber(7)
  $core.bool hasSetUpAll() => $_has(6);
  @$pb.TagNumber(7)
  void clearSetUpAll() => $_clearField(7);
  @$pb.TagNumber(7)
  SetUpAll ensureSetUpAll() => $_ensure(6);

  @$pb.TagNumber(8)
  TearDownAll get tearDownAll => $_getN(7);
  @$pb.TagNumber(8)
  set tearDownAll(TearDownAll value) => $_setField(8, value);
  @$pb.TagNumber(8)
  $core.bool hasTearDownAll() => $_has(7);
  @$pb.TagNumber(8)
  void clearTearDownAll() => $_clearField(8);
  @$pb.TagNumber(8)
  TearDownAll ensureTearDownAll() => $_ensure(7);
}

class SetUpAll extends $pb.GeneratedMessage {
  factory SetUpAll() => create();

  SetUpAll._();

  factory SetUpAll.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SetUpAll.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SetUpAll',
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SetUpAll clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SetUpAll copyWith(void Function(SetUpAll) updates) =>
      super.copyWith((message) => updates(message as SetUpAll)) as SetUpAll;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SetUpAll create() => SetUpAll._();
  @$core.override
  SetUpAll createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SetUpAll getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SetUpAll>(create);
  static SetUpAll? _defaultInstance;
}

class TearDownAll extends $pb.GeneratedMessage {
  factory TearDownAll({
    ResolvedExecutionFilterProto? resolvedExecutionFilter,
  }) {
    final result = create();
    if (resolvedExecutionFilter != null)
      result.resolvedExecutionFilter = resolvedExecutionFilter;
    return result;
  }

  TearDownAll._();

  factory TearDownAll.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory TearDownAll.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'TearDownAll',
      createEmptyInstance: create)
    ..aOM<ResolvedExecutionFilterProto>(
        1, _omitFieldNames ? '' : 'resolvedExecutionFilter',
        subBuilder: ResolvedExecutionFilterProto.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TearDownAll clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TearDownAll copyWith(void Function(TearDownAll) updates) =>
      super.copyWith((message) => updates(message as TearDownAll))
          as TearDownAll;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TearDownAll create() => TearDownAll._();
  @$core.override
  TearDownAll createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static TearDownAll getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TearDownAll>(create);
  static TearDownAll? _defaultInstance;

  @$pb.TagNumber(1)
  ResolvedExecutionFilterProto get resolvedExecutionFilter => $_getN(0);
  @$pb.TagNumber(1)
  set resolvedExecutionFilter(ResolvedExecutionFilterProto value) =>
      $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasResolvedExecutionFilter() => $_has(0);
  @$pb.TagNumber(1)
  void clearResolvedExecutionFilter() => $_clearField(1);
  @$pb.TagNumber(1)
  ResolvedExecutionFilterProto ensureResolvedExecutionFilter() => $_ensure(0);
}

class LogEntry extends $pb.GeneratedMessage {
  factory LogEntry({
    $fixnum.Int64? id,
    $core.String? testName,
    $core.Iterable<LogSubEntry>? subEntries,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (testName != null) result.testName = testName;
    if (subEntries != null) result.subEntries.addAll(subEntries);
    return result;
  }

  LogEntry._();

  factory LogEntry.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory LogEntry.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'LogEntry',
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'testName')
    ..pPM<LogSubEntry>(3, _omitFieldNames ? '' : 'subEntries',
        subBuilder: LogSubEntry.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  LogEntry clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  LogEntry copyWith(void Function(LogEntry) updates) =>
      super.copyWith((message) => updates(message as LogEntry)) as LogEntry;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static LogEntry create() => LogEntry._();
  @$core.override
  LogEntry createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static LogEntry getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<LogEntry>(create);
  static LogEntry? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get testName => $_getSZ(1);
  @$pb.TagNumber(2)
  set testName($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasTestName() => $_has(1);
  @$pb.TagNumber(2)
  void clearTestName() => $_clearField(2);

  @$pb.TagNumber(3)
  $pb.PbList<LogSubEntry> get subEntries => $_getList(2);
}

class LogSubEntry extends $pb.GeneratedMessage {
  factory LogSubEntry({
    $fixnum.Int64? id,
    $fixnum.Int64? time,
    LogSubEntryType? type,
    $core.String? title,
    $core.String? message,
    $core.String? error,
    $core.String? stackTrace,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (time != null) result.time = time;
    if (type != null) result.type = type;
    if (title != null) result.title = title;
    if (message != null) result.message = message;
    if (error != null) result.error = error;
    if (stackTrace != null) result.stackTrace = stackTrace;
    return result;
  }

  LogSubEntry._();

  factory LogSubEntry.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory LogSubEntry.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'LogSubEntry',
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'id')
    ..aInt64(2, _omitFieldNames ? '' : 'time')
    ..aE<LogSubEntryType>(3, _omitFieldNames ? '' : 'type',
        enumValues: LogSubEntryType.values)
    ..aOS(4, _omitFieldNames ? '' : 'title')
    ..aOS(5, _omitFieldNames ? '' : 'message')
    ..aOS(6, _omitFieldNames ? '' : 'error')
    ..aOS(7, _omitFieldNames ? '' : 'stackTrace')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  LogSubEntry clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  LogSubEntry copyWith(void Function(LogSubEntry) updates) =>
      super.copyWith((message) => updates(message as LogSubEntry))
          as LogSubEntry;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static LogSubEntry create() => LogSubEntry._();
  @$core.override
  LogSubEntry createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static LogSubEntry getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<LogSubEntry>(create);
  static LogSubEntry? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get time => $_getI64(1);
  @$pb.TagNumber(2)
  set time($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasTime() => $_has(1);
  @$pb.TagNumber(2)
  void clearTime() => $_clearField(2);

  @$pb.TagNumber(3)
  LogSubEntryType get type => $_getN(2);
  @$pb.TagNumber(3)
  set type(LogSubEntryType value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasType() => $_has(2);
  @$pb.TagNumber(3)
  void clearType() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get title => $_getSZ(3);
  @$pb.TagNumber(4)
  set title($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasTitle() => $_has(3);
  @$pb.TagNumber(4)
  void clearTitle() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get message => $_getSZ(4);
  @$pb.TagNumber(5)
  set message($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasMessage() => $_has(4);
  @$pb.TagNumber(5)
  void clearMessage() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get error => $_getSZ(5);
  @$pb.TagNumber(6)
  set error($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasError() => $_has(5);
  @$pb.TagNumber(6)
  void clearError() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.String get stackTrace => $_getSZ(6);
  @$pb.TagNumber(7)
  set stackTrace($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasStackTrace() => $_has(6);
  @$pb.TagNumber(7)
  void clearStackTrace() => $_clearField(7);
}

/// mimic test_api :: Suite
class SuiteInfoProto extends $pb.GeneratedMessage {
  factory SuiteInfoProto({
    $fixnum.Int64? groupId,
    $core.Iterable<GroupInfoProto>? groups,
    $core.Iterable<TestInfoProto>? tests,
  }) {
    final result = create();
    if (groupId != null) result.groupId = groupId;
    if (groups != null) result.groups.addAll(groups);
    if (tests != null) result.tests.addAll(tests);
    return result;
  }

  SuiteInfoProto._();

  factory SuiteInfoProto.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SuiteInfoProto.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SuiteInfoProto',
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'groupId')
    ..pPM<GroupInfoProto>(2, _omitFieldNames ? '' : 'groups',
        subBuilder: GroupInfoProto.create)
    ..pPM<TestInfoProto>(3, _omitFieldNames ? '' : 'tests',
        subBuilder: TestInfoProto.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SuiteInfoProto clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SuiteInfoProto copyWith(void Function(SuiteInfoProto) updates) =>
      super.copyWith((message) => updates(message as SuiteInfoProto))
          as SuiteInfoProto;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SuiteInfoProto create() => SuiteInfoProto._();
  @$core.override
  SuiteInfoProto createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SuiteInfoProto getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SuiteInfoProto>(create);
  static SuiteInfoProto? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get groupId => $_getI64(0);
  @$pb.TagNumber(1)
  set groupId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasGroupId() => $_has(0);
  @$pb.TagNumber(1)
  void clearGroupId() => $_clearField(1);

  @$pb.TagNumber(2)
  $pb.PbList<GroupInfoProto> get groups => $_getList(1);

  @$pb.TagNumber(3)
  $pb.PbList<TestInfoProto> get tests => $_getList(2);
}

/// mimic test_api :: Group
class GroupInfoProto extends $pb.GeneratedMessage {
  factory GroupInfoProto({
    $fixnum.Int64? id,
    $core.String? name,
    $fixnum.Int64? parentId,
    $core.Iterable<$fixnum.Int64>? entryIds,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (name != null) result.name = name;
    if (parentId != null) result.parentId = parentId;
    if (entryIds != null) result.entryIds.addAll(entryIds);
    return result;
  }

  GroupInfoProto._();

  factory GroupInfoProto.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GroupInfoProto.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GroupInfoProto',
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aInt64(3, _omitFieldNames ? '' : 'parentId')
    ..p<$fixnum.Int64>(4, _omitFieldNames ? '' : 'entryIds', $pb.PbFieldType.K6)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GroupInfoProto clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GroupInfoProto copyWith(void Function(GroupInfoProto) updates) =>
      super.copyWith((message) => updates(message as GroupInfoProto))
          as GroupInfoProto;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GroupInfoProto create() => GroupInfoProto._();
  @$core.override
  GroupInfoProto createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GroupInfoProto getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GroupInfoProto>(create);
  static GroupInfoProto? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => $_clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get parentId => $_getI64(2);
  @$pb.TagNumber(3)
  set parentId($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasParentId() => $_has(2);
  @$pb.TagNumber(3)
  void clearParentId() => $_clearField(3);

  @$pb.TagNumber(4)
  $pb.PbList<$fixnum.Int64> get entryIds => $_getList(3);
}

/// mimic test_api :: Test
class TestInfoProto extends $pb.GeneratedMessage {
  factory TestInfoProto({
    $fixnum.Int64? id,
    $core.String? name,
    $fixnum.Int64? parentId,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (name != null) result.name = name;
    if (parentId != null) result.parentId = parentId;
    return result;
  }

  TestInfoProto._();

  factory TestInfoProto.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory TestInfoProto.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'TestInfoProto',
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aInt64(3, _omitFieldNames ? '' : 'parentId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TestInfoProto clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TestInfoProto copyWith(void Function(TestInfoProto) updates) =>
      super.copyWith((message) => updates(message as TestInfoProto))
          as TestInfoProto;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TestInfoProto create() => TestInfoProto._();
  @$core.override
  TestInfoProto createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static TestInfoProto getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TestInfoProto>(create);
  static TestInfoProto? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => $_clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get parentId => $_getI64(2);
  @$pb.TagNumber(3)
  set parentId($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasParentId() => $_has(2);
  @$pb.TagNumber(3)
  void clearParentId() => $_clearField(3);
}

class RunnerStateChange extends $pb.GeneratedMessage {
  factory RunnerStateChange({
    $core.String? testName,
    TestEntryState? state,
  }) {
    final result = create();
    if (testName != null) result.testName = testName;
    if (state != null) result.state = state;
    return result;
  }

  RunnerStateChange._();

  factory RunnerStateChange.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RunnerStateChange.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RunnerStateChange',
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'testName')
    ..aOM<TestEntryState>(2, _omitFieldNames ? '' : 'state',
        subBuilder: TestEntryState.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RunnerStateChange clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RunnerStateChange copyWith(void Function(RunnerStateChange) updates) =>
      super.copyWith((message) => updates(message as RunnerStateChange))
          as RunnerStateChange;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RunnerStateChange create() => RunnerStateChange._();
  @$core.override
  RunnerStateChange createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RunnerStateChange getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RunnerStateChange>(create);
  static RunnerStateChange? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get testName => $_getSZ(0);
  @$pb.TagNumber(1)
  set testName($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTestName() => $_has(0);
  @$pb.TagNumber(1)
  void clearTestName() => $_clearField(1);

  @$pb.TagNumber(2)
  TestEntryState get state => $_getN(1);
  @$pb.TagNumber(2)
  set state(TestEntryState value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasState() => $_has(1);
  @$pb.TagNumber(2)
  void clearState() => $_clearField(2);
  @$pb.TagNumber(2)
  TestEntryState ensureState() => $_ensure(1);
}

class TestEntryState extends $pb.GeneratedMessage {
  factory TestEntryState({
    $core.String? status,
    $core.String? result,
  }) {
    final result$ = create();
    if (status != null) result$.status = status;
    if (result != null) result$.result = result;
    return result$;
  }

  TestEntryState._();

  factory TestEntryState.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory TestEntryState.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'TestEntryState',
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'status')
    ..aOS(2, _omitFieldNames ? '' : 'result')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TestEntryState clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TestEntryState copyWith(void Function(TestEntryState) updates) =>
      super.copyWith((message) => updates(message as TestEntryState))
          as TestEntryState;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TestEntryState create() => TestEntryState._();
  @$core.override
  TestEntryState createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static TestEntryState getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TestEntryState>(create);
  static TestEntryState? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get status => $_getSZ(0);
  @$pb.TagNumber(1)
  set status($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasStatus() => $_has(0);
  @$pb.TagNumber(1)
  void clearStatus() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get result => $_getSZ(1);
  @$pb.TagNumber(2)
  set result($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasResult() => $_has(1);
  @$pb.TagNumber(2)
  void clearResult() => $_clearField(2);
}

class RunnerError extends $pb.GeneratedMessage {
  factory RunnerError({
    $core.String? testName,
    $core.String? error,
    $core.String? stackTrace,
  }) {
    final result = create();
    if (testName != null) result.testName = testName;
    if (error != null) result.error = error;
    if (stackTrace != null) result.stackTrace = stackTrace;
    return result;
  }

  RunnerError._();

  factory RunnerError.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RunnerError.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RunnerError',
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'testName')
    ..aOS(2, _omitFieldNames ? '' : 'error')
    ..aOS(3, _omitFieldNames ? '' : 'stackTrace')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RunnerError clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RunnerError copyWith(void Function(RunnerError) updates) =>
      super.copyWith((message) => updates(message as RunnerError))
          as RunnerError;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RunnerError create() => RunnerError._();
  @$core.override
  RunnerError createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RunnerError getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RunnerError>(create);
  static RunnerError? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get testName => $_getSZ(0);
  @$pb.TagNumber(1)
  set testName($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTestName() => $_has(0);
  @$pb.TagNumber(1)
  void clearTestName() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get error => $_getSZ(1);
  @$pb.TagNumber(2)
  set error($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasError() => $_has(1);
  @$pb.TagNumber(2)
  void clearError() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get stackTrace => $_getSZ(2);
  @$pb.TagNumber(3)
  set stackTrace($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasStackTrace() => $_has(2);
  @$pb.TagNumber(3)
  void clearStackTrace() => $_clearField(3);
}

class RunnerMessage extends $pb.GeneratedMessage {
  factory RunnerMessage({
    $core.String? testName,
    $core.String? message,
  }) {
    final result = create();
    if (testName != null) result.testName = testName;
    if (message != null) result.message = message;
    return result;
  }

  RunnerMessage._();

  factory RunnerMessage.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RunnerMessage.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RunnerMessage',
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'testName')
    ..aOS(2, _omitFieldNames ? '' : 'message')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RunnerMessage clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RunnerMessage copyWith(void Function(RunnerMessage) updates) =>
      super.copyWith((message) => updates(message as RunnerMessage))
          as RunnerMessage;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RunnerMessage create() => RunnerMessage._();
  @$core.override
  RunnerMessage createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RunnerMessage getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RunnerMessage>(create);
  static RunnerMessage? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get testName => $_getSZ(0);
  @$pb.TagNumber(1)
  set testName($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTestName() => $_has(0);
  @$pb.TagNumber(1)
  void clearTestName() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get message => $_getSZ(1);
  @$pb.TagNumber(2)
  set message($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearMessage() => $_clearField(2);
}

class Snapshot extends $pb.GeneratedMessage {
  factory Snapshot({
    $fixnum.Int64? logEntryId,
    $core.String? name,
    $core.List<$core.int>? image,
  }) {
    final result = create();
    if (logEntryId != null) result.logEntryId = logEntryId;
    if (name != null) result.name = name;
    if (image != null) result.image = image;
    return result;
  }

  Snapshot._();

  factory Snapshot.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Snapshot.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Snapshot',
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'logEntryId')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..a<$core.List<$core.int>>(
        3, _omitFieldNames ? '' : 'image', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Snapshot clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Snapshot copyWith(void Function(Snapshot) updates) =>
      super.copyWith((message) => updates(message as Snapshot)) as Snapshot;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Snapshot create() => Snapshot._();
  @$core.override
  Snapshot createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Snapshot getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Snapshot>(create);
  static Snapshot? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get logEntryId => $_getI64(0);
  @$pb.TagNumber(1)
  set logEntryId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasLogEntryId() => $_has(0);
  @$pb.TagNumber(1)
  void clearLogEntryId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.int> get image => $_getN(2);
  @$pb.TagNumber(3)
  set image($core.List<$core.int> value) => $_setBytes(2, value);
  @$pb.TagNumber(3)
  $core.bool hasImage() => $_has(2);
  @$pb.TagNumber(3)
  void clearImage() => $_clearField(3);
}

class WorkerCurrentRunConfig_InteractiveApp extends $pb.GeneratedMessage {
  factory WorkerCurrentRunConfig_InteractiveApp() => create();

  WorkerCurrentRunConfig_InteractiveApp._();

  factory WorkerCurrentRunConfig_InteractiveApp.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory WorkerCurrentRunConfig_InteractiveApp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'WorkerCurrentRunConfig.InteractiveApp',
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  WorkerCurrentRunConfig_InteractiveApp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  WorkerCurrentRunConfig_InteractiveApp copyWith(
          void Function(WorkerCurrentRunConfig_InteractiveApp) updates) =>
      super.copyWith((message) =>
              updates(message as WorkerCurrentRunConfig_InteractiveApp))
          as WorkerCurrentRunConfig_InteractiveApp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static WorkerCurrentRunConfig_InteractiveApp create() =>
      WorkerCurrentRunConfig_InteractiveApp._();
  @$core.override
  WorkerCurrentRunConfig_InteractiveApp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static WorkerCurrentRunConfig_InteractiveApp getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          WorkerCurrentRunConfig_InteractiveApp>(create);
  static WorkerCurrentRunConfig_InteractiveApp? _defaultInstance;
}

class WorkerCurrentRunConfig_IntegrationTest extends $pb.GeneratedMessage {
  factory WorkerCurrentRunConfig_IntegrationTest({
    $core.bool? reportSuiteInfo,
    ExecutionFilter? executionFilter,
    $core.int? defaultRetryCount,
    $core.bool? autoUpdateGoldenFiles,
  }) {
    final result = create();
    if (reportSuiteInfo != null) result.reportSuiteInfo = reportSuiteInfo;
    if (executionFilter != null) result.executionFilter = executionFilter;
    if (defaultRetryCount != null) result.defaultRetryCount = defaultRetryCount;
    if (autoUpdateGoldenFiles != null)
      result.autoUpdateGoldenFiles = autoUpdateGoldenFiles;
    return result;
  }

  WorkerCurrentRunConfig_IntegrationTest._();

  factory WorkerCurrentRunConfig_IntegrationTest.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory WorkerCurrentRunConfig_IntegrationTest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'WorkerCurrentRunConfig.IntegrationTest',
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'reportSuiteInfo')
    ..aOM<ExecutionFilter>(2, _omitFieldNames ? '' : 'executionFilter',
        subBuilder: ExecutionFilter.create)
    ..aI(3, _omitFieldNames ? '' : 'defaultRetryCount')
    ..aOB(4, _omitFieldNames ? '' : 'autoUpdateGoldenFiles')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  WorkerCurrentRunConfig_IntegrationTest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  WorkerCurrentRunConfig_IntegrationTest copyWith(
          void Function(WorkerCurrentRunConfig_IntegrationTest) updates) =>
      super.copyWith((message) =>
              updates(message as WorkerCurrentRunConfig_IntegrationTest))
          as WorkerCurrentRunConfig_IntegrationTest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static WorkerCurrentRunConfig_IntegrationTest create() =>
      WorkerCurrentRunConfig_IntegrationTest._();
  @$core.override
  WorkerCurrentRunConfig_IntegrationTest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static WorkerCurrentRunConfig_IntegrationTest getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          WorkerCurrentRunConfig_IntegrationTest>(create);
  static WorkerCurrentRunConfig_IntegrationTest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get reportSuiteInfo => $_getBF(0);
  @$pb.TagNumber(1)
  set reportSuiteInfo($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasReportSuiteInfo() => $_has(0);
  @$pb.TagNumber(1)
  void clearReportSuiteInfo() => $_clearField(1);

  @$pb.TagNumber(2)
  ExecutionFilter get executionFilter => $_getN(1);
  @$pb.TagNumber(2)
  set executionFilter(ExecutionFilter value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasExecutionFilter() => $_has(1);
  @$pb.TagNumber(2)
  void clearExecutionFilter() => $_clearField(2);
  @$pb.TagNumber(2)
  ExecutionFilter ensureExecutionFilter() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.int get defaultRetryCount => $_getIZ(2);
  @$pb.TagNumber(3)
  set defaultRetryCount($core.int value) => $_setSignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasDefaultRetryCount() => $_has(2);
  @$pb.TagNumber(3)
  void clearDefaultRetryCount() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.bool get autoUpdateGoldenFiles => $_getBF(3);
  @$pb.TagNumber(4)
  set autoUpdateGoldenFiles($core.bool value) => $_setBool(3, value);
  @$pb.TagNumber(4)
  $core.bool hasAutoUpdateGoldenFiles() => $_has(3);
  @$pb.TagNumber(4)
  void clearAutoUpdateGoldenFiles() => $_clearField(4);
}

enum WorkerCurrentRunConfig_SubType { interactiveApp, integrationTest, notSet }

/// The config for `worker` in the current run (current hot-restart)
class WorkerCurrentRunConfig extends $pb.GeneratedMessage {
  factory WorkerCurrentRunConfig({
    WorkerCurrentRunConfig_InteractiveApp? interactiveApp,
    WorkerCurrentRunConfig_IntegrationTest? integrationTest,
  }) {
    final result = create();
    if (interactiveApp != null) result.interactiveApp = interactiveApp;
    if (integrationTest != null) result.integrationTest = integrationTest;
    return result;
  }

  WorkerCurrentRunConfig._();

  factory WorkerCurrentRunConfig.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory WorkerCurrentRunConfig.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static const $core.Map<$core.int, WorkerCurrentRunConfig_SubType>
      _WorkerCurrentRunConfig_SubTypeByTag = {
    1: WorkerCurrentRunConfig_SubType.interactiveApp,
    2: WorkerCurrentRunConfig_SubType.integrationTest,
    0: WorkerCurrentRunConfig_SubType.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'WorkerCurrentRunConfig',
      createEmptyInstance: create)
    ..oo(0, [1, 2])
    ..aOM<WorkerCurrentRunConfig_InteractiveApp>(
        1, _omitFieldNames ? '' : 'interactiveApp',
        subBuilder: WorkerCurrentRunConfig_InteractiveApp.create)
    ..aOM<WorkerCurrentRunConfig_IntegrationTest>(
        2, _omitFieldNames ? '' : 'integrationTest',
        subBuilder: WorkerCurrentRunConfig_IntegrationTest.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  WorkerCurrentRunConfig clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  WorkerCurrentRunConfig copyWith(
          void Function(WorkerCurrentRunConfig) updates) =>
      super.copyWith((message) => updates(message as WorkerCurrentRunConfig))
          as WorkerCurrentRunConfig;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static WorkerCurrentRunConfig create() => WorkerCurrentRunConfig._();
  @$core.override
  WorkerCurrentRunConfig createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static WorkerCurrentRunConfig getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<WorkerCurrentRunConfig>(create);
  static WorkerCurrentRunConfig? _defaultInstance;

  @$pb.TagNumber(1)
  @$pb.TagNumber(2)
  WorkerCurrentRunConfig_SubType whichSubType() =>
      _WorkerCurrentRunConfig_SubTypeByTag[$_whichOneof(0)]!;
  @$pb.TagNumber(1)
  @$pb.TagNumber(2)
  void clearSubType() => $_clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  WorkerCurrentRunConfig_InteractiveApp get interactiveApp => $_getN(0);
  @$pb.TagNumber(1)
  set interactiveApp(WorkerCurrentRunConfig_InteractiveApp value) =>
      $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasInteractiveApp() => $_has(0);
  @$pb.TagNumber(1)
  void clearInteractiveApp() => $_clearField(1);
  @$pb.TagNumber(1)
  WorkerCurrentRunConfig_InteractiveApp ensureInteractiveApp() => $_ensure(0);

  @$pb.TagNumber(2)
  WorkerCurrentRunConfig_IntegrationTest get integrationTest => $_getN(1);
  @$pb.TagNumber(2)
  set integrationTest(WorkerCurrentRunConfig_IntegrationTest value) =>
      $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasIntegrationTest() => $_has(1);
  @$pb.TagNumber(2)
  void clearIntegrationTest() => $_clearField(2);
  @$pb.TagNumber(2)
  WorkerCurrentRunConfig_IntegrationTest ensureIntegrationTest() => $_ensure(1);
}

class ExecutionFilter_Strategy_FirstMatch extends $pb.GeneratedMessage {
  factory ExecutionFilter_Strategy_FirstMatch() => create();

  ExecutionFilter_Strategy_FirstMatch._();

  factory ExecutionFilter_Strategy_FirstMatch.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ExecutionFilter_Strategy_FirstMatch.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ExecutionFilter.Strategy.FirstMatch',
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ExecutionFilter_Strategy_FirstMatch clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ExecutionFilter_Strategy_FirstMatch copyWith(
          void Function(ExecutionFilter_Strategy_FirstMatch) updates) =>
      super.copyWith((message) =>
              updates(message as ExecutionFilter_Strategy_FirstMatch))
          as ExecutionFilter_Strategy_FirstMatch;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ExecutionFilter_Strategy_FirstMatch create() =>
      ExecutionFilter_Strategy_FirstMatch._();
  @$core.override
  ExecutionFilter_Strategy_FirstMatch createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ExecutionFilter_Strategy_FirstMatch getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          ExecutionFilter_Strategy_FirstMatch>(create);
  static ExecutionFilter_Strategy_FirstMatch? _defaultInstance;
}

class ExecutionFilter_Strategy_NextMatch extends $pb.GeneratedMessage {
  factory ExecutionFilter_Strategy_NextMatch({
    $core.String? prevTestName,
  }) {
    final result = create();
    if (prevTestName != null) result.prevTestName = prevTestName;
    return result;
  }

  ExecutionFilter_Strategy_NextMatch._();

  factory ExecutionFilter_Strategy_NextMatch.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ExecutionFilter_Strategy_NextMatch.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ExecutionFilter.Strategy.NextMatch',
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'prevTestName')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ExecutionFilter_Strategy_NextMatch clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ExecutionFilter_Strategy_NextMatch copyWith(
          void Function(ExecutionFilter_Strategy_NextMatch) updates) =>
      super.copyWith((message) =>
              updates(message as ExecutionFilter_Strategy_NextMatch))
          as ExecutionFilter_Strategy_NextMatch;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ExecutionFilter_Strategy_NextMatch create() =>
      ExecutionFilter_Strategy_NextMatch._();
  @$core.override
  ExecutionFilter_Strategy_NextMatch createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ExecutionFilter_Strategy_NextMatch getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ExecutionFilter_Strategy_NextMatch>(
          create);
  static ExecutionFilter_Strategy_NextMatch? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get prevTestName => $_getSZ(0);
  @$pb.TagNumber(1)
  set prevTestName($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasPrevTestName() => $_has(0);
  @$pb.TagNumber(1)
  void clearPrevTestName() => $_clearField(1);
}

class ExecutionFilter_Strategy_AllMatch extends $pb.GeneratedMessage {
  factory ExecutionFilter_Strategy_AllMatch() => create();

  ExecutionFilter_Strategy_AllMatch._();

  factory ExecutionFilter_Strategy_AllMatch.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ExecutionFilter_Strategy_AllMatch.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ExecutionFilter.Strategy.AllMatch',
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ExecutionFilter_Strategy_AllMatch clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ExecutionFilter_Strategy_AllMatch copyWith(
          void Function(ExecutionFilter_Strategy_AllMatch) updates) =>
      super.copyWith((message) =>
              updates(message as ExecutionFilter_Strategy_AllMatch))
          as ExecutionFilter_Strategy_AllMatch;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ExecutionFilter_Strategy_AllMatch create() =>
      ExecutionFilter_Strategy_AllMatch._();
  @$core.override
  ExecutionFilter_Strategy_AllMatch createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ExecutionFilter_Strategy_AllMatch getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ExecutionFilter_Strategy_AllMatch>(
          create);
  static ExecutionFilter_Strategy_AllMatch? _defaultInstance;
}

enum ExecutionFilter_Strategy_SubType {
  firstMatch,
  nextMatch,
  allMatch,
  notSet
}

class ExecutionFilter_Strategy extends $pb.GeneratedMessage {
  factory ExecutionFilter_Strategy({
    ExecutionFilter_Strategy_FirstMatch? firstMatch,
    ExecutionFilter_Strategy_NextMatch? nextMatch,
    ExecutionFilter_Strategy_AllMatch? allMatch,
  }) {
    final result = create();
    if (firstMatch != null) result.firstMatch = firstMatch;
    if (nextMatch != null) result.nextMatch = nextMatch;
    if (allMatch != null) result.allMatch = allMatch;
    return result;
  }

  ExecutionFilter_Strategy._();

  factory ExecutionFilter_Strategy.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ExecutionFilter_Strategy.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static const $core.Map<$core.int, ExecutionFilter_Strategy_SubType>
      _ExecutionFilter_Strategy_SubTypeByTag = {
    1: ExecutionFilter_Strategy_SubType.firstMatch,
    2: ExecutionFilter_Strategy_SubType.nextMatch,
    3: ExecutionFilter_Strategy_SubType.allMatch,
    0: ExecutionFilter_Strategy_SubType.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ExecutionFilter.Strategy',
      createEmptyInstance: create)
    ..oo(0, [1, 2, 3])
    ..aOM<ExecutionFilter_Strategy_FirstMatch>(
        1, _omitFieldNames ? '' : 'firstMatch',
        subBuilder: ExecutionFilter_Strategy_FirstMatch.create)
    ..aOM<ExecutionFilter_Strategy_NextMatch>(
        2, _omitFieldNames ? '' : 'nextMatch',
        subBuilder: ExecutionFilter_Strategy_NextMatch.create)
    ..aOM<ExecutionFilter_Strategy_AllMatch>(
        3, _omitFieldNames ? '' : 'allMatch',
        subBuilder: ExecutionFilter_Strategy_AllMatch.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ExecutionFilter_Strategy clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ExecutionFilter_Strategy copyWith(
          void Function(ExecutionFilter_Strategy) updates) =>
      super.copyWith((message) => updates(message as ExecutionFilter_Strategy))
          as ExecutionFilter_Strategy;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ExecutionFilter_Strategy create() => ExecutionFilter_Strategy._();
  @$core.override
  ExecutionFilter_Strategy createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ExecutionFilter_Strategy getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ExecutionFilter_Strategy>(create);
  static ExecutionFilter_Strategy? _defaultInstance;

  @$pb.TagNumber(1)
  @$pb.TagNumber(2)
  @$pb.TagNumber(3)
  ExecutionFilter_Strategy_SubType whichSubType() =>
      _ExecutionFilter_Strategy_SubTypeByTag[$_whichOneof(0)]!;
  @$pb.TagNumber(1)
  @$pb.TagNumber(2)
  @$pb.TagNumber(3)
  void clearSubType() => $_clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  ExecutionFilter_Strategy_FirstMatch get firstMatch => $_getN(0);
  @$pb.TagNumber(1)
  set firstMatch(ExecutionFilter_Strategy_FirstMatch value) =>
      $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasFirstMatch() => $_has(0);
  @$pb.TagNumber(1)
  void clearFirstMatch() => $_clearField(1);
  @$pb.TagNumber(1)
  ExecutionFilter_Strategy_FirstMatch ensureFirstMatch() => $_ensure(0);

  @$pb.TagNumber(2)
  ExecutionFilter_Strategy_NextMatch get nextMatch => $_getN(1);
  @$pb.TagNumber(2)
  set nextMatch(ExecutionFilter_Strategy_NextMatch value) =>
      $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasNextMatch() => $_has(1);
  @$pb.TagNumber(2)
  void clearNextMatch() => $_clearField(2);
  @$pb.TagNumber(2)
  ExecutionFilter_Strategy_NextMatch ensureNextMatch() => $_ensure(1);

  @$pb.TagNumber(3)
  ExecutionFilter_Strategy_AllMatch get allMatch => $_getN(2);
  @$pb.TagNumber(3)
  set allMatch(ExecutionFilter_Strategy_AllMatch value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasAllMatch() => $_has(2);
  @$pb.TagNumber(3)
  void clearAllMatch() => $_clearField(3);
  @$pb.TagNumber(3)
  ExecutionFilter_Strategy_AllMatch ensureAllMatch() => $_ensure(2);
}

class ExecutionFilter extends $pb.GeneratedMessage {
  factory ExecutionFilter({
    $core.String? filterNameRegex,
    ExecutionFilter_Strategy? strategy,
  }) {
    final result = create();
    if (filterNameRegex != null) result.filterNameRegex = filterNameRegex;
    if (strategy != null) result.strategy = strategy;
    return result;
  }

  ExecutionFilter._();

  factory ExecutionFilter.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ExecutionFilter.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ExecutionFilter',
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'filterNameRegex')
    ..aOM<ExecutionFilter_Strategy>(2, _omitFieldNames ? '' : 'strategy',
        subBuilder: ExecutionFilter_Strategy.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ExecutionFilter clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ExecutionFilter copyWith(void Function(ExecutionFilter) updates) =>
      super.copyWith((message) => updates(message as ExecutionFilter))
          as ExecutionFilter;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ExecutionFilter create() => ExecutionFilter._();
  @$core.override
  ExecutionFilter createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ExecutionFilter getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ExecutionFilter>(create);
  static ExecutionFilter? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get filterNameRegex => $_getSZ(0);
  @$pb.TagNumber(1)
  set filterNameRegex($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasFilterNameRegex() => $_has(0);
  @$pb.TagNumber(1)
  void clearFilterNameRegex() => $_clearField(1);

  @$pb.TagNumber(2)
  ExecutionFilter_Strategy get strategy => $_getN(1);
  @$pb.TagNumber(2)
  set strategy(ExecutionFilter_Strategy value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasStrategy() => $_has(1);
  @$pb.TagNumber(2)
  void clearStrategy() => $_clearField(2);
  @$pb.TagNumber(2)
  ExecutionFilter_Strategy ensureStrategy() => $_ensure(1);
}

/// Information after `ExecutionFilter` is resolved
class ResolvedExecutionFilterProto extends $pb.GeneratedMessage {
  factory ResolvedExecutionFilterProto({
    $core.Iterable<$core.String>? allowExecuteTestNames,
  }) {
    final result = create();
    if (allowExecuteTestNames != null)
      result.allowExecuteTestNames.addAll(allowExecuteTestNames);
    return result;
  }

  ResolvedExecutionFilterProto._();

  factory ResolvedExecutionFilterProto.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ResolvedExecutionFilterProto.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ResolvedExecutionFilterProto',
      createEmptyInstance: create)
    ..pPS(1, _omitFieldNames ? '' : 'allowExecuteTestNames')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ResolvedExecutionFilterProto clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ResolvedExecutionFilterProto copyWith(
          void Function(ResolvedExecutionFilterProto) updates) =>
      super.copyWith(
              (message) => updates(message as ResolvedExecutionFilterProto))
          as ResolvedExecutionFilterProto;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ResolvedExecutionFilterProto create() =>
      ResolvedExecutionFilterProto._();
  @$core.override
  ResolvedExecutionFilterProto createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ResolvedExecutionFilterProto getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResolvedExecutionFilterProto>(create);
  static ResolvedExecutionFilterProto? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<$core.String> get allowExecuteTestNames => $_getList(0);
}

/// https://stackoverflow.com/questions/31768665/can-i-define-a-grpc-call-with-a-null-request-or-response
class Empty extends $pb.GeneratedMessage {
  factory Empty() => create();

  Empty._();

  factory Empty.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Empty.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Empty',
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Empty clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Empty copyWith(void Function(Empty) updates) =>
      super.copyWith((message) => updates(message as Empty)) as Empty;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Empty create() => Empty._();
  @$core.override
  Empty createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Empty getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Empty>(create);
  static Empty? _defaultInstance;
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
