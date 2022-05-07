import 'package:meta/meta.dart';

class TestNameTransformer {
  // need to put id at postfix, not prefix. because test name is prefixed by group name
  static String assemble(String rawName, int id) => TODO;

  static String dissemble(String rawName, int id) => TODO;
}

@immutable
class NameAndId {
  final String rawName;
  final int id;

  const NameAndId(this.rawName, this.id);
}
