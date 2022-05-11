import 'package:convenient_test_manager_dart/stores/worker_super_run_store.dart';
import 'package:get_it/get_it.dart';

abstract class FsService {
  Future<String> getBaseDataDirectory() async => '${await getTemporaryDirectory()}/ConvenientTest';

  Future<String> getActiveSuperRunDataSubDirectory({required String category}) async {
    final superRunId = GetIt.I.get<WorkerSuperRunStore>().currSuperRunController.superRunId;
    return '${await getBaseDataDirectory()}/$superRunId/$category';
  }

  Future<String> getTemporaryDirectory();
}

class FsServiceDart extends FsService {
  @override
  Future<String> getTemporaryDirectory() async => '/tmp';
}
