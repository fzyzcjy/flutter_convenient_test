import 'package:flutter_test/flutter_test.dart';
import 'package:test_api/backend.dart';
// ignore: implementation_imports
import 'package:test_api/src/backend/declarer.dart';

class DeclarerWithDefault extends Declarer {
  // NOTE use this for flaky test retrying, see #16
  final int? defaultRetry;

  DeclarerWithDefault({required this.defaultRetry});

  @override
  void test(
    String name,
    dynamic Function() body, {
    String? testOn,
    Timeout? timeout,
    dynamic skip,
    Map<String, dynamic>? onPlatform,
    dynamic tags,
    TestLocation? location,
    int? retry,
    bool solo = false,
  }) {
    super.test(
      name,
      body,
      testOn: testOn,
      timeout: timeout,
      skip: skip,
      onPlatform: onPlatform,
      tags: tags,
      location: location,
      // NOTE use this for flaky test retrying, see #16
      retry: retry ?? defaultRetry,
      solo: solo,
    );
  }

  @override
  void group(
    String name,
    void Function() body, {
    String? testOn,
    Timeout? timeout,
    dynamic skip,
    Map<String, dynamic>? onPlatform,
    dynamic tags,
    TestLocation? location,
    int? retry,
    bool solo = false,
  }) {
    super.group(
      name,
      body,
      testOn: testOn,
      timeout: timeout,
      skip: skip,
      onPlatform: onPlatform,
      tags: tags,
      location: location,
      // NOTE use this for flaky test retrying, see #16
      retry: retry ?? defaultRetry,
      solo: solo,
    );
  }
}
