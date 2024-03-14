import 'dart:io';

import 'package:convenient_test_manager_dart/stores/worker_super_run_store.dart';
import 'package:get_it/get_it.dart';

abstract class FsService {
  Future<String> getBaseDataDirectory() async =>
      '${await getTemporaryDirectory()}/ConvenientTest';

  Future<String> getActiveSuperRunDataSubDirectory(
      {required String category}) async {
    final superRunId =
        GetIt.I.get<WorkerSuperRunStore>().currSuperRunController.superRunId;
    final ans = '${await getBaseDataDirectory()}/$superRunId/$category/';
    Directory(ans).createSync(recursive: true);
    return ans;
  }

  Future<String> getTemporaryDirectory();
}

class FsServiceDart extends FsService {
  @override
  Future<String> getTemporaryDirectory() async => '/tmp';
}
