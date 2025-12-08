import 'dart:math';

import 'package:meta/meta.dart';

class IdGenerator {
  static final instance = IdGenerator.raw(
    dataCenterId: 0,
    workerId: Random().nextInt(1 << _kDefaultConfig.workerIdBits),
  );

  final SnowflakeConfig config;
  final int dataCenterId;
  final int workerId;
  final int Function() currentTimeSupplier;

  int sequence = 0;
  int lastTimestamp = -1;

  @visibleForTesting
  IdGenerator.raw({
    this.config = _kDefaultConfig,
    required this.dataCenterId,
    required this.workerId,
    this.currentTimeSupplier = _realCurrentTimeSupplier,
  });

  int nextId() {
    var timestamp = currentTimeSupplier();

    if (timestamp < lastTimestamp) {
      throw Exception(
        'Clock moved backwards (timestamp=$timestamp lastTimestamp=$lastTimestamp)',
      );
    }

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

  int _tilNextMillis(int lastTimestamp) {
    var timestamp = currentTimeSupplier();
    while (timestamp <= lastTimestamp) {
      timestamp = currentTimeSupplier();
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
      throw Exception(
        'timestamp=$timestamp smaller than twEpoch=${config.twEpoch}',
      );
    }

    assert(workerId >= 0);
    assert(sequence >= 0);

    return ((timestamp - config.twEpoch) << config.timestampShift) |
        (dataCenterId << config.dataCenterIdShift) |
        (workerId << config.workerIdShift) |
        sequence;
  }
}

int _realCurrentTimeSupplier() => DateTime.now().millisecondsSinceEpoch;

const _kDefaultConfig = SnowflakeConfig(
  twEpoch: 1640995200000,
  workerIdBits: 10,
  dataCenterIdBits: 0,
  sequenceBits: 5,
);

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
