///
//  Generated code. Do not modify.
//  source: convenient_test.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

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

enum ReportItem_SubType { suiteInfoProto, logEntry, runnerStateChange, runnerError, runnerMessage, snapshot, notSet }

class ReportItem extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, ReportItem_SubType> _ReportItem_SubTypeByTag = {
    1: ReportItem_SubType.suiteInfoProto,
    2: ReportItem_SubType.logEntry,
    3: ReportItem_SubType.runnerStateChange,
    4: ReportItem_SubType.runnerError,
    5: ReportItem_SubType.runnerMessage,
    6: ReportItem_SubType.snapshot,
    0: ReportItem_SubType.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ReportItem',
      createEmptyInstance: create)
    ..oo(0, [1, 2, 3, 4, 5, 6])
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
    ..hasRequiredFields = false;

  ReportItem._() : super();
  factory ReportItem({
    SuiteInfoProto? suiteInfoProto,
    LogEntry? logEntry,
    RunnerStateChange? runnerStateChange,
    RunnerError? runnerError,
    RunnerMessage? runnerMessage,
    Snapshot? snapshot,
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
}

class LogEntry extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'LogEntry',
      createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id', $pb.PbFieldType.O3)
    ..pPS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'entryLocators')
    ..e<LogEntryType>(
        3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'type', $pb.PbFieldType.OE,
        defaultOrMaker: LogEntryType.INVALID, valueOf: LogEntryType.valueOf, enumValues: LogEntryType.values)
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'title')
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'message')
    ..aOS(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'error')
    ..aOS(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'stackTrace')
    ..hasRequiredFields = false;

  LogEntry._() : super();
  factory LogEntry({
    $core.int? id,
    $core.Iterable<$core.String>? entryLocators,
    LogEntryType? type,
    $core.String? title,
    $core.String? message,
    $core.String? error,
    $core.String? stackTrace,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (entryLocators != null) {
      _result.entryLocators.addAll(entryLocators);
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
  $core.int get id => $_getIZ(0);
  @$pb.TagNumber(1)
  set id($core.int v) {
    $_setSignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.String> get entryLocators => $_getList(1);

  @$pb.TagNumber(3)
  LogEntryType get type => $_getN(2);
  @$pb.TagNumber(3)
  set type(LogEntryType v) {
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
    ..a<$core.int>(
        1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'groupId', $pb.PbFieldType.O3)
    ..pc<GroupInfoProto>(
        2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'groups', $pb.PbFieldType.PM,
        subBuilder: GroupInfoProto.create)
    ..pc<TestInfoProto>(
        3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'tests', $pb.PbFieldType.PM,
        subBuilder: TestInfoProto.create)
    ..hasRequiredFields = false;

  SuiteInfoProto._() : super();
  factory SuiteInfoProto({
    $core.int? groupId,
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
  $core.int get groupId => $_getIZ(0);
  @$pb.TagNumber(1)
  set groupId($core.int v) {
    $_setSignedInt32(0, v);
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
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id', $pb.PbFieldType.O3)
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..a<$core.int>(
        3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'parentId', $pb.PbFieldType.O3)
    ..p<$core.int>(
        4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'entryIds', $pb.PbFieldType.P3)
    ..hasRequiredFields = false;

  GroupInfoProto._() : super();
  factory GroupInfoProto({
    $core.int? id,
    $core.String? name,
    $core.int? parentId,
    $core.Iterable<$core.int>? entryIds,
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
  $core.int get id => $_getIZ(0);
  @$pb.TagNumber(1)
  set id($core.int v) {
    $_setSignedInt32(0, v);
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
  $core.int get parentId => $_getIZ(2);
  @$pb.TagNumber(3)
  set parentId($core.int v) {
    $_setSignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasParentId() => $_has(2);
  @$pb.TagNumber(3)
  void clearParentId() => clearField(3);

  @$pb.TagNumber(4)
  $core.List<$core.int> get entryIds => $_getList(3);
}

class TestInfoProto extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'TestInfoProto',
      createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id', $pb.PbFieldType.O3)
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..a<$core.int>(
        3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'parentId', $pb.PbFieldType.O3)
    ..hasRequiredFields = false;

  TestInfoProto._() : super();
  factory TestInfoProto({
    $core.int? id,
    $core.String? name,
    $core.int? parentId,
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
  $core.int get id => $_getIZ(0);
  @$pb.TagNumber(1)
  set id($core.int v) {
    $_setSignedInt32(0, v);
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
  $core.int get parentId => $_getIZ(2);
  @$pb.TagNumber(3)
  set parentId($core.int v) {
    $_setSignedInt32(2, v);
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
    ..pPS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'entryLocators')
    ..aOM<TestEntryState>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'state',
        subBuilder: TestEntryState.create)
    ..hasRequiredFields = false;

  RunnerStateChange._() : super();
  factory RunnerStateChange({
    $core.Iterable<$core.String>? entryLocators,
    TestEntryState? state,
  }) {
    final _result = create();
    if (entryLocators != null) {
      _result.entryLocators.addAll(entryLocators);
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
  $core.List<$core.String> get entryLocators => $_getList(0);

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
    ..pPS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'entryLocators')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'error')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'stackTrace')
    ..hasRequiredFields = false;

  RunnerError._() : super();
  factory RunnerError({
    $core.Iterable<$core.String>? entryLocators,
    $core.String? error,
    $core.String? stackTrace,
  }) {
    final _result = create();
    if (entryLocators != null) {
      _result.entryLocators.addAll(entryLocators);
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
  $core.List<$core.String> get entryLocators => $_getList(0);

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
    ..pPS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'entryLocators')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'message')
    ..hasRequiredFields = false;

  RunnerMessage._() : super();
  factory RunnerMessage({
    $core.Iterable<$core.String>? entryLocators,
    $core.String? message,
  }) {
    final _result = create();
    if (entryLocators != null) {
      _result.entryLocators.addAll(entryLocators);
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
  $core.List<$core.String> get entryLocators => $_getList(0);

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
    ..a<$core.int>(
        1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'logEntryId', $pb.PbFieldType.O3)
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..a<$core.List<$core.int>>(
        3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'image', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  Snapshot._() : super();
  factory Snapshot({
    $core.int? logEntryId,
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
  $core.int get logEntryId => $_getIZ(0);
  @$pb.TagNumber(1)
  set logEntryId($core.int v) {
    $_setSignedInt32(0, v);
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

enum WorkerMode_SubType { interactiveApp, integrationTest, notSet }

class WorkerMode extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, WorkerMode_SubType> _WorkerMode_SubTypeByTag = {
    1: WorkerMode_SubType.interactiveApp,
    2: WorkerMode_SubType.integrationTest,
    0: WorkerMode_SubType.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'WorkerMode',
      createEmptyInstance: create)
    ..oo(0, [1, 2])
    ..aOM<WorkerModeInteractiveApp>(
        1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'interactiveApp',
        subBuilder: WorkerModeInteractiveApp.create)
    ..aOM<WorkerModeIntegrationTest>(
        2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'integrationTest',
        subBuilder: WorkerModeIntegrationTest.create)
    ..hasRequiredFields = false;

  WorkerMode._() : super();
  factory WorkerMode({
    WorkerModeInteractiveApp? interactiveApp,
    WorkerModeIntegrationTest? integrationTest,
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
  factory WorkerMode.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory WorkerMode.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  WorkerMode clone() => WorkerMode()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  WorkerMode copyWith(void Function(WorkerMode) updates) =>
      super.copyWith((message) => updates(message as WorkerMode)) as WorkerMode; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static WorkerMode create() => WorkerMode._();
  WorkerMode createEmptyInstance() => create();
  static $pb.PbList<WorkerMode> createRepeated() => $pb.PbList<WorkerMode>();
  @$core.pragma('dart2js:noInline')
  static WorkerMode getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<WorkerMode>(create);
  static WorkerMode? _defaultInstance;

  WorkerMode_SubType whichSubType() => _WorkerMode_SubTypeByTag[$_whichOneof(0)]!;
  void clearSubType() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  WorkerModeInteractiveApp get interactiveApp => $_getN(0);
  @$pb.TagNumber(1)
  set interactiveApp(WorkerModeInteractiveApp v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasInteractiveApp() => $_has(0);
  @$pb.TagNumber(1)
  void clearInteractiveApp() => clearField(1);
  @$pb.TagNumber(1)
  WorkerModeInteractiveApp ensureInteractiveApp() => $_ensure(0);

  @$pb.TagNumber(2)
  WorkerModeIntegrationTest get integrationTest => $_getN(1);
  @$pb.TagNumber(2)
  set integrationTest(WorkerModeIntegrationTest v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasIntegrationTest() => $_has(1);
  @$pb.TagNumber(2)
  void clearIntegrationTest() => clearField(2);
  @$pb.TagNumber(2)
  WorkerModeIntegrationTest ensureIntegrationTest() => $_ensure(1);
}

class WorkerModeInteractiveApp extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'WorkerModeInteractiveApp',
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  WorkerModeInteractiveApp._() : super();
  factory WorkerModeInteractiveApp() => create();
  factory WorkerModeInteractiveApp.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory WorkerModeInteractiveApp.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  WorkerModeInteractiveApp clone() => WorkerModeInteractiveApp()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  WorkerModeInteractiveApp copyWith(void Function(WorkerModeInteractiveApp) updates) =>
      super.copyWith((message) => updates(message as WorkerModeInteractiveApp))
          as WorkerModeInteractiveApp; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static WorkerModeInteractiveApp create() => WorkerModeInteractiveApp._();
  WorkerModeInteractiveApp createEmptyInstance() => create();
  static $pb.PbList<WorkerModeInteractiveApp> createRepeated() => $pb.PbList<WorkerModeInteractiveApp>();
  @$core.pragma('dart2js:noInline')
  static WorkerModeInteractiveApp getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<WorkerModeInteractiveApp>(create);
  static WorkerModeInteractiveApp? _defaultInstance;
}

class WorkerModeIntegrationTest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'WorkerModeIntegrationTest',
      createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'filterNameRegex')
    ..hasRequiredFields = false;

  WorkerModeIntegrationTest._() : super();
  factory WorkerModeIntegrationTest({
    $core.String? filterNameRegex,
  }) {
    final _result = create();
    if (filterNameRegex != null) {
      _result.filterNameRegex = filterNameRegex;
    }
    return _result;
  }
  factory WorkerModeIntegrationTest.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory WorkerModeIntegrationTest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  WorkerModeIntegrationTest clone() => WorkerModeIntegrationTest()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  WorkerModeIntegrationTest copyWith(void Function(WorkerModeIntegrationTest) updates) =>
      super.copyWith((message) => updates(message as WorkerModeIntegrationTest))
          as WorkerModeIntegrationTest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static WorkerModeIntegrationTest create() => WorkerModeIntegrationTest._();
  WorkerModeIntegrationTest createEmptyInstance() => create();
  static $pb.PbList<WorkerModeIntegrationTest> createRepeated() => $pb.PbList<WorkerModeIntegrationTest>();
  @$core.pragma('dart2js:noInline')
  static WorkerModeIntegrationTest getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<WorkerModeIntegrationTest>(create);
  static WorkerModeIntegrationTest? _defaultInstance;

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
