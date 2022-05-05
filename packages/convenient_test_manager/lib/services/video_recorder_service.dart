import 'dart:io';

import 'package:convenient_test_common/convenient_test_common.dart';

abstract class VideoRecorderService {
  Future<VideoRecorderService> create() async {
    // TODO add Android support
    return (await _VideoRecorderServiceIosSimulator.maybeCreate()) ?? _VideoRecorderServiceNoOp();
  }

  Future<void> startRecord(String targetPath);

  Future<void> stopRecord();
}

class _VideoRecorderServiceIosSimulator extends VideoRecorderService {
  static const _kTag = 'VideoRecorderServiceIosSimulator';

  static Future<_VideoRecorderServiceIosSimulator?> maybeCreate() async {
    // non-mac computers cannot have ios simulators
    if (!Platform.isMacOS) return null;

    return _VideoRecorderServiceIosSimulator();
  }

  Process? _process;

  @override
  Future<void> startRecord(String targetPath) async {
    Log.i(_kTag, 'startRecord begin $targetPath');

    if (_process != null) await stopRecord();

    final process = await Process.start('xcrun', ['simctl', 'io', 'booted', 'recordVideo', targetPath]);
    _process = process;

    process.stdout.listen((e) => Log.d(_kTag, '[STDOUT] ${String.fromCharCodes(e)}'));
    process.stderr.listen((e) => Log.d(_kTag, '[STDERR] ${String.fromCharCodes(e)}'));
  }

  @override
  Future<void> stopRecord() async {
    Log.i(_kTag, 'stopRecord begin');

    final process = _process;
    _process = null;
    if (process == null) return;

    Log.i(_kTag, 'stopRecord send signals');
    process.kill(ProcessSignal.sigint);
    process.kill(ProcessSignal.sigterm);

    Log.i(_kTag, 'stopRecord await exitCode');
    final exitCode = await process.exitCode;

    Log.i(_kTag, 'stopRecord exitCode=$exitCode');
    if (exitCode != 0) throw Exception('Process execution failed! exitCode=$exitCode');
  }
}

class _VideoRecorderServiceNoOp extends VideoRecorderService {
  static const _kTag = 'VideoRecorderServiceNoOp';

  @override
  Future<void> startRecord(String targetPath) async {
    Log.i(_kTag, 'startRecord but do nothing');
  }

  @override
  Future<void> stopRecord() async {
    Log.i(_kTag, 'stopRecord but do nothing');
  }
}
