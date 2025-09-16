import 'package:flutter_test/flutter_test.dart';
import 'package:meta/meta.dart';

class ConvenientTest {
  final WidgetTester tester;

  ConvenientTest._(this.tester);

  static ConvenientTest? get maybeActiveInstance => _activeInstance;

  @internal
  static ConvenientTest get activeInstance => _activeInstance!;
  static ConvenientTest? _activeInstance;

  static set activeInstance(ConvenientTest? value) {
    if (!((value != null) ^ (_activeInstance != null))) {
      throw Exception(
        'Cannot set activeInstance, either overwrite existing instance or removing non-existing instance. '
        'old=$_activeInstance new=$value',
      );
    }
    _activeInstance = value;
  }

  @internal
  static Future<void> withActiveInstance(
    WidgetTester tester,
    Future<void> Function(ConvenientTest) body,
  ) async {
    final t = ConvenientTest._(tester);
    activeInstance = t;
    try {
      await body(t);
    } finally {
      activeInstance = null;
    }
  }
}
