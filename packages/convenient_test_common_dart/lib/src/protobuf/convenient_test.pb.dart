///
//  Generated code. Do not modify.
//  source: convenient_test.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'convenient_test.pbenum.dart';

export 'convenient_test.pbenum.dart';

class ReportCollection extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ReportCollection',
      createEmptyInstance: create)
    ..pc<ReportItem>(
        1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'items', $pb.PbFieldType.PM,
        subBuilder: ReportItem.create)
    ..hasRequiredFields = false;

  ReportCollection._() : super();
  factory ReportCollection({
    $core.Iterable<ReportItem>? items,
  }) {
    final _result = create();
    if (items != null) {
      _result.items.addAll(items);
    }
    return _result;
  }
  factory ReportCollection.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ReportCollection.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ReportCollection clone() => ReportCollection()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ReportCollection copyWith(void Function(ReportCollection) updates) =>
      super.copyWith((message) => updates(message as ReportCollection))
          as ReportCollection; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ReportCollection create() => ReportCollection._();
  ReportCollection createEmptyInstance() => create();
  static $pb.PbList<ReportCollection> createRepeated() => $pb.PbList<ReportCollection>();
  @$core.pragma('dart2js:noInline')
  static ReportCollection getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ReportCollection>(create);
  static ReportCollection? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<ReportItem> get items => $_getList(0);
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
  static const $core.Map<$core.int, ReportItem_SubType> _ReportItem_SubTypeByTag = {
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
      const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ReportItem',
      createEmptyInstance: create)
    ..oo(0, [1, 2, 3, 4, 5, 6, 7, 8])
    ..aOM<SuiteInfoProto>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'suiteInfoProto',
        subBuilder: SuiteInfoProto.create)
    ..aOM<LogEntry>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'logEntry',
        subBuilder: LogEntry.create)
    ..aOM<RunnerStateChange>(
        3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'runnerStateChange',
        subBuilder: RunnerStateChange.create)
    ..aOM<RunnerError>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'runnerError',
        subBuilder: RunnerError.create)
    ..aOM<RunnerMessage>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'runnerMessage',
        subBuilder: RunnerMessage.create)
    ..aOM<Snapshot>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'snapshot',
        subBuilder: Snapshot.create)
    ..aOM<SetUpAll>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'setUpAll',
        subBuilder: SetUpAll.create)
    ..aOM<TearDownAll>(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'tearDownAll',
        subBuilder: TearDownAll.create)
    ..hasRequiredFields = false;

  ReportItem._() : super();
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
    final _result = create();
    if (suiteInfoProto != null) {
      _result.suiteInfoProto = suiteInfoProto;
    }
    if (logEntry != null) {
      _result.logEntry = logEntry;
    }
    if (runnerStateChange != null) {
      _result.runnerStateChange = runnerStateChange;
    }
    if (runnerError != null) {
      _result.runnerError = runnerError;
    }
    if (runnerMessage != null) {
      _result.runnerMessage = runnerMessage;
    }
    if (snapshot != null) {
      _result.snapshot = snapshot;
    }
    if (setUpAll != null) {
      _result.setUpAll = setUpAll;
    }
    if (tearDownAll != null) {
      _result.tearDownAll = tearDownAll;
    }
    return _result;
  }
  factory ReportItem.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ReportItem.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ReportItem clone() => ReportItem()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ReportItem copyWith(void Function(ReportItem) updates) =>
      super.copyWith((message) => updates(message as ReportItem)) as ReportItem; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ReportItem create() => ReportItem._();
  ReportItem createEmptyInstance() => create();
  static $pb.PbList<ReportItem> createRepeated() => $pb.PbList<ReportItem>();
  @$core.pragma('dart2js:noInline')
  static ReportItem getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ReportItem>(create);
  static ReportItem? _defaultInstance;

  ReportItem_SubType whichSubType() => _ReportItem_SubTypeByTag[$_whichOneof(0)]!;
  void clearSubType() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  SuiteInfoProto get suiteInfoProto => $_getN(0);
  @$pb.TagNumber(1)
  set suiteInfoProto(SuiteInfoProto v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasSuiteInfoProto() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuiteInfoProto() => clearField(1);
  @$pb.TagNumber(1)
  SuiteInfoProto ensureSuiteInfoProto() => $_ensure(0);

  @$pb.TagNumber(2)
  LogEntry get logEntry => $_getN(1);
  @$pb.TagNumber(2)
  set logEntry(LogEntry v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasLogEntry() => $_has(1);
  @$pb.TagNumber(2)
  void clearLogEntry() => clearField(2);
  @$pb.TagNumber(2)
  LogEntry ensureLogEntry() => $_ensure(1);

  @$pb.TagNumber(3)
  RunnerStateChange get runnerStateChange => $_getN(2);
  @$pb.TagNumber(3)
  set runnerStateChange(RunnerStateChange v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasRunnerStateChange() => $_has(2);
  @$pb.TagNumber(3)
  void clearRunnerStateChange() => clearField(3);
  @$pb.TagNumber(3)
  RunnerStateChange ensureRunnerStateChange() => $_ensure(2);

  @$pb.TagNumber(4)
  RunnerError get runnerError => $_getN(3);
  @$pb.TagNumber(4)
  set runnerError(RunnerError v) {
    setField(4, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasRunnerError() => $_has(3);
  @$pb.TagNumber(4)
  void clearRunnerError() => clearField(4);
  @$pb.TagNumber(4)
  RunnerError ensureRunnerError() => $_ensure(3);

  @$pb.TagNumber(5)
  RunnerMessage get runnerMessage => $_getN(4);
  @$pb.TagNumber(5)
  set runnerMessage(RunnerMessage v) {
    setField(5, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasRunnerMessage() => $_has(4);
  @$pb.TagNumber(5)
  void clearRunnerMessage() => clearField(5);
  @$pb.TagNumber(5)
  RunnerMessage ensureRunnerMessage() => $_ensure(4);

  @$pb.TagNumber(6)
  Snapshot get snapshot => $_getN(5);
  @$pb.TagNumber(6)
  set snapshot(Snapshot v) {
    setField(6, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasSnapshot() => $_has(5);
  @$pb.TagNumber(6)
  void clearSnapshot() => clearField(6);
  @$pb.TagNumber(6)
  Snapshot ensureSnapshot() => $_ensure(5);

  @$pb.TagNumber(7)
  SetUpAll get setUpAll => $_getN(6);
  @$pb.TagNumber(7)
  set setUpAll(SetUpAll v) {
    setField(7, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasSetUpAll() => $_has(6);
  @$pb.TagNumber(7)
  void clearSetUpAll() => clearField(7);
  @$pb.TagNumber(7)
  SetUpAll ensureSetUpAll() => $_ensure(6);

  @$pb.TagNumber(8)
  TearDownAll get tearDownAll => $_getN(7);
  @$pb.TagNumber(8)
  set tearDownAll(TearDownAll v) {
    setField(8, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasTearDownAll() => $_has(7);
  @$pb.TagNumber(8)
  void clearTearDownAll() => clearField(8);
  @$pb.TagNumber(8)
  TearDownAll ensureTearDownAll() => $_ensure(7);
}

class SetUpAll extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'SetUpAll',
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  SetUpAll._() : super();
  factory SetUpAll() => create();
  factory SetUpAll.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory SetUpAll.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  SetUpAll clone() => SetUpAll()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  SetUpAll copyWith(void Function(SetUpAll) updates) =>
      super.copyWith((message) => updates(message as SetUpAll)) as SetUpAll; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SetUpAll create() => SetUpAll._();
  SetUpAll createEmptyInstance() => create();
  static $pb.PbList<SetUpAll> createRepeated() => $pb.PbList<SetUpAll>();
  @$core.pragma('dart2js:noInline')
  static SetUpAll getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SetUpAll>(create);
  static SetUpAll? _defaultInstance;
}

class TearDownAll extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'TearDownAll',
      createEmptyInstance: create)
    ..aOM<ResolvedExecutionFilterProto>(
        1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'resolvedExecutionFilter',
        subBuilder: ResolvedExecutionFilterProto.create)
    ..hasRequiredFields = false;

  TearDownAll._() : super();
  factory TearDownAll({
    ResolvedExecutionFilterProto? resolvedExecutionFilter,
  }) {
    final _result = create();
    if (resolvedExecutionFilter != null) {
      _result.resolvedExecutionFilter = resolvedExecutionFilter;
    }
    return _result;
  }
  factory TearDownAll.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory TearDownAll.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  TearDownAll clone() => TearDownAll()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  TearDownAll copyWith(void Function(TearDownAll) updates) =>
      super.copyWith((message) => updates(message as TearDownAll)) as TearDownAll; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TearDownAll create() => TearDownAll._();
  TearDownAll createEmptyInstance() => create();
  static $pb.PbList<TearDownAll> createRepeated() => $pb.PbList<TearDownAll>();
  @$core.pragma('dart2js:noInline')
  static TearDownAll getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TearDownAll>(create);
  static TearDownAll? _defaultInstance;

  @$pb.TagNumber(1)
  ResolvedExecutionFilterProto get resolvedExecutionFilter => $_getN(0);
  @$pb.TagNumber(1)
  set resolvedExecutionFilter(ResolvedExecutionFilterProto v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasResolvedExecutionFilter() => $_has(0);
  @$pb.TagNumber(1)
  void clearResolvedExecutionFilter() => clearField(1);
  @$pb.TagNumber(1)
  ResolvedExecutionFilterProto ensureResolvedExecutionFilter() => $_ensure(0);
}

class LogEntry extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'LogEntry',
      createEmptyInstance: create)
    ..aInt64(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'testName')
    ..pc<LogSubEntry>(
        3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'subEntries', $pb.PbFieldType.PM,
        subBuilder: LogSubEntry.create)
    ..hasRequiredFields = false;

  LogEntry._() : super();
  factory LogEntry({
    $fixnum.Int64? id,
    $core.String? testName,
    $core.Iterable<LogSubEntry>? subEntries,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (testName != null) {
      _result.testName = testName;
    }
    if (subEntries != null) {
      _result.subEntries.addAll(subEntries);
    }
    return _result;
  }
  factory LogEntry.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory LogEntry.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  LogEntry clone() => LogEntry()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  LogEntry copyWith(void Function(LogEntry) updates) =>
      super.copyWith((message) => updates(message as LogEntry)) as LogEntry; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static LogEntry create() => LogEntry._();
  LogEntry createEmptyInstance() => create();
  static $pb.PbList<LogEntry> createRepeated() => $pb.PbList<LogEntry>();
  @$core.pragma('dart2js:noInline')
  static LogEntry getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<LogEntry>(create);
  static LogEntry? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 v) {
    $_setInt64(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get testName => $_getSZ(1);
  @$pb.TagNumber(2)
  set testName($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasTestName() => $_has(1);
  @$pb.TagNumber(2)
  void clearTestName() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<LogSubEntry> get subEntries => $_getList(2);
}

class LogSubEntry extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'LogSubEntry',
      createEmptyInstance: create)
    ..aInt64(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aInt64(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'time')
    ..e<LogSubEntryType>(
        3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'type', $pb.PbFieldType.OE,
        defaultOrMaker: LogSubEntryType.INVALID, valueOf: LogSubEntryType.valueOf, enumValues: LogSubEntryType.values)
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'title')
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'message')
    ..aOS(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'error')
    ..aOS(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'stackTrace')
    ..hasRequiredFields = false;

  LogSubEntry._() : super();
  factory LogSubEntry({
    $fixnum.Int64? id,
    $fixnum.Int64? time,
    LogSubEntryType? type,
    $core.String? title,
    $core.String? message,
    $core.String? error,
    $core.String? stackTrace,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (time != null) {
      _result.time = time;
    }
    if (type != null) {
      _result.type = type;
    }
    if (title != null) {
      _result.title = title;
    }
    if (message != null) {
      _result.message = message;
    }
    if (error != null) {
      _result.error = error;
    }
    if (stackTrace != null) {
      _result.stackTrace = stackTrace;
    }
    return _result;
  }
  factory LogSubEntry.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory LogSubEntry.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  LogSubEntry clone() => LogSubEntry()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  LogSubEntry copyWith(void Function(LogSubEntry) updates) =>
      super.copyWith((message) => updates(message as LogSubEntry)) as LogSubEntry; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static LogSubEntry create() => LogSubEntry._();
  LogSubEntry createEmptyInstance() => create();
  static $pb.PbList<LogSubEntry> createRepeated() => $pb.PbList<LogSubEntry>();
  @$core.pragma('dart2js:noInline')
  static LogSubEntry getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<LogSubEntry>(create);
  static LogSubEntry? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 v) {
    $_setInt64(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get time => $_getI64(1);
  @$pb.TagNumber(2)
  set time($fixnum.Int64 v) {
    $_setInt64(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasTime() => $_has(1);
  @$pb.TagNumber(2)
  void clearTime() => clearField(2);

  @$pb.TagNumber(3)
  LogSubEntryType get type => $_getN(2);
  @$pb.TagNumber(3)
  set type(LogSubEntryType v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasType() => $_has(2);
  @$pb.TagNumber(3)
  void clearType() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get title => $_getSZ(3);
  @$pb.TagNumber(4)
  set title($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasTitle() => $_has(3);
  @$pb.TagNumber(4)
  void clearTitle() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get message => $_getSZ(4);
  @$pb.TagNumber(5)
  set message($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasMessage() => $_has(4);
  @$pb.TagNumber(5)
  void clearMessage() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get error => $_getSZ(5);
  @$pb.TagNumber(6)
  set error($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasError() => $_has(5);
  @$pb.TagNumber(6)
  void clearError() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get stackTrace => $_getSZ(6);
  @$pb.TagNumber(7)
  set stackTrace($core.String v) {
    $_setString(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasStackTrace() => $_has(6);
  @$pb.TagNumber(7)
  void clearStackTrace() => clearField(7);
}

class SuiteInfoProto extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'SuiteInfoProto',
      createEmptyInstance: create)
    ..aInt64(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'groupId')
    ..pc<GroupInfoProto>(
        2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'groups', $pb.PbFieldType.PM,
        subBuilder: GroupInfoProto.create)
    ..pc<TestInfoProto>(
        3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'tests', $pb.PbFieldType.PM,
        subBuilder: TestInfoProto.create)
    ..hasRequiredFields = false;

  SuiteInfoProto._() : super();
  factory SuiteInfoProto({
    $fixnum.Int64? groupId,
    $core.Iterable<GroupInfoProto>? groups,
    $core.Iterable<TestInfoProto>? tests,
  }) {
    final _result = create();
    if (groupId != null) {
      _result.groupId = groupId;
    }
    if (groups != null) {
      _result.groups.addAll(groups);
    }
    if (tests != null) {
      _result.tests.addAll(tests);
    }
    return _result;
  }
  factory SuiteInfoProto.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory SuiteInfoProto.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  SuiteInfoProto clone() => SuiteInfoProto()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  SuiteInfoProto copyWith(void Function(SuiteInfoProto) updates) =>
      super.copyWith((message) => updates(message as SuiteInfoProto))
          as SuiteInfoProto; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SuiteInfoProto create() => SuiteInfoProto._();
  SuiteInfoProto createEmptyInstance() => create();
  static $pb.PbList<SuiteInfoProto> createRepeated() => $pb.PbList<SuiteInfoProto>();
  @$core.pragma('dart2js:noInline')
  static SuiteInfoProto getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SuiteInfoProto>(create);
  static SuiteInfoProto? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get groupId => $_getI64(0);
  @$pb.TagNumber(1)
  set groupId($fixnum.Int64 v) {
    $_setInt64(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasGroupId() => $_has(0);
  @$pb.TagNumber(1)
  void clearGroupId() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<GroupInfoProto> get groups => $_getList(1);

  @$pb.TagNumber(3)
  $core.List<TestInfoProto> get tests => $_getList(2);
}

class GroupInfoProto extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GroupInfoProto',
      createEmptyInstance: create)
    ..aInt64(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..aInt64(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'parentId')
    ..p<$fixnum.Int64>(
        4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'entryIds', $pb.PbFieldType.P6)
    ..hasRequiredFields = false;

  GroupInfoProto._() : super();
  factory GroupInfoProto({
    $fixnum.Int64? id,
    $core.String? name,
    $fixnum.Int64? parentId,
    $core.Iterable<$fixnum.Int64>? entryIds,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (name != null) {
      _result.name = name;
    }
    if (parentId != null) {
      _result.parentId = parentId;
    }
    if (entryIds != null) {
      _result.entryIds.addAll(entryIds);
    }
    return _result;
  }
  factory GroupInfoProto.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GroupInfoProto.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GroupInfoProto clone() => GroupInfoProto()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GroupInfoProto copyWith(void Function(GroupInfoProto) updates) =>
      super.copyWith((message) => updates(message as GroupInfoProto))
          as GroupInfoProto; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GroupInfoProto create() => GroupInfoProto._();
  GroupInfoProto createEmptyInstance() => create();
  static $pb.PbList<GroupInfoProto> createRepeated() => $pb.PbList<GroupInfoProto>();
  @$core.pragma('dart2js:noInline')
  static GroupInfoProto getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GroupInfoProto>(create);
  static GroupInfoProto? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 v) {
    $_setInt64(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get parentId => $_getI64(2);
  @$pb.TagNumber(3)
  set parentId($fixnum.Int64 v) {
    $_setInt64(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasParentId() => $_has(2);
  @$pb.TagNumber(3)
  void clearParentId() => clearField(3);

  @$pb.TagNumber(4)
  $core.List<$fixnum.Int64> get entryIds => $_getList(3);
}

class TestInfoProto extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'TestInfoProto',
      createEmptyInstance: create)
    ..aInt64(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..aInt64(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'parentId')
    ..hasRequiredFields = false;

  TestInfoProto._() : super();
  factory TestInfoProto({
    $fixnum.Int64? id,
    $core.String? name,
    $fixnum.Int64? parentId,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (name != null) {
      _result.name = name;
    }
    if (parentId != null) {
      _result.parentId = parentId;
    }
    return _result;
  }
  factory TestInfoProto.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory TestInfoProto.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  TestInfoProto clone() => TestInfoProto()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  TestInfoProto copyWith(void Function(TestInfoProto) updates) =>
      super.copyWith((message) => updates(message as TestInfoProto)) as TestInfoProto; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TestInfoProto create() => TestInfoProto._();
  TestInfoProto createEmptyInstance() => create();
  static $pb.PbList<TestInfoProto> createRepeated() => $pb.PbList<TestInfoProto>();
  @$core.pragma('dart2js:noInline')
  static TestInfoProto getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TestInfoProto>(create);
  static TestInfoProto? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 v) {
    $_setInt64(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get parentId => $_getI64(2);
  @$pb.TagNumber(3)
  set parentId($fixnum.Int64 v) {
    $_setInt64(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasParentId() => $_has(2);
  @$pb.TagNumber(3)
  void clearParentId() => clearField(3);
}

class RunnerStateChange extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'RunnerStateChange',
      createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'testName')
    ..aOM<TestEntryState>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'state',
        subBuilder: TestEntryState.create)
    ..hasRequiredFields = false;

  RunnerStateChange._() : super();
  factory RunnerStateChange({
    $core.String? testName,
    TestEntryState? state,
  }) {
    final _result = create();
    if (testName != null) {
      _result.testName = testName;
    }
    if (state != null) {
      _result.state = state;
    }
    return _result;
  }
  factory RunnerStateChange.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RunnerStateChange.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RunnerStateChange clone() => RunnerStateChange()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RunnerStateChange copyWith(void Function(RunnerStateChange) updates) =>
      super.copyWith((message) => updates(message as RunnerStateChange))
          as RunnerStateChange; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RunnerStateChange create() => RunnerStateChange._();
  RunnerStateChange createEmptyInstance() => create();
  static $pb.PbList<RunnerStateChange> createRepeated() => $pb.PbList<RunnerStateChange>();
  @$core.pragma('dart2js:noInline')
  static RunnerStateChange getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RunnerStateChange>(create);
  static RunnerStateChange? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get testName => $_getSZ(0);
  @$pb.TagNumber(1)
  set testName($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasTestName() => $_has(0);
  @$pb.TagNumber(1)
  void clearTestName() => clearField(1);

  @$pb.TagNumber(2)
  TestEntryState get state => $_getN(1);
  @$pb.TagNumber(2)
  set state(TestEntryState v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasState() => $_has(1);
  @$pb.TagNumber(2)
  void clearState() => clearField(2);
  @$pb.TagNumber(2)
  TestEntryState ensureState() => $_ensure(1);
}

class TestEntryState extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'TestEntryState',
      createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'status')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'result')
    ..hasRequiredFields = false;

  TestEntryState._() : super();
  factory TestEntryState({
    $core.String? status,
    $core.String? result,
  }) {
    final _result = create();
    if (status != null) {
      _result.status = status;
    }
    if (result != null) {
      _result.result = result;
    }
    return _result;
  }
  factory TestEntryState.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory TestEntryState.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  TestEntryState clone() => TestEntryState()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  TestEntryState copyWith(void Function(TestEntryState) updates) =>
      super.copyWith((message) => updates(message as TestEntryState))
          as TestEntryState; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TestEntryState create() => TestEntryState._();
  TestEntryState createEmptyInstance() => create();
  static $pb.PbList<TestEntryState> createRepeated() => $pb.PbList<TestEntryState>();
  @$core.pragma('dart2js:noInline')
  static TestEntryState getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TestEntryState>(create);
  static TestEntryState? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get status => $_getSZ(0);
  @$pb.TagNumber(1)
  set status($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasStatus() => $_has(0);
  @$pb.TagNumber(1)
  void clearStatus() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get result => $_getSZ(1);
  @$pb.TagNumber(2)
  set result($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasResult() => $_has(1);
  @$pb.TagNumber(2)
  void clearResult() => clearField(2);
}

class RunnerError extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'RunnerError',
      createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'testName')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'error')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'stackTrace')
    ..hasRequiredFields = false;

  RunnerError._() : super();
  factory RunnerError({
    $core.String? testName,
    $core.String? error,
    $core.String? stackTrace,
  }) {
    final _result = create();
    if (testName != null) {
      _result.testName = testName;
    }
    if (error != null) {
      _result.error = error;
    }
    if (stackTrace != null) {
      _result.stackTrace = stackTrace;
    }
    return _result;
  }
  factory RunnerError.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RunnerError.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RunnerError clone() => RunnerError()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RunnerError copyWith(void Function(RunnerError) updates) =>
      super.copyWith((message) => updates(message as RunnerError)) as RunnerError; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RunnerError create() => RunnerError._();
  RunnerError createEmptyInstance() => create();
  static $pb.PbList<RunnerError> createRepeated() => $pb.PbList<RunnerError>();
  @$core.pragma('dart2js:noInline')
  static RunnerError getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RunnerError>(create);
  static RunnerError? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get testName => $_getSZ(0);
  @$pb.TagNumber(1)
  set testName($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasTestName() => $_has(0);
  @$pb.TagNumber(1)
  void clearTestName() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get error => $_getSZ(1);
  @$pb.TagNumber(2)
  set error($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasError() => $_has(1);
  @$pb.TagNumber(2)
  void clearError() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get stackTrace => $_getSZ(2);
  @$pb.TagNumber(3)
  set stackTrace($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasStackTrace() => $_has(2);
  @$pb.TagNumber(3)
  void clearStackTrace() => clearField(3);
}

class RunnerMessage extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'RunnerMessage',
      createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'testName')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'message')
    ..hasRequiredFields = false;

  RunnerMessage._() : super();
  factory RunnerMessage({
    $core.String? testName,
    $core.String? message,
  }) {
    final _result = create();
    if (testName != null) {
      _result.testName = testName;
    }
    if (message != null) {
      _result.message = message;
    }
    return _result;
  }
  factory RunnerMessage.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RunnerMessage.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RunnerMessage clone() => RunnerMessage()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RunnerMessage copyWith(void Function(RunnerMessage) updates) =>
      super.copyWith((message) => updates(message as RunnerMessage)) as RunnerMessage; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RunnerMessage create() => RunnerMessage._();
  RunnerMessage createEmptyInstance() => create();
  static $pb.PbList<RunnerMessage> createRepeated() => $pb.PbList<RunnerMessage>();
  @$core.pragma('dart2js:noInline')
  static RunnerMessage getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RunnerMessage>(create);
  static RunnerMessage? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get testName => $_getSZ(0);
  @$pb.TagNumber(1)
  set testName($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasTestName() => $_has(0);
  @$pb.TagNumber(1)
  void clearTestName() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get message => $_getSZ(1);
  @$pb.TagNumber(2)
  set message($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearMessage() => clearField(2);
}

class Snapshot extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Snapshot',
      createEmptyInstance: create)
    ..aInt64(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'logEntryId')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..a<$core.List<$core.int>>(
        3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'image', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  Snapshot._() : super();
  factory Snapshot({
    $fixnum.Int64? logEntryId,
    $core.String? name,
    $core.List<$core.int>? image,
  }) {
    final _result = create();
    if (logEntryId != null) {
      _result.logEntryId = logEntryId;
    }
    if (name != null) {
      _result.name = name;
    }
    if (image != null) {
      _result.image = image;
    }
    return _result;
  }
  factory Snapshot.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory Snapshot.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  Snapshot clone() => Snapshot()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  Snapshot copyWith(void Function(Snapshot) updates) =>
      super.copyWith((message) => updates(message as Snapshot)) as Snapshot; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Snapshot create() => Snapshot._();
  Snapshot createEmptyInstance() => create();
  static $pb.PbList<Snapshot> createRepeated() => $pb.PbList<Snapshot>();
  @$core.pragma('dart2js:noInline')
  static Snapshot getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Snapshot>(create);
  static Snapshot? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get logEntryId => $_getI64(0);
  @$pb.TagNumber(1)
  set logEntryId($fixnum.Int64 v) {
    $_setInt64(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasLogEntryId() => $_has(0);
  @$pb.TagNumber(1)
  void clearLogEntryId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.int> get image => $_getN(2);
  @$pb.TagNumber(3)
  set image($core.List<$core.int> v) {
    $_setBytes(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasImage() => $_has(2);
  @$pb.TagNumber(3)
  void clearImage() => clearField(3);
}

class WorkerCurrentRunConfig_InteractiveApp extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'WorkerCurrentRunConfig.InteractiveApp',
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  WorkerCurrentRunConfig_InteractiveApp._() : super();
  factory WorkerCurrentRunConfig_InteractiveApp() => create();
  factory WorkerCurrentRunConfig_InteractiveApp.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory WorkerCurrentRunConfig_InteractiveApp.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  WorkerCurrentRunConfig_InteractiveApp clone() => WorkerCurrentRunConfig_InteractiveApp()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  WorkerCurrentRunConfig_InteractiveApp copyWith(void Function(WorkerCurrentRunConfig_InteractiveApp) updates) =>
      super.copyWith((message) => updates(message as WorkerCurrentRunConfig_InteractiveApp))
          as WorkerCurrentRunConfig_InteractiveApp; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static WorkerCurrentRunConfig_InteractiveApp create() => WorkerCurrentRunConfig_InteractiveApp._();
  WorkerCurrentRunConfig_InteractiveApp createEmptyInstance() => create();
  static $pb.PbList<WorkerCurrentRunConfig_InteractiveApp> createRepeated() =>
      $pb.PbList<WorkerCurrentRunConfig_InteractiveApp>();
  @$core.pragma('dart2js:noInline')
  static WorkerCurrentRunConfig_InteractiveApp getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<WorkerCurrentRunConfig_InteractiveApp>(create);
  static WorkerCurrentRunConfig_InteractiveApp? _defaultInstance;
}

class WorkerCurrentRunConfig_IntegrationTest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'WorkerCurrentRunConfig.IntegrationTest',
      createEmptyInstance: create)
    ..aOB(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'reportSuiteInfo')
    ..aOM<ExecutionFilter>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'executionFilter',
        subBuilder: ExecutionFilter.create)
    ..a<$core.int>(
        3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'defaultRetryCount', $pb.PbFieldType.O3)
    ..aOB(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'autoUpdateGoldenFiles')
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'goldenBasedirForFailure')
    ..hasRequiredFields = false;

  WorkerCurrentRunConfig_IntegrationTest._() : super();
  factory WorkerCurrentRunConfig_IntegrationTest({
    $core.bool? reportSuiteInfo,
    ExecutionFilter? executionFilter,
    $core.int? defaultRetryCount,
    $core.bool? autoUpdateGoldenFiles,
    $core.String? goldenBasedirForFailure,
  }) {
    final _result = create();
    if (reportSuiteInfo != null) {
      _result.reportSuiteInfo = reportSuiteInfo;
    }
    if (executionFilter != null) {
      _result.executionFilter = executionFilter;
    }
    if (defaultRetryCount != null) {
      _result.defaultRetryCount = defaultRetryCount;
    }
    if (autoUpdateGoldenFiles != null) {
      _result.autoUpdateGoldenFiles = autoUpdateGoldenFiles;
    }
    if (goldenBasedirForFailure != null) {
      _result.goldenBasedirForFailure = goldenBasedirForFailure;
    }
    return _result;
  }
  factory WorkerCurrentRunConfig_IntegrationTest.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory WorkerCurrentRunConfig_IntegrationTest.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  WorkerCurrentRunConfig_IntegrationTest clone() => WorkerCurrentRunConfig_IntegrationTest()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  WorkerCurrentRunConfig_IntegrationTest copyWith(void Function(WorkerCurrentRunConfig_IntegrationTest) updates) =>
      super.copyWith((message) => updates(message as WorkerCurrentRunConfig_IntegrationTest))
          as WorkerCurrentRunConfig_IntegrationTest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static WorkerCurrentRunConfig_IntegrationTest create() => WorkerCurrentRunConfig_IntegrationTest._();
  WorkerCurrentRunConfig_IntegrationTest createEmptyInstance() => create();
  static $pb.PbList<WorkerCurrentRunConfig_IntegrationTest> createRepeated() =>
      $pb.PbList<WorkerCurrentRunConfig_IntegrationTest>();
  @$core.pragma('dart2js:noInline')
  static WorkerCurrentRunConfig_IntegrationTest getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<WorkerCurrentRunConfig_IntegrationTest>(create);
  static WorkerCurrentRunConfig_IntegrationTest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get reportSuiteInfo => $_getBF(0);
  @$pb.TagNumber(1)
  set reportSuiteInfo($core.bool v) {
    $_setBool(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasReportSuiteInfo() => $_has(0);
  @$pb.TagNumber(1)
  void clearReportSuiteInfo() => clearField(1);

  @$pb.TagNumber(2)
  ExecutionFilter get executionFilter => $_getN(1);
  @$pb.TagNumber(2)
  set executionFilter(ExecutionFilter v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasExecutionFilter() => $_has(1);
  @$pb.TagNumber(2)
  void clearExecutionFilter() => clearField(2);
  @$pb.TagNumber(2)
  ExecutionFilter ensureExecutionFilter() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.int get defaultRetryCount => $_getIZ(2);
  @$pb.TagNumber(3)
  set defaultRetryCount($core.int v) {
    $_setSignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasDefaultRetryCount() => $_has(2);
  @$pb.TagNumber(3)
  void clearDefaultRetryCount() => clearField(3);

  @$pb.TagNumber(4)
  $core.bool get autoUpdateGoldenFiles => $_getBF(3);
  @$pb.TagNumber(4)
  set autoUpdateGoldenFiles($core.bool v) {
    $_setBool(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasAutoUpdateGoldenFiles() => $_has(3);
  @$pb.TagNumber(4)
  void clearAutoUpdateGoldenFiles() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get goldenBasedirForFailure => $_getSZ(4);
  @$pb.TagNumber(5)
  set goldenBasedirForFailure($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasGoldenBasedirForFailure() => $_has(4);
  @$pb.TagNumber(5)
  void clearGoldenBasedirForFailure() => clearField(5);
}

enum WorkerCurrentRunConfig_SubType { interactiveApp, integrationTest, notSet }

class WorkerCurrentRunConfig extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, WorkerCurrentRunConfig_SubType> _WorkerCurrentRunConfig_SubTypeByTag = {
    1: WorkerCurrentRunConfig_SubType.interactiveApp,
    2: WorkerCurrentRunConfig_SubType.integrationTest,
    0: WorkerCurrentRunConfig_SubType.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'WorkerCurrentRunConfig',
      createEmptyInstance: create)
    ..oo(0, [1, 2])
    ..aOM<WorkerCurrentRunConfig_InteractiveApp>(
        1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'interactiveApp',
        subBuilder: WorkerCurrentRunConfig_InteractiveApp.create)
    ..aOM<WorkerCurrentRunConfig_IntegrationTest>(
        2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'integrationTest',
        subBuilder: WorkerCurrentRunConfig_IntegrationTest.create)
    ..hasRequiredFields = false;

  WorkerCurrentRunConfig._() : super();
  factory WorkerCurrentRunConfig({
    WorkerCurrentRunConfig_InteractiveApp? interactiveApp,
    WorkerCurrentRunConfig_IntegrationTest? integrationTest,
  }) {
    final _result = create();
    if (interactiveApp != null) {
      _result.interactiveApp = interactiveApp;
    }
    if (integrationTest != null) {
      _result.integrationTest = integrationTest;
    }
    return _result;
  }
  factory WorkerCurrentRunConfig.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory WorkerCurrentRunConfig.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  WorkerCurrentRunConfig clone() => WorkerCurrentRunConfig()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  WorkerCurrentRunConfig copyWith(void Function(WorkerCurrentRunConfig) updates) =>
      super.copyWith((message) => updates(message as WorkerCurrentRunConfig))
          as WorkerCurrentRunConfig; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static WorkerCurrentRunConfig create() => WorkerCurrentRunConfig._();
  WorkerCurrentRunConfig createEmptyInstance() => create();
  static $pb.PbList<WorkerCurrentRunConfig> createRepeated() => $pb.PbList<WorkerCurrentRunConfig>();
  @$core.pragma('dart2js:noInline')
  static WorkerCurrentRunConfig getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<WorkerCurrentRunConfig>(create);
  static WorkerCurrentRunConfig? _defaultInstance;

  WorkerCurrentRunConfig_SubType whichSubType() => _WorkerCurrentRunConfig_SubTypeByTag[$_whichOneof(0)]!;
  void clearSubType() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  WorkerCurrentRunConfig_InteractiveApp get interactiveApp => $_getN(0);
  @$pb.TagNumber(1)
  set interactiveApp(WorkerCurrentRunConfig_InteractiveApp v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasInteractiveApp() => $_has(0);
  @$pb.TagNumber(1)
  void clearInteractiveApp() => clearField(1);
  @$pb.TagNumber(1)
  WorkerCurrentRunConfig_InteractiveApp ensureInteractiveApp() => $_ensure(0);

  @$pb.TagNumber(2)
  WorkerCurrentRunConfig_IntegrationTest get integrationTest => $_getN(1);
  @$pb.TagNumber(2)
  set integrationTest(WorkerCurrentRunConfig_IntegrationTest v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasIntegrationTest() => $_has(1);
  @$pb.TagNumber(2)
  void clearIntegrationTest() => clearField(2);
  @$pb.TagNumber(2)
  WorkerCurrentRunConfig_IntegrationTest ensureIntegrationTest() => $_ensure(1);
}

class ExecutionFilter_Strategy_FirstMatch extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ExecutionFilter.Strategy.FirstMatch',
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  ExecutionFilter_Strategy_FirstMatch._() : super();
  factory ExecutionFilter_Strategy_FirstMatch() => create();
  factory ExecutionFilter_Strategy_FirstMatch.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ExecutionFilter_Strategy_FirstMatch.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ExecutionFilter_Strategy_FirstMatch clone() => ExecutionFilter_Strategy_FirstMatch()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ExecutionFilter_Strategy_FirstMatch copyWith(void Function(ExecutionFilter_Strategy_FirstMatch) updates) =>
      super.copyWith((message) => updates(message as ExecutionFilter_Strategy_FirstMatch))
          as ExecutionFilter_Strategy_FirstMatch; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ExecutionFilter_Strategy_FirstMatch create() => ExecutionFilter_Strategy_FirstMatch._();
  ExecutionFilter_Strategy_FirstMatch createEmptyInstance() => create();
  static $pb.PbList<ExecutionFilter_Strategy_FirstMatch> createRepeated() =>
      $pb.PbList<ExecutionFilter_Strategy_FirstMatch>();
  @$core.pragma('dart2js:noInline')
  static ExecutionFilter_Strategy_FirstMatch getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ExecutionFilter_Strategy_FirstMatch>(create);
  static ExecutionFilter_Strategy_FirstMatch? _defaultInstance;
}

class ExecutionFilter_Strategy_NextMatch extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ExecutionFilter.Strategy.NextMatch',
      createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'prevTestName')
    ..hasRequiredFields = false;

  ExecutionFilter_Strategy_NextMatch._() : super();
  factory ExecutionFilter_Strategy_NextMatch({
    $core.String? prevTestName,
  }) {
    final _result = create();
    if (prevTestName != null) {
      _result.prevTestName = prevTestName;
    }
    return _result;
  }
  factory ExecutionFilter_Strategy_NextMatch.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ExecutionFilter_Strategy_NextMatch.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ExecutionFilter_Strategy_NextMatch clone() => ExecutionFilter_Strategy_NextMatch()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ExecutionFilter_Strategy_NextMatch copyWith(void Function(ExecutionFilter_Strategy_NextMatch) updates) =>
      super.copyWith((message) => updates(message as ExecutionFilter_Strategy_NextMatch))
          as ExecutionFilter_Strategy_NextMatch; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ExecutionFilter_Strategy_NextMatch create() => ExecutionFilter_Strategy_NextMatch._();
  ExecutionFilter_Strategy_NextMatch createEmptyInstance() => create();
  static $pb.PbList<ExecutionFilter_Strategy_NextMatch> createRepeated() =>
      $pb.PbList<ExecutionFilter_Strategy_NextMatch>();
  @$core.pragma('dart2js:noInline')
  static ExecutionFilter_Strategy_NextMatch getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ExecutionFilter_Strategy_NextMatch>(create);
  static ExecutionFilter_Strategy_NextMatch? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get prevTestName => $_getSZ(0);
  @$pb.TagNumber(1)
  set prevTestName($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasPrevTestName() => $_has(0);
  @$pb.TagNumber(1)
  void clearPrevTestName() => clearField(1);
}

class ExecutionFilter_Strategy_AllMatch extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ExecutionFilter.Strategy.AllMatch',
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  ExecutionFilter_Strategy_AllMatch._() : super();
  factory ExecutionFilter_Strategy_AllMatch() => create();
  factory ExecutionFilter_Strategy_AllMatch.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ExecutionFilter_Strategy_AllMatch.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ExecutionFilter_Strategy_AllMatch clone() => ExecutionFilter_Strategy_AllMatch()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ExecutionFilter_Strategy_AllMatch copyWith(void Function(ExecutionFilter_Strategy_AllMatch) updates) =>
      super.copyWith((message) => updates(message as ExecutionFilter_Strategy_AllMatch))
          as ExecutionFilter_Strategy_AllMatch; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ExecutionFilter_Strategy_AllMatch create() => ExecutionFilter_Strategy_AllMatch._();
  ExecutionFilter_Strategy_AllMatch createEmptyInstance() => create();
  static $pb.PbList<ExecutionFilter_Strategy_AllMatch> createRepeated() =>
      $pb.PbList<ExecutionFilter_Strategy_AllMatch>();
  @$core.pragma('dart2js:noInline')
  static ExecutionFilter_Strategy_AllMatch getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ExecutionFilter_Strategy_AllMatch>(create);
  static ExecutionFilter_Strategy_AllMatch? _defaultInstance;
}

enum ExecutionFilter_Strategy_SubType { firstMatch, nextMatch, allMatch, notSet }

class ExecutionFilter_Strategy extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, ExecutionFilter_Strategy_SubType> _ExecutionFilter_Strategy_SubTypeByTag = {
    1: ExecutionFilter_Strategy_SubType.firstMatch,
    2: ExecutionFilter_Strategy_SubType.nextMatch,
    3: ExecutionFilter_Strategy_SubType.allMatch,
    0: ExecutionFilter_Strategy_SubType.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ExecutionFilter.Strategy',
      createEmptyInstance: create)
    ..oo(0, [1, 2, 3])
    ..aOM<ExecutionFilter_Strategy_FirstMatch>(
        1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'firstMatch',
        subBuilder: ExecutionFilter_Strategy_FirstMatch.create)
    ..aOM<ExecutionFilter_Strategy_NextMatch>(
        2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'nextMatch',
        subBuilder: ExecutionFilter_Strategy_NextMatch.create)
    ..aOM<ExecutionFilter_Strategy_AllMatch>(
        3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'allMatch',
        subBuilder: ExecutionFilter_Strategy_AllMatch.create)
    ..hasRequiredFields = false;

  ExecutionFilter_Strategy._() : super();
  factory ExecutionFilter_Strategy({
    ExecutionFilter_Strategy_FirstMatch? firstMatch,
    ExecutionFilter_Strategy_NextMatch? nextMatch,
    ExecutionFilter_Strategy_AllMatch? allMatch,
  }) {
    final _result = create();
    if (firstMatch != null) {
      _result.firstMatch = firstMatch;
    }
    if (nextMatch != null) {
      _result.nextMatch = nextMatch;
    }
    if (allMatch != null) {
      _result.allMatch = allMatch;
    }
    return _result;
  }
  factory ExecutionFilter_Strategy.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ExecutionFilter_Strategy.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ExecutionFilter_Strategy clone() => ExecutionFilter_Strategy()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ExecutionFilter_Strategy copyWith(void Function(ExecutionFilter_Strategy) updates) =>
      super.copyWith((message) => updates(message as ExecutionFilter_Strategy))
          as ExecutionFilter_Strategy; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ExecutionFilter_Strategy create() => ExecutionFilter_Strategy._();
  ExecutionFilter_Strategy createEmptyInstance() => create();
  static $pb.PbList<ExecutionFilter_Strategy> createRepeated() => $pb.PbList<ExecutionFilter_Strategy>();
  @$core.pragma('dart2js:noInline')
  static ExecutionFilter_Strategy getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ExecutionFilter_Strategy>(create);
  static ExecutionFilter_Strategy? _defaultInstance;

  ExecutionFilter_Strategy_SubType whichSubType() => _ExecutionFilter_Strategy_SubTypeByTag[$_whichOneof(0)]!;
  void clearSubType() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  ExecutionFilter_Strategy_FirstMatch get firstMatch => $_getN(0);
  @$pb.TagNumber(1)
  set firstMatch(ExecutionFilter_Strategy_FirstMatch v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasFirstMatch() => $_has(0);
  @$pb.TagNumber(1)
  void clearFirstMatch() => clearField(1);
  @$pb.TagNumber(1)
  ExecutionFilter_Strategy_FirstMatch ensureFirstMatch() => $_ensure(0);

  @$pb.TagNumber(2)
  ExecutionFilter_Strategy_NextMatch get nextMatch => $_getN(1);
  @$pb.TagNumber(2)
  set nextMatch(ExecutionFilter_Strategy_NextMatch v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasNextMatch() => $_has(1);
  @$pb.TagNumber(2)
  void clearNextMatch() => clearField(2);
  @$pb.TagNumber(2)
  ExecutionFilter_Strategy_NextMatch ensureNextMatch() => $_ensure(1);

  @$pb.TagNumber(3)
  ExecutionFilter_Strategy_AllMatch get allMatch => $_getN(2);
  @$pb.TagNumber(3)
  set allMatch(ExecutionFilter_Strategy_AllMatch v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasAllMatch() => $_has(2);
  @$pb.TagNumber(3)
  void clearAllMatch() => clearField(3);
  @$pb.TagNumber(3)
  ExecutionFilter_Strategy_AllMatch ensureAllMatch() => $_ensure(2);
}

class ExecutionFilter extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ExecutionFilter',
      createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'filterNameRegex')
    ..aOM<ExecutionFilter_Strategy>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'strategy',
        subBuilder: ExecutionFilter_Strategy.create)
    ..hasRequiredFields = false;

  ExecutionFilter._() : super();
  factory ExecutionFilter({
    $core.String? filterNameRegex,
    ExecutionFilter_Strategy? strategy,
  }) {
    final _result = create();
    if (filterNameRegex != null) {
      _result.filterNameRegex = filterNameRegex;
    }
    if (strategy != null) {
      _result.strategy = strategy;
    }
    return _result;
  }
  factory ExecutionFilter.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ExecutionFilter.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ExecutionFilter clone() => ExecutionFilter()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ExecutionFilter copyWith(void Function(ExecutionFilter) updates) =>
      super.copyWith((message) => updates(message as ExecutionFilter))
          as ExecutionFilter; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ExecutionFilter create() => ExecutionFilter._();
  ExecutionFilter createEmptyInstance() => create();
  static $pb.PbList<ExecutionFilter> createRepeated() => $pb.PbList<ExecutionFilter>();
  @$core.pragma('dart2js:noInline')
  static ExecutionFilter getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ExecutionFilter>(create);
  static ExecutionFilter? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get filterNameRegex => $_getSZ(0);
  @$pb.TagNumber(1)
  set filterNameRegex($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasFilterNameRegex() => $_has(0);
  @$pb.TagNumber(1)
  void clearFilterNameRegex() => clearField(1);

  @$pb.TagNumber(2)
  ExecutionFilter_Strategy get strategy => $_getN(1);
  @$pb.TagNumber(2)
  set strategy(ExecutionFilter_Strategy v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasStrategy() => $_has(1);
  @$pb.TagNumber(2)
  void clearStrategy() => clearField(2);
  @$pb.TagNumber(2)
  ExecutionFilter_Strategy ensureStrategy() => $_ensure(1);
}

class ResolvedExecutionFilterProto extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ResolvedExecutionFilterProto',
      createEmptyInstance: create)
    ..pPS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'allowExecuteTestNames')
    ..hasRequiredFields = false;

  ResolvedExecutionFilterProto._() : super();
  factory ResolvedExecutionFilterProto({
    $core.Iterable<$core.String>? allowExecuteTestNames,
  }) {
    final _result = create();
    if (allowExecuteTestNames != null) {
      _result.allowExecuteTestNames.addAll(allowExecuteTestNames);
    }
    return _result;
  }
  factory ResolvedExecutionFilterProto.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResolvedExecutionFilterProto.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResolvedExecutionFilterProto clone() => ResolvedExecutionFilterProto()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResolvedExecutionFilterProto copyWith(void Function(ResolvedExecutionFilterProto) updates) =>
      super.copyWith((message) => updates(message as ResolvedExecutionFilterProto))
          as ResolvedExecutionFilterProto; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResolvedExecutionFilterProto create() => ResolvedExecutionFilterProto._();
  ResolvedExecutionFilterProto createEmptyInstance() => create();
  static $pb.PbList<ResolvedExecutionFilterProto> createRepeated() => $pb.PbList<ResolvedExecutionFilterProto>();
  @$core.pragma('dart2js:noInline')
  static ResolvedExecutionFilterProto getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ResolvedExecutionFilterProto>(create);
  static ResolvedExecutionFilterProto? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.String> get allowExecuteTestNames => $_getList(0);
}

class Empty extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Empty',
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  Empty._() : super();
  factory Empty() => create();
  factory Empty.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory Empty.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  Empty clone() => Empty()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  Empty copyWith(void Function(Empty) updates) =>
      super.copyWith((message) => updates(message as Empty)) as Empty; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Empty create() => Empty._();
  Empty createEmptyInstance() => create();
  static $pb.PbList<Empty> createRepeated() => $pb.PbList<Empty>();
  @$core.pragma('dart2js:noInline')
  static Empty getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Empty>(create);
  static Empty? _defaultInstance;
}
