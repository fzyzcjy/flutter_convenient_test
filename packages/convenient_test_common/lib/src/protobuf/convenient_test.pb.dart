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

class LogEntry extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'LogEntry',
      createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id', $pb.PbFieldType.O3)
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'testGroupName')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'testEntryName')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'message')
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'title')
    ..e<LogEntryType>(
        6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'type', $pb.PbFieldType.OE,
        defaultOrMaker: LogEntryType.INVALID, valueOf: LogEntryType.valueOf, enumValues: LogEntryType.values)
    ..aOS(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'error')
    ..aOS(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'stackTrace')
    ..hasRequiredFields = false;

  LogEntry._() : super();
  factory LogEntry({
    $core.int? id,
    $core.String? testGroupName,
    $core.String? testEntryName,
    $core.String? message,
    $core.String? title,
    LogEntryType? type,
    $core.String? error,
    $core.String? stackTrace,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (testGroupName != null) {
      _result.testGroupName = testGroupName;
    }
    if (testEntryName != null) {
      _result.testEntryName = testEntryName;
    }
    if (message != null) {
      _result.message = message;
    }
    if (title != null) {
      _result.title = title;
    }
    if (type != null) {
      _result.type = type;
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
  $core.String get testGroupName => $_getSZ(1);
  @$pb.TagNumber(2)
  set testGroupName($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasTestGroupName() => $_has(1);
  @$pb.TagNumber(2)
  void clearTestGroupName() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get testEntryName => $_getSZ(2);
  @$pb.TagNumber(3)
  set testEntryName($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasTestEntryName() => $_has(2);
  @$pb.TagNumber(3)
  void clearTestEntryName() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get message => $_getSZ(3);
  @$pb.TagNumber(4)
  set message($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasMessage() => $_has(3);
  @$pb.TagNumber(4)
  void clearMessage() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get title => $_getSZ(4);
  @$pb.TagNumber(5)
  set title($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasTitle() => $_has(4);
  @$pb.TagNumber(5)
  void clearTitle() => clearField(5);

  @$pb.TagNumber(6)
  LogEntryType get type => $_getN(5);
  @$pb.TagNumber(6)
  set type(LogEntryType v) {
    setField(6, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasType() => $_has(5);
  @$pb.TagNumber(6)
  void clearType() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get error => $_getSZ(6);
  @$pb.TagNumber(7)
  set error($core.String v) {
    $_setString(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasError() => $_has(6);
  @$pb.TagNumber(7)
  void clearError() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get stackTrace => $_getSZ(7);
  @$pb.TagNumber(8)
  set stackTrace($core.String v) {
    $_setString(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasStackTrace() => $_has(7);
  @$pb.TagNumber(8)
  void clearStackTrace() => clearField(8);
}

class TestInfoPack extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'TestInfoPack',
      createEmptyInstance: create)
    ..pc<TestEntryInfo>(
        1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'entries', $pb.PbFieldType.PM,
        subBuilder: TestEntryInfo.create)
    ..hasRequiredFields = false;

  TestInfoPack._() : super();
  factory TestInfoPack({
    $core.Iterable<TestEntryInfo>? entries,
  }) {
    final _result = create();
    if (entries != null) {
      _result.entries.addAll(entries);
    }
    return _result;
  }
  factory TestInfoPack.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory TestInfoPack.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  TestInfoPack clone() => TestInfoPack()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  TestInfoPack copyWith(void Function(TestInfoPack) updates) =>
      super.copyWith((message) => updates(message as TestInfoPack)) as TestInfoPack; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TestInfoPack create() => TestInfoPack._();
  TestInfoPack createEmptyInstance() => create();
  static $pb.PbList<TestInfoPack> createRepeated() => $pb.PbList<TestInfoPack>();
  @$core.pragma('dart2js:noInline')
  static TestInfoPack getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TestInfoPack>(create);
  static TestInfoPack? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<TestEntryInfo> get entries => $_getList(0);
}

class TestEntryInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'TestEntryInfo',
      createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'testGroupName')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'testEntryName')
    ..hasRequiredFields = false;

  TestEntryInfo._() : super();
  factory TestEntryInfo({
    $core.String? testGroupName,
    $core.String? testEntryName,
  }) {
    final _result = create();
    if (testGroupName != null) {
      _result.testGroupName = testGroupName;
    }
    if (testEntryName != null) {
      _result.testEntryName = testEntryName;
    }
    return _result;
  }
  factory TestEntryInfo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory TestEntryInfo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  TestEntryInfo clone() => TestEntryInfo()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  TestEntryInfo copyWith(void Function(TestEntryInfo) updates) =>
      super.copyWith((message) => updates(message as TestEntryInfo)) as TestEntryInfo; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TestEntryInfo create() => TestEntryInfo._();
  TestEntryInfo createEmptyInstance() => create();
  static $pb.PbList<TestEntryInfo> createRepeated() => $pb.PbList<TestEntryInfo>();
  @$core.pragma('dart2js:noInline')
  static TestEntryInfo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TestEntryInfo>(create);
  static TestEntryInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get testGroupName => $_getSZ(0);
  @$pb.TagNumber(1)
  set testGroupName($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasTestGroupName() => $_has(0);
  @$pb.TagNumber(1)
  void clearTestGroupName() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get testEntryName => $_getSZ(1);
  @$pb.TagNumber(2)
  set testEntryName($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasTestEntryName() => $_has(1);
  @$pb.TagNumber(2)
  void clearTestEntryName() => clearField(2);
}

class RunnerStateChange extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'RunnerStateChange',
      createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'testEntryName')
    ..aOM<TestEntryState>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'state',
        subBuilder: TestEntryState.create)
    ..hasRequiredFields = false;

  RunnerStateChange._() : super();
  factory RunnerStateChange({
    $core.String? testEntryName,
    TestEntryState? state,
  }) {
    final _result = create();
    if (testEntryName != null) {
      _result.testEntryName = testEntryName;
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
  $core.String get testEntryName => $_getSZ(0);
  @$pb.TagNumber(1)
  set testEntryName($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasTestEntryName() => $_has(0);
  @$pb.TagNumber(1)
  void clearTestEntryName() => clearField(1);

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
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'testEntryName')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'error')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'stackTrace')
    ..hasRequiredFields = false;

  RunnerError._() : super();
  factory RunnerError({
    $core.String? testEntryName,
    $core.String? error,
    $core.String? stackTrace,
  }) {
    final _result = create();
    if (testEntryName != null) {
      _result.testEntryName = testEntryName;
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
  $core.String get testEntryName => $_getSZ(0);
  @$pb.TagNumber(1)
  set testEntryName($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasTestEntryName() => $_has(0);
  @$pb.TagNumber(1)
  void clearTestEntryName() => clearField(1);

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
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'testEntryName')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'message')
    ..hasRequiredFields = false;

  RunnerMessage._() : super();
  factory RunnerMessage({
    $core.String? testEntryName,
    $core.String? message,
  }) {
    final _result = create();
    if (testEntryName != null) {
      _result.testEntryName = testEntryName;
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
  $core.String get testEntryName => $_getSZ(0);
  @$pb.TagNumber(1)
  set testEntryName($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasTestEntryName() => $_has(0);
  @$pb.TagNumber(1)
  void clearTestEntryName() => clearField(1);

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

class TestFilter extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'TestFilter',
      createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'filterNameRegex')
    ..hasRequiredFields = false;

  TestFilter._() : super();
  factory TestFilter({
    $core.String? filterNameRegex,
  }) {
    final _result = create();
    if (filterNameRegex != null) {
      _result.filterNameRegex = filterNameRegex;
    }
    return _result;
  }
  factory TestFilter.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory TestFilter.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  TestFilter clone() => TestFilter()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  TestFilter copyWith(void Function(TestFilter) updates) =>
      super.copyWith((message) => updates(message as TestFilter)) as TestFilter; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TestFilter create() => TestFilter._();
  TestFilter createEmptyInstance() => create();
  static $pb.PbList<TestFilter> createRepeated() => $pb.PbList<TestFilter>();
  @$core.pragma('dart2js:noInline')
  static TestFilter getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TestFilter>(create);
  static TestFilter? _defaultInstance;

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

class ManagerToWorkerAction extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ManagerToWorkerAction',
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  ManagerToWorkerAction._() : super();
  factory ManagerToWorkerAction() => create();
  factory ManagerToWorkerAction.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ManagerToWorkerAction.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ManagerToWorkerAction clone() => ManagerToWorkerAction()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ManagerToWorkerAction copyWith(void Function(ManagerToWorkerAction) updates) =>
      super.copyWith((message) => updates(message as ManagerToWorkerAction))
          as ManagerToWorkerAction; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ManagerToWorkerAction create() => ManagerToWorkerAction._();
  ManagerToWorkerAction createEmptyInstance() => create();
  static $pb.PbList<ManagerToWorkerAction> createRepeated() => $pb.PbList<ManagerToWorkerAction>();
  @$core.pragma('dart2js:noInline')
  static ManagerToWorkerAction getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ManagerToWorkerAction>(create);
  static ManagerToWorkerAction? _defaultInstance;
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
