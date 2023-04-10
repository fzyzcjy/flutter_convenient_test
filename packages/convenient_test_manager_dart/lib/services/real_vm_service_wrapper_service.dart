// ignore_for_file: depend_on_referenced_packages, unnecessary_lambdas, use_setters_to_change_properties, prefer_final_in_for_each

import 'dart:async';

import 'package:collection/collection.dart';
import 'package:convenient_test_common_dart/convenient_test_common_dart.dart';
import 'package:convenient_test_manager_dart/services/vm_service_wrapper_service.dart';

import 'package:mobx/mobx.dart';
import 'package:vm_service/vm_service.dart' hide Log;
import 'package:vm_service/vm_service.dart' as vm_service;
import 'package:vm_service/vm_service_io.dart';

part 'real_vm_service_wrapper_service.g.dart';

class RealVmServiceWrapperService extends VmServiceWrapperService {
  static const _kTag = 'RealVmServiceWrapperService';

  final _manager = ServiceConnectionManager();

  RealVmServiceWrapperService() {
    connect();
  }

  @override
  bool get connected => _manager.connected;

  @override
  Future<void> connect() async {
    const uri = 'ws://$kWorkerVmServiceHost:$kWorkerVmServicePort/ws';
    Log.i(_kTag, 'Connecting to vm service at $uri. Please ensure your Flutter app has port=$kWorkerVmServicePort');

    try {
      final vmService = await vmServiceConnectUri(uri, log: _MyLog());
      await _manager.vmServiceOpened(vmService);
    } catch (e, s) {
      Log.w(_kTag, 'init failed e=$e s=$s');
    }
  }

  @override
  bool get hotRestartActing => _hotRestartActing.positive;
  final _hotRestartActing = ObservableCounter();

  @override
  @computed
  bool get hotRestartAvailable =>
      _manager.connected &&
      _manager.registeredMethodsForService.keys.contains(_ServiceConnectionManager._kHotRestartServiceName);

  // ref devtools/packages/devtools_app :: HotRestartButton
  @override
  Future<void> hotRestartRaw() async {
    await _hotRestartActing.withPlusOneAsync(() async {
      await _manager.performHotRestart();
    });
  }

  late final _hotRestartThrottledExecutor = SingleRunningExecutor<void>((_) async {
    await hotRestartRaw();

    // NOTE deliberately wait a few extra seconds to fix #188
    Log.d(_kTag, 'hotRestartThrottledExecutor deliberately extra wait');
    await Future<void>.delayed(const Duration(seconds: 6));
  });

  @override
  void hotRestartThrottled() {
    Log.i(_kTag, 'hotRestartThrottled triggered');
    _hotRestartThrottledExecutor.trigger(arg: null, reason: '');
  }
}

class _MyLog extends vm_service.Log {
  static const _kTag = RealVmServiceWrapperService._kTag;

  @override
  void warning(String message) => Log.w(_kTag, message);

  @override
  void severe(String message) => Log.e(_kTag, message);
}

/// ref: devtools_app :: ServiceConnectionManager
class ServiceConnectionManager = _ServiceConnectionManager with _$ServiceConnectionManager;

abstract class _ServiceConnectionManager with Store {
  static const _kTag = 'ServiceConnectionManager';

  @observable
  VmService? service;

  VM? vm;

  @computed
  bool get connected => service != null;

  Map<String, List<String>> get registeredMethodsForService => _registeredMethodsForService;
  final _registeredMethodsForService = ObservableMap<String, List<String>>();

  static const _kHotRestartServiceName = 'hotRestart';

  final isolateManager = IsolateManager();

  /// This can throw an [RPCError].
  Future<void> performHotRestart() async {
    Log.i(_kTag, 'hotRestart start');
    final resp = await _callServiceOnMainIsolate(_kHotRestartServiceName);
    Log.i(_kTag, 'hotRestart end resp=${resp.json}');
  }

  Future<Response> _callServiceOnMainIsolate(String name) async {
    final isolate = await whenValueNonNull(isolateManager.mainIsolate);
    return await callService(name, isolateId: isolate?.id);
  }

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

  Future<void> vmServiceOpened(VmService service) async {
    Log.i(_kTag, 'vmServiceOpened');

    this.service = service;

    isolateManager.vmServiceOpened(service);

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

    unawaited(service.onDone.then((Object? _) {
      Log.i(_kTag, 'VMService.onDone called');
      this.service = null;
    }));

    vm = await service.getVM();

    final isolates = <IsolateRef>[
      ...vm?.isolates ?? [],
    ];

    await isolateManager.init(isolates);
    if (service != this.service) {
      // A different service has been opened.
      return;
    }
  }
}

// ref: devtools_app :: isolate_manager.dart

class IsolateManager extends Disposer {
  final _isolateStates = <IsolateRef, IsolateState>{};

  // NOTE MODIFIED
  // VmServiceWrapper? _service;
  VmService? _service;

  final StreamController<IsolateRef?> _isolateCreatedController = StreamController<IsolateRef?>.broadcast();
  final StreamController<IsolateRef?> _isolateExitedController = StreamController<IsolateRef?>.broadcast();

  ValueListenable<IsolateRef?> get selectedIsolate => _selectedIsolate;
  final _selectedIsolate = ValueNotifier<IsolateRef?>(null);

  int _lastIsolateIndex = 0;
  final Map<String?, int> _isolateIndexMap = {};

  ValueListenable<List<IsolateRef>> get isolates => _isolates;
  final _isolates = ListValueNotifier(const <IsolateRef>[]);

  Stream<IsolateRef?> get onIsolateCreated => _isolateCreatedController.stream;

  Stream<IsolateRef?> get onIsolateExited => _isolateExitedController.stream;

  ValueListenable<IsolateRef?> get mainIsolate => _mainIsolate;
  final _mainIsolate = ValueNotifier<IsolateRef?>(null);

  final _isolateRunnableCompleters = <String?, Completer<void>>{};

  Future<void> init(List<IsolateRef> isolates) async {
    // NOTE MODIFIED - we do not have `preferences.vmDeveloperModeEnabled`
    // // Re-initialize isolates when VM developer mode is enabled/disabled to
    // // display/hide system isolates.
    // addAutoDisposeListener(preferences.vmDeveloperModeEnabled, () async {
    //   final vmDeveloperModeEnabled = preferences.vmDeveloperModeEnabled.value;
    //   final vm = await serviceManager.service!.getVM();
    //   final isolates = [
    //     ...vm.isolates ?? <IsolateRef>[],
    //     if (vmDeveloperModeEnabled) ...vm.systemIsolates ?? <IsolateRef>[],
    //   ];
    //   if (selectedIsolate.value!.isSystemIsolate! && !vmDeveloperModeEnabled) {
    //     selectIsolate(_isolates.value.first);
    //   }
    //   await _initIsolates(isolates);
    // });
    await _initIsolates(isolates);
  }

  IsolateState? get mainIsolateDebuggerState {
    return _mainIsolate.value != null ? _isolateStates[_mainIsolate.value!] : null;
  }

  IsolateState? isolateDebuggerState(IsolateRef? isolate) {
    return isolate != null ? _isolateStates[isolate] : null;
  }

  /// Return a unique, monotonically increasing number for this Isolate.
  int? isolateIndex(IsolateRef isolateRef) {
    if (!_isolateIndexMap.containsKey(isolateRef.id)) {
      _isolateIndexMap[isolateRef.id] = ++_lastIsolateIndex;
    }
    return _isolateIndexMap[isolateRef.id];
  }

  void selectIsolate(IsolateRef? isolateRef) {
    _setSelectedIsolate(isolateRef);
  }

  Future<void> _initIsolates(List<IsolateRef> isolates) async {
    _clearIsolateStates();

    await Future.wait([
      for (final isolateRef in isolates) _registerIsolate(isolateRef),
    ]);

    // It is critical that the _serviceExtensionManager is already listening
    // for events indicating that new extension rpcs are registered before this
    // call otherwise there is a race condition where service extensions are not
    // described in the selectedIsolate or recieved as an event. It is ok if a
    // service extension is included in both places as duplicate extensions are
    // handled gracefully.
    await _initSelectedIsolate();
  }

  Future<void> _registerIsolate(IsolateRef isolateRef) async {
    assert(!_isolateStates.containsKey(isolateRef));
    _isolateStates[isolateRef] = IsolateState(isolateRef);
    _isolates.add(isolateRef);
    isolateIndex(isolateRef);
    await _loadIsolateState(isolateRef);
  }

  Future<void> _loadIsolateState(IsolateRef isolateRef) async {
    final service = _service;
    var isolate = await _service!.getIsolate(isolateRef.id!);
    if (isolate.runnable == false) {
      final isolateRunnableCompleter = _isolateRunnableCompleters.putIfAbsent(
        isolate.id,
        () => Completer<void>(),
      );
      if (!isolateRunnableCompleter.isCompleted) {
        await isolateRunnableCompleter.future;
        isolate = await _service!.getIsolate(isolate.id!);
      }
    }
    if (service != _service) return;
    final state = _isolateStates[isolateRef];
    if (state != null) {
      // Isolate might have already been closed.
      state.onIsolateLoaded(isolate);
    }
  }

  Future<void> _handleIsolateEvent(Event event) async {
    _sendToMessageBus(event);
    if (event.kind == EventKind.kIsolateRunnable) {
      final isolateRunnable = _isolateRunnableCompleters.putIfAbsent(
        event.isolate!.id,
        () => Completer<void>(),
      );
      isolateRunnable.complete();
    } else if (event.kind == EventKind.kIsolateStart && !event.isolate!.isSystemIsolate!) {
      await _registerIsolate(event.isolate!);
      _isolateCreatedController.add(event.isolate);
      // TODO(jacobr): we assume the first isolate started is the main isolate
      // but that may not always be a safe assumption.
      _mainIsolate.value ??= event.isolate;

      if (_selectedIsolate.value == null) {
        _setSelectedIsolate(event.isolate);
      }
    } else if (event.kind == EventKind.kServiceExtensionAdded) {
      // Check to see if there is a new isolate.
      if (_selectedIsolate.value == null && isFlutterExtension(event.extensionRPC!)) {
        _setSelectedIsolate(event.isolate);
      }
    } else if (event.kind == EventKind.kIsolateExit) {
      _isolateStates.remove(event.isolate)?.dispose();
      if (event.isolate != null) _isolates.remove(event.isolate!);
      _isolateExitedController.add(event.isolate);
      if (_mainIsolate.value == event.isolate) {
        _mainIsolate.value = null;
      }
      if (_selectedIsolate.value == event.isolate) {
        _selectedIsolate.value = _isolateStates.isEmpty ? null : _isolateStates.keys.first;
      }
      _isolateRunnableCompleters.remove(event.isolate!.id);
    }
  }

  void _sendToMessageBus(Event event) {
    // NOTE MODIFIED
    // messageBus.addEvent(
    //   BusEvent(
    //     'debugger',
    //     data: event,
    //   ),
    // );
  }

  Future<void> _initSelectedIsolate() async {
    if (_isolateStates.isEmpty) {
      return;
    }
    _mainIsolate.value = null;
    final service = _service;
    final mainIsolate = await _computeMainIsolate();
    if (service != _service) return;
    _mainIsolate.value = mainIsolate;
    _setSelectedIsolate(_mainIsolate.value);
  }

  Future<IsolateRef?> _computeMainIsolate() async {
    if (_isolateStates.isEmpty) return null;

    final service = _service;
    for (var isolateState in _isolateStates.values) {
      if (_selectedIsolate.value == null) {
        final isolate = await isolateState.isolate;
        if (service != _service) return null;
        for (String extensionName in isolate?.extensionRPCs ?? []) {
          if (isFlutterExtension(extensionName)) {
            return isolateState.isolateRef;
          }
        }
      }
    }

    final IsolateRef? ref = _isolateStates.keys.firstWhereOrNull((IsolateRef ref) {
      // 'foo.dart:main()'
      return ref.name!.contains(':main(');
    });

    return ref ?? _isolateStates.keys.first;
  }

  void _setSelectedIsolate(IsolateRef? ref) {
    _selectedIsolate.value = ref;
  }

  void handleVmServiceClosed() {
    cancelStreamSubscriptions();
    _selectedIsolate.value = null;
    _service = null;
    _lastIsolateIndex = 0;
    _setSelectedIsolate(null);
    _isolateIndexMap.clear();
    _clearIsolateStates();
    _mainIsolate.value = null;
    _isolateRunnableCompleters.clear();
  }

  void _clearIsolateStates() {
    for (var isolateState in _isolateStates.values) {
      isolateState.dispose();
    }
    _isolateStates.clear();
    _isolates.clear();
  }

  // NOTE MODIFIED
  // void vmServiceOpened(VmServiceWrapper service) {
  void vmServiceOpened(VmService service) {
    _selectedIsolate.value = null;

    cancelStreamSubscriptions();
    _service = service;
    autoDisposeStreamSubscription(
      service.onIsolateEvent.listen(_handleIsolateEvent),
    );
    autoDisposeStreamSubscription(
      service.onDebugEvent.listen(_handleDebugEvent),
    );

    // We don't yet known the main isolate.
    _mainIsolate.value = null;
  }

  Future<Isolate?> getIsolateCached(IsolateRef isolateRef) {
    final isolateState = _isolateStates.putIfAbsent(isolateRef, () => IsolateState(isolateRef));
    return isolateState.isolate;
  }

  void _handleDebugEvent(Event event) {
    final isolate = event.isolate;
    if (isolate == null) return;
    final isolateState = _isolateStates[isolate];
    if (isolateState == null) {
      return;
    }

    isolateState.handleDebugEvent(event.kind);
  }
}

// ref: devtools_app :: isolate_state.dart
class IsolateState {
  IsolateState(this.isolateRef);

  ValueListenable<bool?> get isPaused => _isPaused;

  final IsolateRef isolateRef;

  Future<Isolate?> get isolate => _completer.future;
  Completer<Isolate?> _completer = Completer();

  Isolate? get isolateNow => _isolateNow;
  Isolate? _isolateNow;

  /// Paused is null until we know whether the isolate is paused or not.
  final _isPaused = ValueNotifier<bool?>(null);

  void onIsolateLoaded(Isolate isolate) {
    _isolateNow = isolate;
    _completer.complete(isolate);
    if (_isPaused.value == null) {
      if (isolate.pauseEvent != null && isolate.pauseEvent!.kind != EventKind.kResume) {
        _isPaused.value = true;
      } else {
        _isPaused.value = false;
      }
    }
  }

  void dispose() {
    _isolateNow = null;
    if (!_completer.isCompleted) {
      _completer.complete(null);
    } else {
      _completer = Completer()..complete(null);
    }
  }

  void handleDebugEvent(String? kind) {
    switch (kind) {
      case EventKind.kResume:
        _isPaused.value = false;
        break;
      case EventKind.kPauseStart:
      case EventKind.kPauseExit:
      case EventKind.kPauseBreakpoint:
      case EventKind.kPauseInterrupted:
      case EventKind.kPauseException:
      case EventKind.kPausePostRequest:
        _isPaused.value = true;
        break;
    }
  }
}

// ref devtools_app service_extensions.dart
bool isFlutterExtension(String extensionName) {
  return extensionName.startsWith('ext.flutter.');
}
