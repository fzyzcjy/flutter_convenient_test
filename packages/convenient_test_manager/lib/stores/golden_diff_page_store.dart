import 'dart:io';
import 'dart:math';
import 'dart:typed_data';

import 'package:convenient_test_common/convenient_test_common.dart';
import 'package:convenient_test_dev/convenient_test_dev.dart';
import 'package:convenient_test_manager/misc/git_extensions.dart';
import 'package:convenient_test_manager_dart/stores/global_config_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:git/git.dart';
import 'package:mobx/mobx.dart';
import 'package:path/path.dart' as p;

part 'golden_diff_page_store.g.dart';

class GoldenDiffPageStore = _GoldenDiffPageStore with _$GoldenDiffPageStore;

abstract class _GoldenDiffPageStore with Store {
  static const _kTag = 'GoldenDiffPageStore';

  String? get gitRepo => GlobalConfigStore.config.goldenDiffGitRepo;

  set gitRepo(String? val) => GlobalConfigStore.config.goldenDiffGitRepo = val;

  @observable
  GitFolderInfo? gitFolderInfo;

  @observable
  String? highlightPath;

  @observable
  var highlightTransform = Matrix4.identity();

  _GoldenDiffPageStore() {
    reaction((_) => gitRepo, _syncGitFolderInfoFromRepo, fireImmediately: true);
  }

  Future<void> _syncGitFolderInfoFromRepo(String? gitRepo) async {
    Log.i(_kTag, 'syncGitInfoFromRepo gitRepo=$gitRepo');
    gitFolderInfo = await _calcGitFolderInfo(gitRepo);
  }

  static Future<GitFolderInfo?> _calcGitFolderInfo(String? gitRepo) async {
    if (gitRepo == null) return null;
    if (!await GitDir.isGitDir(gitRepo)) return null;

    final git = SimpleGit(gitRepo);

    Log.d(_kTag, 'calcGitFolderInfo step getDiff');
    final diffFilePaths = await git.getDiff();

    Log.d(_kTag, 'calcGitFolderInfo step get file content');
    final diffFileInfos = await Stream.fromIterable(diffFilePaths).asyncMap((path) async {
      final originalContent = Uint8List.fromList(await git.show(ref: 'HEAD', filePath: path));
      final newContent = await File(p.join(gitRepo, path)).readAsBytes();
      final comparisonResult = await MyLocalFileComparator.myCompareLists(originalContent, newContent);

      return GitDiffFileInfo(
        path: path,
        originalContent: originalContent,
        newContent: newContent,
        comparisonResult: comparisonResult,
      );
    }).toList();

    return GitFolderInfo(
      commonPathPrefix: _commonPrefixMulti(diffFileInfos.map((e) => e.path)),
      diffFileInfos: diffFileInfos,
    );
  }
}

String _commonPrefixMulti(Iterable<String> items) {
  if (items.isEmpty) return '';
  return items.reduce(_commonPrefix);
}

String _commonPrefix(String a, String b) {
  final end = min(a.length, b.length);
  for (var i = 0; i < end; ++i) {
    if (a[i] != b[i]) return a.substring(0, i);
  }
  return a.substring(0, end);
}

@immutable
class GitFolderInfo {
  final String commonPathPrefix;
  final List<GitDiffFileInfo> diffFileInfos;

  const GitFolderInfo({
    required this.commonPathPrefix,
    required this.diffFileInfos,
  });
}

@immutable
class GitDiffFileInfo {
  final String path;
  final Uint8List originalContent;
  final Uint8List newContent;
  final ComparisonResult comparisonResult;

  const GitDiffFileInfo({
    required this.path,
    required this.originalContent,
    required this.newContent,
    required this.comparisonResult,
  });
}
