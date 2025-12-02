import 'dart:io';

import 'package:convenient_test_common_dart/convenient_test_common_dart.dart';

abstract class ScreenVideoRecorderService {
  static ScreenVideoRecorderService create() {
    // TODO add Android support
    final inner =
        _ScreenVideoRecorderServiceIosSimulator.maybeCreate() ??
        _ScreenVideoRecorderServiceNoOp();
    return _ScreenVideoRecorderServiceIsolateExceptionDecorator(inner);
  }

  Future<void> startRecord(String targetPath);

  Future<void> stopRecord();
}

class _ScreenVideoRecorderServiceIsolateExceptionDecorator
    implements ScreenVideoRecorderService {
  static const _kTag = 'ScreenVideoRecorderServiceIsolateExceptionDecorator';

  final ScreenVideoRecorderService inner;

  _ScreenVideoRecorderServiceIsolateExceptionDecorator(this.inner);

  @override
  Future<void> startRecord(String targetPath) =>
      _captureException(() => inner.startRecord(targetPath));

  @override
  Future<void> stopRecord() => _captureException(inner.stopRecord);

  Future<void> _captureException(Future<void> Function() body) async {
    try {
      await body();
    } catch (e, s) {
      Log.w(_kTag, 'capture and ignore exception e=$e s=$s');
    }
  }
}

class _ScreenVideoRecorderServiceIosSimulator
    extends ScreenVideoRecorderService {
  static const _kTag = 'ScreenVideoRecorderServiceIosSimulator';

  static _ScreenVideoRecorderServiceIosSimulator? maybeCreate() {
    // non-mac computers cannot have ios simulators
    if (!Platform.isMacOS) return null;

    return _ScreenVideoRecorderServiceIosSimulator();
  }

  Process? _process;

  @override
  Future<void> startRecord(String targetPath) async {
    Log.i(_kTag, 'startRecord begin $targetPath');

    if (_process != null) await stopRecord();

    final process = await Process.start('xcrun', [
      'simctl',
      'io',
      'booted',
      'recordVideo',
      targetPath,
    ]);
    _process = process;

    process.stdout.listen(
      (e) => Log.d(_kTag, '[STDOUT] ${String.fromCharCodes(e)}'),
    );
    process.stderr.listen(
      (e) => Log.d(_kTag, '[STDERR] ${String.fromCharCodes(e)}'),
    );
  }

  @override
  Future<void> stopRecord() async {
    Log.i(_kTag, 'stopRecord begin');

    final process = _process;
    _process = null;
    if (process == null) {
      Log.w(_kTag, 'stopRecord skip since process==null');
      return;
    }

    Log.i(_kTag, 'stopRecord send signals');
    process.kill(ProcessSignal.sigint); // simulate Ctrl+C
    // process.kill(ProcessSignal.sigterm);

    Log.i(_kTag, 'stopRecord await exitCode');
    final exitCode = await process.exitCode;

    Log.i(_kTag, 'stopRecord exitCode=$exitCode');
    if (exitCode != 0) {
      throw Exception('Process execution failed! exitCode=$exitCode');
    }
  }
}

class _ScreenVideoRecorderServiceNoOp extends ScreenVideoRecorderService {
  static const _kTag = 'ScreenVideoRecorderServiceNoOp';

  @override
  Future<void> startRecord(String targetPath) async {
    Log.i(_kTag, 'startRecord but do nothing');
  }

  @override
  Future<void> stopRecord() async {
    Log.i(_kTag, 'stopRecord but do nothing');
  }
}
