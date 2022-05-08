import 'package:convenient_test_common_dart/convenient_test_common_dart.dart';
import 'package:test/test.dart';

void main() {
  group('RegexUtils', () {
    test('simple', () {
      expect(RegexUtils.matchPrefix('c++'), r'^c\+\+.*');
      expect(RegexUtils.matchFull('c++'), r'^c\+\+$');
      expect(RegExp.escape('c++'), r'c\+\+');
    });
  });
}
