// This is a generated file - do not edit.
//
// Generated from convenient_test.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'package:protobuf/protobuf.dart' as $pb;

import 'convenient_test.pb.dart' as $0;

export 'convenient_test.pb.dart';

@$pb.GrpcServiceName('ConvenientTestManager')
class ConvenientTestManagerClient extends $grpc.Client {
  /// The hostname for this service.
  static const $core.String defaultHost = '';

  /// OAuth scopes needed for the client.
  static const $core.List<$core.String> oauthScopes = [
    '',
  ];

  ConvenientTestManagerClient(super.channel, {super.options, super.interceptors});

  $grpc.ResponseFuture<$0.Empty> report(
    $0.ReportCollection request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$report, request, options: options);
  }

  $grpc.ResponseFuture<$0.WorkerCurrentRunConfig> getWorkerCurrentRunConfig(
    $0.Empty request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$getWorkerCurrentRunConfig, request, options: options);
  }

  // method descriptors

  static final _$report = $grpc.ClientMethod<$0.ReportCollection, $0.Empty>(
      '/ConvenientTestManager/Report', ($0.ReportCollection value) => value.writeToBuffer(), $0.Empty.fromBuffer);
  static final _$getWorkerCurrentRunConfig = $grpc.ClientMethod<$0.Empty, $0.WorkerCurrentRunConfig>(
      '/ConvenientTestManager/GetWorkerCurrentRunConfig',
      ($0.Empty value) => value.writeToBuffer(),
      $0.WorkerCurrentRunConfig.fromBuffer);
}

@$pb.GrpcServiceName('ConvenientTestManager')
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

  $async.Future<$0.Empty> report_Pre($grpc.ServiceCall $call, $async.Future<$0.ReportCollection> $request) async {
    return report($call, await $request);
  }

  $async.Future<$0.Empty> report($grpc.ServiceCall call, $0.ReportCollection request);

  $async.Future<$0.WorkerCurrentRunConfig> getWorkerCurrentRunConfig_Pre(
      $grpc.ServiceCall $call, $async.Future<$0.Empty> $request) async {
    return getWorkerCurrentRunConfig($call, await $request);
  }

  $async.Future<$0.WorkerCurrentRunConfig> getWorkerCurrentRunConfig($grpc.ServiceCall call, $0.Empty request);
}
