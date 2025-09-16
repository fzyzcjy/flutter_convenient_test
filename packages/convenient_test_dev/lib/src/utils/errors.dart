import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
// ignore: deprecated_member_use
import 'package:test_api/test_api.dart' as test_package;

void setUpConvenientTestExceptionReporter() {
  // NOTE By reading comments of [reportTestException], we see its purpose is just what we want - customize error catching
  final oldReportTestException = reportTestException;
  reportTestException = (errorDetails, testDescription) {
    _convenientTestTestExceptionReporter(errorDetails, testDescription);
    oldReportTestException(errorDetails, testDescription);
  };
}

void setUpFlutterOnError() {
  final oldOnError = FlutterError.onError;
  FlutterError.onError = (details) {
    FlutterError.dumpErrorToConsole(details, forceReport: true);
    oldOnError?.call(details);
  };
}

/// edited from flutter's `_defaultTestExceptionReporter`
/// https://github.com/flutter/flutter/blob/e7b7ebc066c1b2a5aa5c19f8961307427e0142a6/packages/flutter_test/lib/src/test_exception_reporter.dart#L31
void _convenientTestTestExceptionReporter(
  FlutterErrorDetails errorDetails,
  String testDescription,
) {
  FlutterError.dumpErrorToConsole(errorDetails, forceReport: true);
  test_package.registerException(
    _dumpErrorToString(errorDetails),
    errorDetails.stack ?? StackTrace.empty,
  );
}

/// ref [FlutterError.dumpErrorToConsole], but output to String not console
String _dumpErrorToString(FlutterErrorDetails details) {
  // NOTE According to comments of [dumpErrorToConsole], can *only* used in `dev` mode, not `profile/release` mode.
  //      Thus, if want it in profile/release, need to copy other code in [dumpErrorToConsole]. (Not copied yet)
  return TextTreeRenderer(
        wrapWidth: FlutterError.wrapWidth,
        wrapWidthProperties: FlutterError.wrapWidth,
        maxDescendentsTruncatableNode: 5,
      )
      .render(details.toDiagnosticsNode(style: DiagnosticsTreeStyle.error))
      .trimRight();
}
