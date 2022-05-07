abstract class FsService {
  Future<String> getTemporaryDirectory();
}

class FsServiceDart implements FsService {
  @override
  Future<String> getTemporaryDirectory() async => '/tmp';
}
