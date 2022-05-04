import 'package:flutter_test/flutter_test.dart';

// ignore: implementation_imports
import 'package:test_api/src/backend/declarer.dart';

class MyDeclarer extends Declarer {
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
  }) {
    super.test(
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
  }) {
    super.group(
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
}
