class CompileTimeConfig {
  // static const _forceCIMode = true; // for debug
  static const _forceCIMode = false;

  static const kCIMode = _forceCIMode || bool.fromEnvironment('CONVENIENT_TEST_CI_MODE', defaultValue: false);
}
