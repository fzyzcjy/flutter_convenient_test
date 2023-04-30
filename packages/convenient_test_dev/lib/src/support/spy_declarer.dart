// ignore_for_file: implementation_imports

import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:test_api/src/backend/declarer.dart';
import 'package:test_api/src/backend/group.dart';
import 'package:test_api/src/backend/group_entry.dart';
import 'package:test_api/src/backend/test.dart';

class SpyDeclarer implements Declarer {
  final Declarer inner;
  final SpyDeclarerGroup info;

  SpyDeclarer(this.inner, this.info);

  static SpyDeclarerGroup withSpy(void Function() body, {SpyDeclarerGroup? info}) {
    final originalDeclarer = Declarer.current!;
    final spyDeclarer = SpyDeclarer(originalDeclarer, info ?? SpyDeclarerGroup(name: ''));
    runZoned(body, zoneValues: {#test.declarer: spyDeclarer});
    return spyDeclarer.info;
  }

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
  }) {
    final innerInfo = SpyDeclarerGroup(name: name);
    info.entries.add(innerInfo);

    inner.group(
      name,
      () => SpyDeclarer.withSpy(body, info: innerInfo),
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
    info.entries.add(SpyDeclarerTest(name: name));
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
}

/// 类比[GroupEntry]
abstract class SpyDeclarerGroupEntry {
  final String name;

  const SpyDeclarerGroupEntry({required this.name});
}

/// 类比[Group]
class SpyDeclarerGroup extends SpyDeclarerGroupEntry {
  final entries = <SpyDeclarerGroupEntry>[];

  SpyDeclarerGroup({required super.name});

  @override
  String toString() => 'SpyDeclarerGroup{name: $name, entries: $entries}';
}

/// 类比[Test]
class SpyDeclarerTest extends SpyDeclarerGroupEntry {
  const SpyDeclarerTest({required super.name});

  @override
  String toString() => 'SpyDeclarerTest{name: $name}';
}
