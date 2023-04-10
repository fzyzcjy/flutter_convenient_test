abstract class VmServiceWrapperService {
  bool get connected;

  Future<void> connect();
  bool get hotRestartActing;

  bool get hotRestartAvailable;
  Future<void> hotRestartRaw();

  void hotRestartThrottled();
}
