class CompileTimeConfig {
  static const kDefaultEnableIsolationMode =
      bool.fromEnvironment('CONVENIENT_TEST_ISOLATION_MODE', defaultValue: false);
  static const kCiMode = bool.fromEnvironment('CONVENIENT_TEST_CI_MODE', defaultValue: false);
}
