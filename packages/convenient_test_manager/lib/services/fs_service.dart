import 'package:convenient_test_manager_dart/services/fs_service.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

class FsServiceFlutter extends FsService {
  @override
  Future<String> getTemporaryDirectory() async => (await path_provider.getTemporaryDirectory()).path;
}
