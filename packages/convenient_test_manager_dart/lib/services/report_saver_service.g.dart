// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_saver_service.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ReportSaverService on _ReportSaverService, Store {
  late final _$enableAtom =
      Atom(name: '_ReportSaverService.enable', context: context);

  @override
  bool get enable {
    _$enableAtom.reportRead();
    return super.enable;
  }

  @override
  set enable(bool value) {
    _$enableAtom.reportWrite(value, super.enable, () {
      super.enable = value;
    });
  }

  @override
  String toString() {
    return '''
enable: ${enable}
    ''';
  }
}
