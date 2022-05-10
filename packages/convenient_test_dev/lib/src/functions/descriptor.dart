import 'package:flutter_test/flutter_test.dart';

class Descriptor {
  String formatLogOfExpect(
    dynamic actual,
    Matcher matcher, {
    required String? overrideActualDescription,
  }) {
    return '{${overrideActualDescription ?? format(actual)}} matches {${format(matcher)}}';
  }

  String format(Object? object) {
    final raw = _preFormat(object);
    return _beautify(raw);
  }

  String _preFormat(Object? object) {
    if (object is Finder) return object.description;
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

  static final _replacers = <_Replacer>[
    _substituteReplacer,
  ];

  static String? _substituteReplacer(String raw) => const {
        'exactly one matching node in the widget tree': 'findsOneWidget',
        'no matching nodes in the widget tree': 'findsNothing',
      }[raw];
}

typedef _Replacer = String? Function(String);
