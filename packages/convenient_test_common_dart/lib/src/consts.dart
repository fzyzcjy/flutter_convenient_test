class SharedCompileTimeConfig {
  static String getConfigFromEnv(String key, String defaultVal, {bool required = false}) {
    final value = String.fromEnvironment(key);

    if (value.isEmpty && required) {
      throw Exception('Please provide `$key` via --dart-define');
    }

    return value.isEmpty ? defaultVal : value;
  }

  static String get kConvenientTestManagerHost => getConfigFromEnv('MANAGER_HOST', '127.0.0.1');

  static int get kConvenientTestManagerPort => int.parse(getConfigFromEnv('MANAGER_PORT', '3579'));

  static String get kWorkerVmServiceHost => getConfigFromEnv('WORKER_HOST', '127.0.0.1');

  static int get kWorkerVmServicePort => int.parse(getConfigFromEnv('WORKER_PORT', '9753'));

  static String get kReportFileExtension => getConfigFromEnv('REPORT_EXT', 'bin');
}
