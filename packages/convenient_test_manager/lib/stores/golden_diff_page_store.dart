import 'dart:io';
import 'dart:typed_data';

import 'package:convenient_test_common/convenient_test_common.dart';
import 'package:convenient_test_dev/convenient_test_dev.dart';
import 'package:convenient_test_manager/misc/git_extensions.dart';
import 'package:convenient_test_manager_dart/misc/config.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:git/git.dart';
import 'package:mobx/mobx.dart';
import 'package:path/path.dart' as p;

part 'golden_diff_page_store.g.dart';

class GoldenDiffPageStore = _GoldenDiffPageStore with _$GoldenDiffPageStore;

abstract class _GoldenDiffPageStore with Store {
  static const _kTag = 'GoldenDiffPageStore';

  @observable
  String? gitRepo = CompileTimeConfig.kDefaultGoldenDiffGitRepo;

  @observable
  GitFolderInfo? gitFolderInfo;

  @observable
  String? highlightPath;

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

    return GitFolderInfo(diffFileInfos: diffFileInfos);
  }
}

@immutable
class GitFolderInfo {
  final List<GitDiffFileInfo> diffFileInfos;

  const GitFolderInfo({
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
