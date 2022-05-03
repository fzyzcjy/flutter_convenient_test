import 'dart:async';

import 'package:mobx/mobx.dart';
import 'package:test_tool_common/test_tool_common.dart';
import 'package:vm_service/vm_service.dart' hide Log;
import 'package:vm_service/vm_service.dart' as vm_service;
import 'package:vm_service/vm_service_io.dart';

part 'vm_service_wrapper_service.g.dart';

class VmServiceWrapperService {
  static const _kTag = 'VmServiceWrapperService';

  final _manager = _ServiceConnectionManager();

  VmServiceWrapperService() {
    connect();
  }

  bool get connected => _manager.connected;

  Future<void> connect() async {
    const uri = 'ws://$kWorkerVmServiceHost:$kWorkerVmServicePort/ws';
    Log.i(_kTag, 'Connecting to vm service at $uri. Please ensure your Flutter app has port=$kWorkerVmServicePort');

    try {
      final vmService = await vmServiceConnectUri(uri, log: _MyLog());
      _manager.vmServiceOpened(vmService);
    } catch (e, s) {
      Log.w(_kTag, 'init failed e=$e s=$s');
    }
  }

  // ref devtools/packages/devtools_app :: HotRestartButton
  Future<void> hotRestart() async {
    Log.i(_kTag, 'hotRestart start');
    // p.s. devtool's code reads isolateId and ensure it is sent to main isolate.
    // Here we have not done that, but seems to work well already.
    final resp = await _manager.callService('hotRestart');
    Log.i(_kTag, 'hotRestart end resp=${resp.json}');
  }
}

class _MyLog extends vm_service.Log {
  static const _kTag = VmServiceWrapperService._kTag;

  @override
  void warning(String message) => Log.w(_kTag, message);

  @override
  void severe(String message) => Log.e(_kTag, message);
}

/// ref: devtools_app :: ServiceConnectionManager
class _ServiceConnectionManager = __ServiceConnectionManager with _$_ServiceConnectionManager;

abstract class __ServiceConnectionManager with Store {
  static const _kTag = 'ServiceConnectionManager';

  @observable
  VmService? service;

  @computed
  bool get connected => service != null;

  Map<String, List<String>> get registeredMethodsForService => _registeredMethodsForService;
  final Map<String, List<String>> _registeredMethodsForService = {};

  /// Call a service that is registered by exactly one client.
  Future<Response> callService(
    String name, {
    String? isolateId,
    Map<String, dynamic>? args,
  }) async {
    final registered = _registeredMethodsForService[name] ?? const [];
    if (registered.isEmpty) {
      throw Exception('There are no registered methods for service "$name"');
    }
    return service!.callMethod(
      registered.first,
      isolateId: isolateId,
      args: args,
    );
  }

  void vmServiceOpened(VmService service) {
    Log.i(_kTag, 'vmServiceOpened');

    this.service = service;

    void handleServiceEvent(Event e) {
      Log.i(_kTag, 'handleServiceEvent kind=${e.kind} service=${e.service} method=${e.method}');

      if (e.kind == EventKind.kServiceRegistered) {
        _registeredMethodsForService.putIfAbsent(e.service!, () => []).add(e.method!);
      }
      if (e.kind == EventKind.kServiceUnregistered) {
        _registeredMethodsForService.remove(e.service!); // ignore: unnecessary_null_checks
      }
    }

    service.onEvent(EventStreams.kService).listen(handleServiceEvent);
    unawaited(service.streamListen(EventStreams.kService));
  }
}
