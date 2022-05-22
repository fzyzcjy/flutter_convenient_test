import 'package:args/args.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobx/mobx.dart';

part 'global_config_store.freezed.dart';

part 'global_config_store.g.dart';

class GlobalConfigStore {
  static late final GlobalConfig config;
}

class GlobalConfig = _GlobalConfig with _$GlobalConfig;

abstract class _GlobalConfig with Store {
  @observable
  bool isolationMode;

  @observable
  bool enableReportSaver;

  @observable
  String? goldenDiffGitRepo;

  _GlobalConfig({
    required this.isolationMode,
    required this.enableReportSaver,
    required this.goldenDiffGitRepo,
  });
}

@freezed
class GlobalConfigNullable with _$GlobalConfigNullable {
  factory GlobalConfigNullable({
    bool? isolationMode,
    bool? enableReportSaver,
    String? goldenDiffGitRepo,
  }) = _GlobalConfigNullable;

  // ignore: prefer_constructors_over_static_methods
  static GlobalConfigNullable parseEnvironment(GlobalConfigNullable upstream) {
    return upstream.copyWith(
      isolationMode: _stringToNullableBool(const String.fromEnvironment('CONVENIENT_TEST_ISOLATION_MODE')),
      enableReportSaver: _stringToNullableBool(const String.fromEnvironment('CONVENIENT_TEST_ENABLE_REPORT_SAVER')),
      goldenDiffGitRepo: _emptyToNull(const String.fromEnvironment('CONVENIENT_TEST_GOLDEN_DIFF_GIT_REPO')),
    );
  }

  // ignore: prefer_constructors_over_static_methods
  static GlobalConfigNullable parseArgs(GlobalConfigNullable upstream, List<String> args) {
    final results = (ArgParser()
          ..addFlag('isolation-mode', defaultsTo: null)
          ..addFlag('enable-report-saver', defaultsTo: null)
          ..addOption('golden-diff-git-repo', defaultsTo: null))
        .parse(args);

    return upstream.copyWith(
      isolationMode: results['isolation-mode'] as bool?,
      enableReportSaver: results['enable-report-saver'] as bool?,
      goldenDiffGitRepo: results['golden-diff-git-repo'] as String?,
    );
  }

  // ignore: prefer_constructors_over_static_methods
  static GlobalConfigNullable parseHeadlessMode(GlobalConfigNullable upstream) {
    return upstream.copyWith(
      // when running the headless binary, we want to save the colorful report such that we can read it later with GUI
      // thus, it [defaultsTo] *true* instead of null
      enableReportSaver: true,
    );
  }
}

extension ExtGlobalConfigNullable on GlobalConfigNullable {
  GlobalConfig toConfig() => GlobalConfig(
        isolationMode: isolationMode ?? false,
        enableReportSaver: enableReportSaver ?? false,
        goldenDiffGitRepo: goldenDiffGitRepo,
      );
}

bool? _stringToNullableBool(String s) {
  if (s.toLowerCase() == 'true') return true;
  if (s.toLowerCase() == 'false') return false;
  return null;
}

String? _emptyToNull(String s) => s.isEmpty ? null : s;
