import 'package:flutter/foundation.dart';

class IdGenerator {
  static final instance = IdGenerator._();

  final SnowflakeConfig config;
  final int dataCenterId;
  final int workerId;
  int sequence = 0;
  int lastTimestamp = -1;

  IdGenerator._({
    required this.config,
    required this.dataCenterId,
    required this.workerId,
  });

  int nextId() {
    var timestamp = _currentTimeSupplier();

    if (timestamp < lastTimestamp) throw Exception('Clock moved backwards.');

    if (lastTimestamp == timestamp) {
      sequence = (sequence + 1) & config.sequenceMask;
      if (sequence == 0) {
        timestamp = _tilNextMillis(lastTimestamp);
      }
    } else {
      sequence = 0;
    }
    lastTimestamp = timestamp;

    return assembleId(
      config: config,
      timestamp: timestamp,
      dataCenterId: dataCenterId,
      workerId: workerId,
      sequence: sequence,
    );
  }

  static int _currentTimeSupplier() => DateTime.now().millisecondsSinceEpoch;

  static int _tilNextMillis(int lastTimestamp) {
    var timestamp = _currentTimeSupplier();
    while (timestamp <= lastTimestamp) {
      timestamp = _currentTimeSupplier();
    }
    return timestamp;
  }

  static int assembleId({
    required SnowflakeConfig config,
    required int timestamp,
    required int workerId,
    required int dataCenterId,
    required int sequence,
  }) {
    if (timestamp < config.twEpoch) {
      throw Exception('timestamp=$timestamp smaller than twEpoch=${config.twEpoch}');
    }

    assert(workerId >= 0);
    assert(sequence >= 0);

    return ((timestamp - config.twEpoch) << config.timestampShift) |
        (dataCenterId << config.dataCenterIdShift) |
        (workerId << config.workerIdShift) |
        sequence;
  }
}

@immutable
class SnowflakeConfig {
  final int twEpoch;
  final int workerIdBits;
  final int dataCenterIdBits;
  final int sequenceBits;

  const SnowflakeConfig({
    required this.twEpoch,
    required this.workerIdBits,
    required this.dataCenterIdBits,
    required this.sequenceBits,
  });

  int get dataCenterIdShift => sequenceBits + workerIdBits;

  int get workerIdShift => sequenceBits;

  int get timestampShift => sequenceBits + workerIdBits + dataCenterIdBits;

  int get sequenceMask => ~(-1 << sequenceBits);
}
