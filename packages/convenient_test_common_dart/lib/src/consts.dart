const String kConvenientTestManagerHost = String.fromEnvironment('MANAGER_HOST', defaultValue: '127.0.0.1');

const int kConvenientTestManagerPort = int.fromEnvironment('MANAGER_PORT', defaultValue: 3579);

const String kWorkerVmServiceHost = String.fromEnvironment('WORKER_HOST', defaultValue: '127.0.0.1');

const int kWorkerVmServicePort = int.fromEnvironment('WORKER_PORT', defaultValue: 9753);

const String kReportFileExtension = String.fromEnvironment('REPORT_EXT', defaultValue: 'bin');
