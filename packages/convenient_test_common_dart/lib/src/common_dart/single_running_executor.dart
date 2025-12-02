import 'package:convenient_test_common_dart/src/common_dart/front_log.dart';
import 'package:meta/meta.dart';

class SingleRunningExecutor<Arg> {
  static const _kTag = 'SingleRunningExecutor';

  final Future<void> Function(Arg) _runner;

  var _running = false;

  bool get _runAgainAfterCurrentRunFinish =>
      _runAgainAfterCurrentRunFinishPack != null;
  _TriggerPack<Arg>? _runAgainAfterCurrentRunFinishPack;

  SingleRunningExecutor(this._runner);

  void trigger({required Arg arg, required String reason}) => _trigger(
    _TriggerPack(arg: arg, reason: reason, triggerTime: DateTime.now()),
  );

  void _trigger(_TriggerPack<Arg> pack) {
    if (_running) {
      _runAgainAfterCurrentRunFinishPack = pack;
    } else {
      _runAgainAfterCurrentRunFinishPack = null;
      _running = true;

      () async {
        Log.d(
          _kTag,
          'call runner() reason=${pack.reason} triggerTime=${pack.triggerTime} arg=${pack.arg}',
        );
        try {
          await _runner(pack.arg);
        } finally {
          _running = false;
          if (_runAgainAfterCurrentRunFinish) {
            _trigger(_runAgainAfterCurrentRunFinishPack!);
          }
        }
      }();
    }
  }
}

@immutable
class _TriggerPack<Arg> {
  final Arg arg;
  final String reason;
  final DateTime triggerTime;

  const _TriggerPack({
    required this.arg,
    required this.reason,
    required this.triggerTime,
  });
}
