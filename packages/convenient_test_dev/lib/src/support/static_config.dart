import 'dart:io';

class StaticConfig {
  static const kAppCodeDirKey = 'CONVENIENT_TEST_APP_CODE_DIR';

  static final kAppCodeDir = () {
    final value = kAppCodeDirOptional;
    if (value == null) throw Exception('Please provide `$kAppCodeDirKey` via --dart-define');
    return value;
  }();

  static final kAppCodeDirOptional = () {
    const value = String.fromEnvironment(kAppCodeDirKey);
    if (value.isEmpty) return null;
    return value;
  }();

  static const kVerboseKey = 'CONVENIENT_TEST_VERBOSE';

  static final bool kVerbose = () {
    const key = kVerboseKey;
    if (const bool.hasEnvironment(key)) return const bool.fromEnvironment(key);
    return int.parse(Platform.environment[key] ?? '0') != 0;
  }();
}
