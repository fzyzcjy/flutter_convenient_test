// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'counter.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ObservableCounter on _ObservableCounter, Store {
  late final _$_valueAtom = Atom(
    name: '_ObservableCounter._value',
    context: context,
  );

  @override
  int get _value {
    _$_valueAtom.reportRead();
    return super._value;
  }

  @override
  set _value(int value) {
    _$_valueAtom.reportWrite(value, super._value, () {
      super._value = value;
    });
  }

  late final _$_ObservableCounterActionController = ActionController(
    name: '_ObservableCounter',
    context: context,
  );

  @override
  void withPlusOneSync(void Function() f) {
    final _$actionInfo = _$_ObservableCounterActionController.startAction(
      name: '_ObservableCounter.withPlusOneSync',
    );
    try {
      return super.withPlusOneSync(f);
    } finally {
      _$_ObservableCounterActionController.endAction(_$actionInfo);
    }
  }

  @override
  Future<void> withPlusOneAsync(Future<void> Function() f) {
    final _$actionInfo = _$_ObservableCounterActionController.startAction(
      name: '_ObservableCounter.withPlusOneAsync',
    );
    try {
      return super.withPlusOneAsync(f);
    } finally {
      _$_ObservableCounterActionController.endAction(_$actionInfo);
    }
  }
}
