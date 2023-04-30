import 'package:flutter_test/flutter_test.dart';

// ignore: implementation_imports
import 'package:test_api/src/backend/declarer.dart';

// ignore: implementation_imports
import 'package:test_api/src/backend/group.dart';

class SpyDeclarer implements Declarer {
  final Declarer inner;

  SpyDeclarer(this.inner);

  @override
  void addTearDownAll(dynamic Function() callback) => inner.addTearDownAll(callback);

  @override
  Group build() => inner.build();

  @override
  T declare<T>(T Function() body) => inner.declare(body);

  @override
  void setUp(dynamic Function() callback) => inner.setUp(callback);

  @override
  void setUpAll(dynamic Function() callback) => inner.setUpAll(callback);

  @override
  void tearDown(dynamic Function() callback) => inner.tearDown(callback);

  @override
  void tearDownAll(dynamic Function() callback) => inner.tearDownAll(callback);

  @override
  void group(
    String name,
    void Function() body, {
    String? testOn,
    Timeout? timeout,
    dynamic skip,
    Map<String, dynamic>? onPlatform,
    dynamic tags,
    int? retry,
    bool solo = false,
  }) =>
      inner.group(
        name,
        body,
        testOn: testOn,
        timeout: timeout,
        skip: skip,
        onPlatform: onPlatform,
        tags: tags,
        retry: retry,
        solo: solo,
      );

  @override
  void test(
    String name,
    dynamic Function() body, {
    String? testOn,
    Timeout? timeout,
    dynamic skip,
    Map<String, dynamic>? onPlatform,
    dynamic tags,
    int? retry,
    bool solo = false,
  }) =>
      inner.test(
        name,
        body,
        testOn: testOn,
        timeout: timeout,
        skip: skip,
        onPlatform: onPlatform,
        tags: tags,
        retry: retry,
        solo: solo,
      );
}
