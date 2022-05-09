class CompileTimeConfig {
  static const kDefaultEnableIsolationMode =
      bool.fromEnvironment('CONVENIENT_TEST_ISOLATION_MODE', defaultValue: false);
  static const kSaveReport = bool.fromEnvironment('CONVENIENT_TEST_SAVE_REPORT', defaultValue: false);
}
