import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

class ElementHitTestableMatcher extends Matcher {
  final WidgetTester tester;

  const ElementHitTestableMatcher(this.tester);

  @override
  Description describe(Description description) {
    return description.add('is hit-testable');
  }

  @override
  bool matches(covariant Finder item, Map<dynamic, dynamic> matchState) {
    try {
      tester.getCenter(item, warnIfMissed: true);
      return true;
      // ignore: avoid_catching_errors
    } on FlutterError catch (e) {
      if (e.toString().contains(
        'Finder specifies a widget that would not receive pointer events.',
      )) {
        matchState[_kMatchStateKeyError] = e;
        return false;
      }
      rethrow;
    }
  }

  @override
  Description describeMismatch(
    dynamic item,
    Description mismatchDescription,
    Map<dynamic, dynamic> matchState,
    bool verbose,
  ) {
    final e = matchState[_kMatchStateKeyError] as FlutterError;
    return mismatchDescription.add('is not hit-testable (error=$e)');
  }

  static const _kMatchStateKeyError = 'ERROR';
}
