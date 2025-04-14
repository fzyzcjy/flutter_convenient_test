// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'golden_diff_page_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$GoldenDiffPageStore on _GoldenDiffPageStore, Store {
  late final _$gitFolderInfoAtom =
      Atom(name: '_GoldenDiffPageStore.gitFolderInfo', context: context);

  @override
  GitFolderInfo? get gitFolderInfo {
    _$gitFolderInfoAtom.reportRead();
    return super.gitFolderInfo;
  }

  @override
  set gitFolderInfo(GitFolderInfo? value) {
    _$gitFolderInfoAtom.reportWrite(value, super.gitFolderInfo, () {
      super.gitFolderInfo = value;
    });
  }

  late final _$highlightPathAtom =
      Atom(name: '_GoldenDiffPageStore.highlightPath', context: context);

  @override
  String? get highlightPath {
    _$highlightPathAtom.reportRead();
    return super.highlightPath;
  }

  @override
  set highlightPath(String? value) {
    _$highlightPathAtom.reportWrite(value, super.highlightPath, () {
      super.highlightPath = value;
    });
  }

  late final _$highlightTransformAtom =
      Atom(name: '_GoldenDiffPageStore.highlightTransform', context: context);

  @override
  Matrix4 get highlightTransform {
    _$highlightTransformAtom.reportRead();
    return super.highlightTransform;
  }

  @override
  set highlightTransform(Matrix4 value) {
    _$highlightTransformAtom.reportWrite(value, super.highlightTransform, () {
      super.highlightTransform = value;
    });
  }

  @override
  String toString() {
    return '''
gitFolderInfo: ${gitFolderInfo},
highlightPath: ${highlightPath},
highlightTransform: ${highlightTransform}
    ''';
  }
}
