import 'package:convenient_test_common/convenient_test_common.dart';
import 'package:convenient_test_manager_dart/misc/config.dart';
import 'package:flutter/foundation.dart';
import 'package:mobx/mobx.dart';

part 'golden_diff_page_store.g.dart';

class GoldenDiffPageStore = _GoldenDiffPageStore with _$GoldenDiffPageStore;

abstract class _GoldenDiffPageStore with Store {
  static const _kTag = 'GoldenDiffPageStore';

  @observable
  String? gitRepo = CompileTimeConfig.kDefaultGoldenDiffGitRepo;

  @observable
  GitFolderInfo? gitFolderInfo;

  _GoldenDiffPageStore() {
    reaction((_) => gitRepo, _syncGitFolderInfoFromRepo);
  }

  Future<void> _syncGitFolderInfoFromRepo(String? gitRepo) async {
    if (gitRepo == null) return;
    Log.i(_kTag, 'syncGitInfoFromRepo gitRepo=$gitRepo');
    gitFolderInfo = await _calcGitFolderInfo(gitRepo);
  }

  static Future<GitFolderInfo> _calcGitFolderInfo(String gitRepo) async {
    return TODO;
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

  const GitDiffFileInfo({
    required this.path,
  });
}
