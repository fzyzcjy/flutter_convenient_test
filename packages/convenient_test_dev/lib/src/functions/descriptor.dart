import 'package:collection/collection.dart';
import 'package:convenient_test_dev/src/data/icon_name_info.dart';
import 'package:flutter_test/flutter_test.dart';

class Descriptor {
  String formatLogOfExpect(
    dynamic actual,
    Matcher matcher, {
    required String? overrideActualDescription,
    Plurality plurality = Plurality.many,
  }) {
    return '{${overrideActualDescription ?? format(actual, plurality)}} '
        'matches {${format(matcher, plurality)}}';
  }

  String format(Object? object, Plurality plurality) {
    final raw = _preFormat(object, plurality);
    return _beautify(raw);
  }

  String _preFormat(Object? object, Plurality plurality) {
    if (object is Finder) return object.describeMatch(plurality);
    if (object is Matcher) return object.describe(StringDescription()).toString();
    return object.toString();
  }

  String _beautify(String raw) {
    var transformed = raw;
    for (final replacer in _replacers) {
      transformed = replacer(transformed) ?? transformed;
    }
    return transformed;
  }

  static final _replacers = <String? Function(String)>[
    _substituteReplacer,
    _iconReplacer,
  ];

  static String? _substituteReplacer(String raw) => const {
        'exactly one matching node in the widget tree': 'findsOneWidget',
        'no matching nodes in the widget tree': 'findsNothing',
      }[raw];

  static final _kIconRegExp = RegExp(r'^icon "IconData\(U\+([0-9A-F]+)\)"$');

  static String? _iconReplacer(String raw) {
    final match = _kIconRegExp.firstMatch(raw);
    if (match == null) return null;

    final iconValueString = match.group(1)!;
    final iconValue = int.parse(iconValueString, radix: 16);
    final iconName = kIconNameInfo.entries.firstWhereOrNull((e) => e.value == iconValue)?.key;

    return 'icon "$iconName"';
  }
}
