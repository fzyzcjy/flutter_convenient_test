import 'package:convenient_test_manager/services/video_recorder_service.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';
import 'package:path_provider/path_provider.dart';

part 'video_store.g.dart';

class VideoStore = _VideoStore with _$VideoStore;

abstract class _VideoStore with Store {
  @observable
  String? recordingVideoPath;

  @observable
  String? displayVideoPath;

  void clear() {
    recordingVideoPath = null;
    displayVideoPath = null;
  }

  @action
  Future<void> startRecord() async {
    recordingVideoPath = await _createVideoPath();
    await GetIt.I.get<VideoRecorderService>().startRecord(recordingVideoPath!);
  }

  @action
  Future<void> stopRecord() async {
    await GetIt.I.get<VideoRecorderService>().stopRecord();
    displayVideoPath = recordingVideoPath;
    recordingVideoPath = null;
  }

  Future<String> _createVideoPath() async {
    final stem = DateFormat('yyyyMMdd_hhmmss').format(DateTime.now());
    return '${(await getTemporaryDirectory()).path}/ConvenientTest_Video_$stem.mov';
  }
}
