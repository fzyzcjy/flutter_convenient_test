import 'dart:io';

class StaticConfig {
  static final kAppCodeDir = () {
    const key = 'CONVENIENT_TEST_APP_CODE_DIR';
    const value = String.fromEnvironment(key);
    if (value.isEmpty) throw Exception('Please provide `$key` via --dart-define');
    return value;
  }();

  static const kVerboseKey = 'CONVENIENT_TEST_VERBOSE';

  static final bool kVerbose = () {
    const key = kVerboseKey;
    if (const bool.hasEnvironment(key)) return const bool.fromEnvironment(key);
    return int.parse(Platform.environment[key] ?? '0') != 0;
  }();
}
