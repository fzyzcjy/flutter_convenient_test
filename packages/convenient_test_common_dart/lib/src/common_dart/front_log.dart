class Log {
  static final instance = Log._();

  Log._();

  static void t(String tag, String msg) => instance.log(kLevelTrace, tag, msg);

  static void d(String tag, String msg) => instance.log(kLevelDebug, tag, msg);

  static void i(String tag, String msg) => instance.log(kLevelInfo, tag, msg);

  static void w(String tag, String msg) => instance.log(kLevelWarn, tag, msg);

  static void e(String tag, String msg) => instance.log(kLevelError, tag, msg);

  var minLevel = kLevelDebug;
  BaseLogFormatter formatter = StandardLogFormatter();
  BaseLogWriter writer = StdoutLogWriter();
  void Function(int level, String tag, String msg)? onLog;

  void log(int level, String tag, String msg, [List<String> directContext = const []]) {
    final completeContext = directContext;

    if (level >= minLevel) {
      final time = DateTime.now();
      final formatted = formatter.format(time, level, tag, msg, completeContext);
      writer.write(formatted);
    }

    onLog?.call(level, tag, msg);
  }

  // ref: http://logback.qos.ch/apidocs/src-html/ch/qos/logback/classic/Level.html#line.30
  static const kLevelTrace = 5000;
  static const kLevelDebug = 10000;
  static const kLevelInfo = 20000;
  static const kLevelWarn = 30000;
  static const kLevelError = 40000;
}

abstract class BaseLogFormatter {
  String format(DateTime time, int level, String tag, String msg, List<String>? context);
}

class StandardLogFormatter extends BaseLogFormatter {
  @override
  String format(DateTime time, int level, String tag, String msg, List<String>? context) {
    final timeStr = time.toUtc().toIso8601String();

    final levelStr = _getLevelStr(level);

    final contextStr = context != null && context.isNotEmpty ? ' (${context.join(" ")})' : '';

    // NOTE do not use `NL` for better stdout printing
    // final msgAndContextTransformed = (msg + contextStr).replaceAll('\n', '[NL]');
    final msgAndContextTransformed = msg + contextStr;

    return '$timeStr|$levelStr|$tag|$msgAndContextTransformed';
  }

  String _getLevelStr(int level) {
    switch (level) {
      case Log.kLevelTrace:
        return 'trace';
      case Log.kLevelDebug:
        return 'debug';
      case Log.kLevelInfo:
        return 'info';
      case Log.kLevelWarn:
        return 'warn';
      case Log.kLevelError:
        return 'error';
      default:
        return '-';
    }
  }
}

abstract class BaseLogWriter {
  void write(String message);

  void dispose();
}

class StdoutLogWriter extends BaseLogWriter {
  @override
  void dispose() {}

  @override
  void write(String message) => _printWrapped(message);
}

void _printWrapped(String text) {
  final pattern = RegExp('.{1,800}'); // 800 is the size of each chunk
  // ignore: avoid_print
  pattern.allMatches(text).forEach((match) => print(match.group(0)));
}
