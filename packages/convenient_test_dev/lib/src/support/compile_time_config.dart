import 'package:convenient_test_common/convenient_test_common.dart';

class CompileTimeConfig {
  static String _getConfigFromEnv(String key, String defaultVal,
      {bool required = false}) {
    final value = String.fromEnvironment(key);

    if (value.isEmpty && required) {
      throw Exception('Please provide `$key` via --dart-define');
    }

    return value.isEmpty ? defaultVal : value;
  }

  static String get kAppCodeDir =>
      _getConfigFromEnv('CONVENIENT_TEST_APP_CODE_DIR', '', required: true);

  static String get dConvenientTestManagerHost => _getConfigFromEnv(
      'CONVENIENT_TEST_MANAGER_HOST', kConvenientTestManagerHost);

  static int get dConvenientTestManagerPort => int.parse(_getConfigFromEnv(
      'CONVENIENT_TEST_MANAGER_PORT', kConvenientTestManagerPort.toString()));
}
