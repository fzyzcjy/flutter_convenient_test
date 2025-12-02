const String kConvenientTestManagerHost = String.fromEnvironment(
  'CONVENIENT_TEST_MANAGER_HOST',
  defaultValue: '127.0.0.1',
);

const int kConvenientTestManagerPort = int.fromEnvironment(
  'CONVENIENT_TEST_MANAGER_PORT',
  defaultValue: 3579,
);

const String kWorkerVmServiceHost = String.fromEnvironment(
  'CONVENIENT_TEST_WORKER_HOST',
  defaultValue: '127.0.0.1',
);

const int kWorkerVmServicePort = int.fromEnvironment(
  'CONVENIENT_TEST_WORKER_PORT',
  defaultValue: 9753,
);

const String kReportFileExtension = String.fromEnvironment(
  'CONVENIENT_TEST_REPORT_EXT',
  defaultValue: 'bin',
);
