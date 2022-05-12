import 'dart:typed_data';
import 'dart:ui';

import 'package:convenient_test_common/convenient_test_common.dart';
import 'package:convenient_test_dev/src/functions/log.dart';
import 'package:convenient_test_dev/src/support/compile_time_config.dart';
import 'package:flutter/foundation.dart';
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

  // NOTE MODIFIED from [super.compare]
  @override
  Future<bool> compare(Uint8List imageBytes, Uri golden) async {
    // NOTE MODIFIED [GoldenFileComparator.compareLists] -> [_myCompareLists]
    final ComparisonResult result = await _myCompareLists(
      imageBytes,
      await getGoldenBytes(golden),
    );

    if (!result.passed) {
      final String error = await generateFailureOutput(result, golden, basedir);
      throw FlutterError(error);
    }
    return result.passed;
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

Future<ComparisonResult> _myCompareLists(List<int> test, List<int> master) async {
  const _kTag = 'myCompareLists';

  final raw = await GoldenFileComparator.compareLists(test, master);

  if (!raw.passed && (raw.error ?? '').startsWith('Pixel test failed, image sizes do not match.')) {
    Log.d(_kTag, 'see result.error=${raw.error}, thus change image size and re-compare');

    return TODO;
  }

  return raw;
}
