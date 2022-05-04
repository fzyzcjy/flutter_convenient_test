// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'organization_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$OrganizationStore on _OrganizationStore, Store {
  late final _$enableAutoExpandAtom =
      Atom(name: '_OrganizationStore.enableAutoExpand', context: context);

  @override
  bool get enableAutoExpand {
    _$enableAutoExpandAtom.reportRead();
    return super.enableAutoExpand;
  }

  @override
  set enableAutoExpand(bool value) {
    _$enableAutoExpandAtom.reportWrite(value, super.enableAutoExpand, () {
      super.enableAutoExpand = value;
    });
  }

  late final _$activeTestEntryIdAtom =
      Atom(name: '_OrganizationStore.activeTestEntryId', context: context);

  @override
  int? get activeTestEntryId {
    _$activeTestEntryIdAtom.reportRead();
    return super.activeTestEntryId;
  }

  @override
  set activeTestEntryId(int? value) {
    _$activeTestEntryIdAtom.reportWrite(value, super.activeTestEntryId, () {
      super.activeTestEntryId = value;
    });
  }

  @override
  String toString() {
    return '''
enableAutoExpand: ${enableAutoExpand},
activeTestEntryId: ${activeTestEntryId}
    ''';
  }
}
