import 'package:convenient_test_manager_dart/misc/config.dart';
import 'package:mobx/mobx.dart';

part 'golden_diff_page_store.g.dart';

class GoldenDiffPageStore = _GoldenDiffPageStore with _$GoldenDiffPageStore;

abstract class _GoldenDiffPageStore with Store {
  @observable
  String? gitRepo = CompileTimeConfig.kDefaultGoldenDiffGitRepo;

// TODO
}
