class CompileTimeConfig {
  static const kDefaultEnableIsolationMode =
      bool.fromEnvironment('CONVENIENT_TEST_ISOLATION_MODE', defaultValue: false);
  static final kDefaultGoldenDiffGitRepo = () {
    const raw = String.fromEnvironment('CONVENIENT_TEST_GOLDEN_DIFF_GIT_REPO', defaultValue: '');
    return raw.isEmpty ? null : raw;
  }();
}

class GlobalConfig {
  // ignore: avoid-global-state
  static var ciMode = false;
}
