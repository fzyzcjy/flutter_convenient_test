enum ExecutionEnv {
  /// Run with a simulator / real device, with ConvenientTestManager, etc
  deviceTest,

  /// Run without a simulator / real device, just like a standard widget test
  widgetTest,
}
