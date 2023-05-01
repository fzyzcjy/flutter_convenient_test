// ignore_for_file: implementation_imports

import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:test_api/src/backend/declarer.dart';
import 'package:test_api/src/backend/group.dart';
import 'package:test_api/src/backend/group_entry.dart';
import 'package:test_api/src/backend/test.dart';

class SpyDeclarer implements Declarer {
  final Declarer inner;
  final GeneralizedGroup info;

  SpyDeclarer(this.inner, this.info);

  static GeneralizedGroup withSpy(void Function() body, {GeneralizedGroup? info}) {
    final originalDeclarer = Declarer.current!;
    final spyDeclarer = SpyDeclarer(originalDeclarer, info ?? GeneralizedGroup(name: null));
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
    final innerInfo = GeneralizedGroup(name: _prefix(name));
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
    info.entries.add(GeneralizedTest(name: _prefix(name)));
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

  // ref: [Declarer._prefix]
  /// Returns [name] prefixed with this declarer's group name.
  String _prefix(String name) => info.name == null ? name : '${info.name} $name';
}

/// 类比[GroupEntry]
abstract class GeneralizedGroupEntry {
  final String? name;

  const GeneralizedGroupEntry({required this.name});

  factory GeneralizedGroupEntry.from(GroupEntry entry) {
    if (entry is Group) return GeneralizedGroup.from(entry);
    if (entry is Test) return GeneralizedTest.from(entry);
    throw UnimplementedError;
  }
}

/// 类比[Group]
class GeneralizedGroup extends GeneralizedGroupEntry {
  final entries = <GeneralizedGroupEntry>[];

  GeneralizedGroup({required super.name});

  factory GeneralizedGroup.from(Group group) =>
      GeneralizedGroup(name: group.name)..entries.addAll(group.entries.map(GeneralizedGroupEntry.from).toList());

  @override
  String toString() => 'GeneralizedGroup{name: $name, entries: $entries}';
}

/// 类比[Test]
class GeneralizedTest extends GeneralizedGroupEntry {
  const GeneralizedTest({required super.name});

  factory GeneralizedTest.from(Test test) => GeneralizedTest(name: test.name);

  @override
  String toString() => 'GeneralizedTest{name: $name}';
}
