// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'golden_diff_page_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$GoldenDiffPageStore on _GoldenDiffPageStore, Store {
  late final _$gitRepoAtom =
      Atom(name: '_GoldenDiffPageStore.gitRepo', context: context);

  @override
  String? get gitRepo {
    _$gitRepoAtom.reportRead();
    return super.gitRepo;
  }

  @override
  set gitRepo(String? value) {
    _$gitRepoAtom.reportWrite(value, super.gitRepo, () {
      super.gitRepo = value;
    });
  }

  @override
  String toString() {
    return '''
gitRepo: ${gitRepo}
    ''';
  }
}
