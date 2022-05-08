class RegexUtils {
  static const kMatchNothing = r'match-nothing^$';

  static const kMatchEverything = '.*';

  static String matchPrefix(String name) {
    return '^${escape(name)}.*';
  }

  static String matchFull(String name) {
    return '^${escape(name)}\$';
  }

  static String escape(String name) {
    return TODO;
  }
}
