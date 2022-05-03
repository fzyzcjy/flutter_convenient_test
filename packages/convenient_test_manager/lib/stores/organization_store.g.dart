// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'organization_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$OrganizationStore on _OrganizationStore, Store {
  Computed<List<int>>? _$allTestEntryIdsComputed;

  @override
  List<int> get allTestEntryIds => (_$allTestEntryIdsComputed ??=
          Computed<List<int>>(() => super.allTestEntryIds, name: '_OrganizationStore.allTestEntryIds'))
      .value;

  late final _$enableAutoExpandAtom = Atom(name: '_OrganizationStore.enableAutoExpand', context: context);

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

  @override
  String toString() {
    return '''
enableAutoExpand: ${enableAutoExpand},
allTestEntryIds: ${allTestEntryIds}
    ''';
  }
}
