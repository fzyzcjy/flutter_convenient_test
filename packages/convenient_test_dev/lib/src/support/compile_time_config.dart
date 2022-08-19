class CompileTimeConfig {
  static final kAppCodeDir = () {
    const key = 'CONVENIENT_TEST_APP_CODE_DIR';
    const value = String.fromEnvironment(key);
    if (value.isEmpty) throw Exception('Please provide `$key` via --dart-define');
    return value;
  }();
}
