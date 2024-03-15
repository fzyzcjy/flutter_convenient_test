// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'suite_info_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SuiteInfoStore on _SuiteInfoStore, Store {
  late final _$suiteInfoAtom =
      Atom(name: '_SuiteInfoStore.suiteInfo', context: context);

  @override
  SuiteInfo? get suiteInfo {
    _$suiteInfoAtom.reportRead();
    return super.suiteInfo;
  }

  @override
  set suiteInfo(SuiteInfo? value) {
    _$suiteInfoAtom.reportWrite(value, super.suiteInfo, () {
      super.suiteInfo = value;
    });
  }

  @override
  String toString() {
    return '''
suiteInfo: ${suiteInfo}
    ''';
  }
}
