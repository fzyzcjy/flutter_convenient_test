class SharedCompileTimeConfig {
  static String getConfigFromEnv(String key, String defaultVal, {bool required = false}) {
    final value = String.fromEnvironment(key);

    if (value.isEmpty && required) {
      throw Exception('Please provide `$key` via --dart-define');
    }

    return value.isEmpty ? defaultVal : value;
  }

  static final String kConvenientTestManagerHost = getConfigFromEnv('MANAGER_HOST', '127.0.0.1');

  static final int kConvenientTestManagerPort = int.parse(getConfigFromEnv('MANAGER_PORT', '3579'));

  static final String kWorkerVmServiceHost = getConfigFromEnv('WORKER_HOST', '127.0.0.1');

  static final int kWorkerVmServicePort = int.parse(getConfigFromEnv('WORKER_PORT', '9753'));

  static final String kReportFileExtension = getConfigFromEnv('REPORT_EXT', 'bin');
}
