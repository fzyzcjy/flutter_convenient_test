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
  static final _$report = $grpc.ClientMethod<$0.ReportCollection, $0.Empty>(
      '/ConvenientTestManager/Report',
      ($0.ReportCollection value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Empty.fromBuffer(value));
  static final _$getWorkerCurrentRunConfig =
      $grpc.ClientMethod<$0.Empty, $0.WorkerCurrentRunConfig>(
          '/ConvenientTestManager/GetWorkerCurrentRunConfig',
          ($0.Empty value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.WorkerCurrentRunConfig.fromBuffer(value));

  ConvenientTestManagerClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.Empty> report($0.ReportCollection request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$report, request, options: options);
  }

  $grpc.ResponseFuture<$0.WorkerCurrentRunConfig> getWorkerCurrentRunConfig(
      $0.Empty request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getWorkerCurrentRunConfig, request,
        options: options);
  }
}

abstract class ConvenientTestManagerServiceBase extends $grpc.Service {
  $core.String get $name => 'ConvenientTestManager';

  ConvenientTestManagerServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.ReportCollection, $0.Empty>(
        'Report',
        report_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.ReportCollection.fromBuffer(value),
        ($0.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Empty, $0.WorkerCurrentRunConfig>(
        'GetWorkerCurrentRunConfig',
        getWorkerCurrentRunConfig_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($0.WorkerCurrentRunConfig value) => value.writeToBuffer()));
  }

  $async.Future<$0.Empty> report_Pre($grpc.ServiceCall call,
      $async.Future<$0.ReportCollection> request) async {
    return report(call, await request);
  }

  $async.Future<$0.WorkerCurrentRunConfig> getWorkerCurrentRunConfig_Pre(
      $grpc.ServiceCall call, $async.Future<$0.Empty> request) async {
    return getWorkerCurrentRunConfig(call, await request);
  }

  $async.Future<$0.Empty> report(
      $grpc.ServiceCall call, $0.ReportCollection request);
  $async.Future<$0.WorkerCurrentRunConfig> getWorkerCurrentRunConfig(
      $grpc.ServiceCall call, $0.Empty request);
}
