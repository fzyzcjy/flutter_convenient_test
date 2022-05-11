class CompileTimeConfig {
  static const kDefaultEnableIsolationMode =
      bool.fromEnvironment('CONVENIENT_TEST_ISOLATION_MODE', defaultValue: false);
}

class GlobalConfig {
  // ignore: avoid-global-state
  static var ciMode = false;
}
