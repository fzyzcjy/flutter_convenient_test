// ignore_for_file: implementation_imports
import 'package:convenient_test_common/convenient_test_common.dart';
import 'package:test_api/src/backend/group.dart';
import 'package:test_api/src/backend/group_entry.dart';
import 'package:test_api/src/backend/test.dart';

class SuiteInfoConverter {
  final _idStableGenerator = _GroupEntryIdStableGenerator();

  SuiteInfoConverter._();

  static SuiteInfoProto convert(Group root) {
    final target = SuiteInfoProto();
    target.groupId = SuiteInfoConverter._()._convertGroup(root, target, -1).toInt64();
    return target;
  }

  int _convertGroup(Group entry, SuiteInfoProto target, int parentId) {
    final id = _idStableGenerator.generate(entry.name);
    target.groups.add(GroupInfoProto(
      id: id.toInt64(),
      name: entry.name,
      parentId: parentId.toInt64(),
      entryIds: entry.entries.map((child) => _convertGroupEntry(child, target, id).toInt64()).toList(),
    ));
    return id;
  }

  int _convertTest(Test entry, SuiteInfoProto target, int parentId) {
    final id = _idStableGenerator.generate(entry.name);
    target.tests.add(TestInfoProto(
      id: id.toInt64(),
      name: entry.name,
      parentId: parentId.toInt64(),
    ));
    return id;
  }

  int _convertGroupEntry(GroupEntry entry, SuiteInfoProto target, int parentId) {
    if (entry is Group) return _convertGroup(entry, target, parentId);
    if (entry is Test) return _convertTest(entry, target, parentId);
    throw Exception('Unknown entry=$entry');
  }
}

class _GroupEntryIdStableGenerator {
  final _seenNames = <String>{};
  final _seenIds = <int>{};

  int generate(String name) {
    if (_seenNames.contains(name)) throw AssertionError;

    final id = _generateWithoutSave(name);
    if (_seenIds.contains(id)) throw AssertionError;

    _seenNames.add(name);
    _seenIds.add(id);

    return id;
  }

  int _generateWithoutSave(String name) {
    var ansId = name.hashCode;

    // linear probing
    while (_seenIds.contains(ansId)) {
      ansId++;
    }

    return ansId;
  }
}
