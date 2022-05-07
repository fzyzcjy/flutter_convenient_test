import 'package:convenient_test_common/convenient_test_common.dart';
import 'package:flutter_test/flutter_test.dart';

// ignore: implementation_imports
import 'package:test_api/src/backend/declarer.dart';

class MyDeclarer extends Declarer {
  // NOTE use this for flaky test retrying, see #16
  final int defaultRetry;

  MyDeclarer({required this.defaultRetry});

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
      // NOTE
      TestNameTransformer.assemble(name, IdGenerator.instance.nextId()),
      body,
      testOn: testOn,
      timeout: timeout,
      skip: skip,
      onPlatform: onPlatform,
      tags: tags,
      // NOTE
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
    int? retry,
    bool solo = false,
  }) {
    super.group(
      // NOTE
      TestNameTransformer.assemble(name, IdGenerator.instance.nextId()),
      body,
      testOn: testOn,
      timeout: timeout,
      skip: skip,
      onPlatform: onPlatform,
      tags: tags,
      // NOTE
      retry: retry ?? defaultRetry,
      solo: solo,
    );
  }
}
