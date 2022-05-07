// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vm_service_wrapper_service.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$_ServiceConnectionManager on __ServiceConnectionManager, Store {
  Computed<bool>? _$connectedComputed;

  @override
  bool get connected =>
      (_$connectedComputed ??= Computed<bool>(() => super.connected, name: '__ServiceConnectionManager.connected'))
          .value;

  late final _$serviceAtom = Atom(name: '__ServiceConnectionManager.service', context: context);

  @override
  vm_service.VmService? get service {
    _$serviceAtom.reportRead();
    return super.service;
  }

  @override
  set service(vm_service.VmService? value) {
    _$serviceAtom.reportWrite(value, super.service, () {
      super.service = value;
    });
  }

  @override
  String toString() {
    return '''
service: ${service},
connected: ${connected}
    ''';
  }
}
