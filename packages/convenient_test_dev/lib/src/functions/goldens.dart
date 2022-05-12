import 'dart:typed_data';
import 'dart:ui';

import 'package:convenient_test_common/convenient_test_common.dart';
import 'package:convenient_test_dev/src/functions/log.dart';
import 'package:convenient_test_dev/src/support/compile_time_config.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:path/path.dart' as path;

class MyLocalFileComparator extends LocalFileComparator {
  static const _kTag = 'MyLocalFileComparator';

  static MyLocalFileComparator get instance => goldenFileComparator as MyLocalFileComparator;

  GoldenFailureInfo? get lastFailure => _lastFailure;
  GoldenFailureInfo? _lastFailure;

  MyLocalFileComparator() : super(Uri.file(path.join(CompileTimeConfig.kAppCodeDir, 'integration_test/dummy.dart'))) {
    assert(basedir == Uri.directory(path.join(CompileTimeConfig.kAppCodeDir, 'integration_test')));
  }

  // NOTE reference: [super.generateFailureOutput], but this function is (almost) completely rewritten
  @override
  Future<String> generateFailureOutput(
    ComparisonResult result,
    Uri golden,
    Uri basedir, {
    String key = '',
  }) async {
    Log.i(_kTag, 'generateFailureOutput golden=$golden result=$result');

    return TestAsyncUtils.guard<String>(() async {
      final info = GoldenFailureInfo(images: {});

      for (final entry in result.diffs?.entries ?? <MapEntry<String, Image>>[]) {
        final pngBytes = await entry.value.toByteData(format: ImageByteFormat.png);
        info.images[entry.key] = pngBytes!.buffer.asUint8List();
      }

      _lastFailure = info;

      return 'Golden "$golden": ${result.error}';
    });
  }
}

class GoldenFailureInfo {
  final Map<String, Uint8List> images;

  GoldenFailureInfo({
    required this.images,
  });

  Future<void> dumpToLogSnapshot(LogSnapshot logSnapshot) async {
    for (final entry in images.entries) {
      await logSnapshot(name: entry.key, image: entry.value);
    }
  }
}
