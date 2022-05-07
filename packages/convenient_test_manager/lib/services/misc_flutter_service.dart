import 'package:convenient_test_manager/stores/highlight_store.dart';
import 'package:convenient_test_manager/stores/video_player_store.dart';
import 'package:convenient_test_manager_dart/services/misc_dart_service.dart';
import 'package:file_picker/file_picker.dart';
import 'package:get_it/get_it.dart';

class MiscFlutterService extends MiscDartService {
  @override
  Future<void> reloadInfo() async {
    GetIt.I.get<HighlightStore>().enableAutoExpand = true;
    await super.reloadInfo();
  }

  @override
  void clearAll() {
    super.clearAll();
    GetIt.I.get<HighlightStore>().clear();
    GetIt.I.get<VideoPlayerStore>().clear();
  }

  Future<void> pickFileAndReadReport() async {
    final result = await FilePicker.platform.pickFiles(allowMultiple: true);
    if (result == null) return;

    final path = result.paths.single!;

    await readReportFromFile(path);
  }
}
