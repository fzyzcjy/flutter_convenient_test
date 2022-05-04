///
//  Generated code. Do not modify.
//  source: convenient_test.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'convenient_test.pb.dart' as $0;
export 'convenient_test.pb.dart';

class ConvenientTestManagerClient extends $grpc.Client {
  static final _$resetManagerCache = $grpc.ClientMethod<$0.Empty, $0.Empty>('/ConvenientTestManager/ResetManagerCache',
      ($0.Empty value) => value.writeToBuffer(), ($core.List<$core.int> value) => $0.Empty.fromBuffer(value));
  static final _$reportLogEntry = $grpc.ClientMethod<$0.LogEntry, $0.Empty>('/ConvenientTestManager/ReportLogEntry',
      ($0.LogEntry value) => value.writeToBuffer(), ($core.List<$core.int> value) => $0.Empty.fromBuffer(value));
  static final _$reportSuiteInfo = $grpc.ClientMethod<$0.SuiteInfoProto, $0.Empty>(
      '/ConvenientTestManager/ReportSuiteInfo',
      ($0.SuiteInfoProto value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Empty.fromBuffer(value));
  static final _$reportRunnerStateChange = $grpc.ClientMethod<$0.RunnerStateChange, $0.Empty>(
      '/ConvenientTestManager/ReportRunnerStateChange',
      ($0.RunnerStateChange value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Empty.fromBuffer(value));
  static final _$reportRunnerError = $grpc.ClientMethod<$0.RunnerError, $0.Empty>(
      '/ConvenientTestManager/ReportRunnerError',
      ($0.RunnerError value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Empty.fromBuffer(value));
  static final _$reportRunnerMessage = $grpc.ClientMethod<$0.RunnerMessage, $0.Empty>(
      '/ConvenientTestManager/ReportRunnerMessage',
      ($0.RunnerMessage value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Empty.fromBuffer(value));
  static final _$reportSnapshot = $grpc.ClientMethod<$0.Snapshot, $0.Empty>('/ConvenientTestManager/ReportSnapshot',
      ($0.Snapshot value) => value.writeToBuffer(), ($core.List<$core.int> value) => $0.Empty.fromBuffer(value));
  static final _$getWorkerMode = $grpc.ClientMethod<$0.Empty, $0.WorkerMode>('/ConvenientTestManager/GetWorkerMode',
      ($0.Empty value) => value.writeToBuffer(), ($core.List<$core.int> value) => $0.WorkerMode.fromBuffer(value));
  static final _$managerToWorkerActionStream = $grpc.ClientMethod<$0.Empty, $0.ManagerToWorkerAction>(
      '/ConvenientTestManager/ManagerToWorkerActionStream',
      ($0.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.ManagerToWorkerAction.fromBuffer(value));

  ConvenientTestManagerClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options, $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.Empty> resetManagerCache($0.Empty request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$resetManagerCache, request, options: options);
  }

  $grpc.ResponseFuture<$0.Empty> reportLogEntry($0.LogEntry request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$reportLogEntry, request, options: options);
  }

  $grpc.ResponseFuture<$0.Empty> reportSuiteInfo($0.SuiteInfoProto request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$reportSuiteInfo, request, options: options);
  }

  $grpc.ResponseFuture<$0.Empty> reportRunnerStateChange($0.RunnerStateChange request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$reportRunnerStateChange, request, options: options);
  }

  $grpc.ResponseFuture<$0.Empty> reportRunnerError($0.RunnerError request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$reportRunnerError, request, options: options);
  }

  $grpc.ResponseFuture<$0.Empty> reportRunnerMessage($0.RunnerMessage request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$reportRunnerMessage, request, options: options);
  }

  $grpc.ResponseFuture<$0.Empty> reportSnapshot($0.Snapshot request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$reportSnapshot, request, options: options);
  }

  $grpc.ResponseFuture<$0.WorkerMode> getWorkerMode($0.Empty request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getWorkerMode, request, options: options);
  }

  $grpc.ResponseStream<$0.ManagerToWorkerAction> managerToWorkerActionStream($0.Empty request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(_$managerToWorkerActionStream, $async.Stream.fromIterable([request]), options: options);
  }
}

abstract class ConvenientTestManagerServiceBase extends $grpc.Service {
  $core.String get $name => 'ConvenientTestManager';

  ConvenientTestManagerServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.Empty, $0.Empty>('ResetManagerCache', resetManagerCache_Pre, false, false,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value), ($0.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.LogEntry, $0.Empty>('ReportLogEntry', reportLogEntry_Pre, false, false,
        ($core.List<$core.int> value) => $0.LogEntry.fromBuffer(value), ($0.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.SuiteInfoProto, $0.Empty>(
        'ReportSuiteInfo',
        reportSuiteInfo_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.SuiteInfoProto.fromBuffer(value),
        ($0.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.RunnerStateChange, $0.Empty>(
        'ReportRunnerStateChange',
        reportRunnerStateChange_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.RunnerStateChange.fromBuffer(value),
        ($0.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.RunnerError, $0.Empty>('ReportRunnerError', reportRunnerError_Pre, false, false,
        ($core.List<$core.int> value) => $0.RunnerError.fromBuffer(value), ($0.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.RunnerMessage, $0.Empty>(
        'ReportRunnerMessage',
        reportRunnerMessage_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.RunnerMessage.fromBuffer(value),
        ($0.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Snapshot, $0.Empty>('ReportSnapshot', reportSnapshot_Pre, false, false,
        ($core.List<$core.int> value) => $0.Snapshot.fromBuffer(value), ($0.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Empty, $0.WorkerMode>('GetWorkerMode', getWorkerMode_Pre, false, false,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value), ($0.WorkerMode value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Empty, $0.ManagerToWorkerAction>(
        'ManagerToWorkerActionStream',
        managerToWorkerActionStream_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($0.ManagerToWorkerAction value) => value.writeToBuffer()));
  }

  $async.Future<$0.Empty> resetManagerCache_Pre($grpc.ServiceCall call, $async.Future<$0.Empty> request) async {
    return resetManagerCache(call, await request);
  }

  $async.Future<$0.Empty> reportLogEntry_Pre($grpc.ServiceCall call, $async.Future<$0.LogEntry> request) async {
    return reportLogEntry(call, await request);
  }

  $async.Future<$0.Empty> reportSuiteInfo_Pre($grpc.ServiceCall call, $async.Future<$0.SuiteInfoProto> request) async {
    return reportSuiteInfo(call, await request);
  }

  $async.Future<$0.Empty> reportRunnerStateChange_Pre(
      $grpc.ServiceCall call, $async.Future<$0.RunnerStateChange> request) async {
    return reportRunnerStateChange(call, await request);
  }

  $async.Future<$0.Empty> reportRunnerError_Pre($grpc.ServiceCall call, $async.Future<$0.RunnerError> request) async {
    return reportRunnerError(call, await request);
  }

  $async.Future<$0.Empty> reportRunnerMessage_Pre(
      $grpc.ServiceCall call, $async.Future<$0.RunnerMessage> request) async {
    return reportRunnerMessage(call, await request);
  }

  $async.Future<$0.Empty> reportSnapshot_Pre($grpc.ServiceCall call, $async.Future<$0.Snapshot> request) async {
    return reportSnapshot(call, await request);
  }

  $async.Future<$0.WorkerMode> getWorkerMode_Pre($grpc.ServiceCall call, $async.Future<$0.Empty> request) async {
    return getWorkerMode(call, await request);
  }

  $async.Stream<$0.ManagerToWorkerAction> managerToWorkerActionStream_Pre(
      $grpc.ServiceCall call, $async.Future<$0.Empty> request) async* {
    yield* managerToWorkerActionStream(call, await request);
  }

  $async.Future<$0.Empty> resetManagerCache($grpc.ServiceCall call, $0.Empty request);
  $async.Future<$0.Empty> reportLogEntry($grpc.ServiceCall call, $0.LogEntry request);
  $async.Future<$0.Empty> reportSuiteInfo($grpc.ServiceCall call, $0.SuiteInfoProto request);
  $async.Future<$0.Empty> reportRunnerStateChange($grpc.ServiceCall call, $0.RunnerStateChange request);
  $async.Future<$0.Empty> reportRunnerError($grpc.ServiceCall call, $0.RunnerError request);
  $async.Future<$0.Empty> reportRunnerMessage($grpc.ServiceCall call, $0.RunnerMessage request);
  $async.Future<$0.Empty> reportSnapshot($grpc.ServiceCall call, $0.Snapshot request);
  $async.Future<$0.WorkerMode> getWorkerMode($grpc.ServiceCall call, $0.Empty request);
  $async.Stream<$0.ManagerToWorkerAction> managerToWorkerActionStream($grpc.ServiceCall call, $0.Empty request);
}
