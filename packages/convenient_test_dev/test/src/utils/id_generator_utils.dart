import 'package:convenient_test_dev/src/utils/id_generator.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('IdGenerator', () {
    test('simple', () {
      final generator = IdGenerator.raw(
        dataCenterId: 0,
        workerId: 0,
        currentTimeSupplier: () => 1640995200010,
      );

      expect(327680, generator.nextId());
      expect(327681, generator.nextId());
      expect(327682, generator.nextId());
      expect(327683, generator.nextId());
    });
  });
}
