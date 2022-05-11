import 'dart:ui';

import 'package:convenient_test_dev/convenient_test_dev.dart';
import 'package:convenient_test_dev/src/support/compile_time_config.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:path/path.dart' as path;

class MyLocalFileComparator extends LocalFileComparator {
  MyLocalFileComparator() : super(Uri.file(path.join(CompileTimeConfig.kAppCodeDir, 'integration_test/dummy.dart'))) {
    assert(basedir == Uri.directory(path.join(CompileTimeConfig.kAppCodeDir, 'integration_test')));
  }

  @override
  Future<String> generateFailureOutput(
    ComparisonResult result,
    Uri golden,
    Uri basedir, {
    String key = '',
  }) async {
    // NOTE reference: [super.generateFailureOutput]
    return TestAsyncUtils.guard<String>(() async {
      final log = convenientTestLog('GOLDEN FAIL', 'Golden "$golden": ${result.error}');

      for (final entry in result.diffs?.entries ?? <MapEntry<String, Image>>[]) {
        final pngBytes = await entry.value.toByteData(format: ImageByteFormat.png);
        await log.snapshot(
          name: entry.key,
          image: pngBytes!.buffer.asUint8List(),
        );
      }

      return 'Golden "$golden": ${result.error}';
    });
  }
}
