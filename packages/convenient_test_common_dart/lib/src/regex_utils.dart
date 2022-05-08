class RegexUtils {
  static const kMatchNothing = r'match-nothing^$';

  static const kMatchEverything = '.*';

  static String matchPrefix(String name) => '^${RegExp.escape(name)}.*';

  static String matchFull(String name) => '^${RegExp.escape(name)}\$';
}
