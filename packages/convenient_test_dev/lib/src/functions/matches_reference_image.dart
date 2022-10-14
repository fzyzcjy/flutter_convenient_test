import 'dart:ui' as ui;

import 'package:convenient_test_dev/convenient_test_dev.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

// ignore: implementation_imports, unnecessary_import
import 'package:flutter_test/src/_matchers_io.dart' if (dart.library.html) 'package:flutter_test/src/_matchers_web.dart'
    show captureImage;

// ignore: implementation_imports
import 'package:test_api/src/expect/async_matcher.dart';

AsyncMatcher matchesEnhancedReferenceImage(
  ui.Image image,
  GoldenConfig config,
) =>
    _MatchesEnhancedReferenceImage(image, config);

// NOTE MODIFIED from [_MatchesReferenceImage]
class _MatchesEnhancedReferenceImage extends AsyncMatcher {
  const _MatchesEnhancedReferenceImage(this.referenceImage, this.config);

  final ui.Image referenceImage;
  final GoldenConfig config;

  @override
  Future<String?> matchAsync(dynamic item) async {
    Future<ui.Image> imageFuture;
    if (item is Future<ui.Image>) {
      imageFuture = item;
    } else if (item is ui.Image) {
      imageFuture = Future<ui.Image>.value(item);
    } else {
      final Finder finder = item as Finder;
      final Iterable<Element> elements = finder.evaluate();
      if (elements.isEmpty) {
        return 'could not be rendered because no widget was found';
      } else if (elements.length > 1) {
        return 'matched too many widgets';
      }
      imageFuture = captureImage(elements.single);
    }

    final TestWidgetsFlutterBinding binding = TestWidgetsFlutterBinding.instance;
    return binding.runAsync<String?>(() async {
      final ui.Image image = await imageFuture;

      if (referenceImage.height != image.height || referenceImage.width != image.width) {
        return 'does not match as width or height do not match. $image != $referenceImage';
      }

      // NOTE MODIFIED
      //
      // original
      //
      // final ByteData? bytes = await image.toByteData();
      // if (bytes == null) {
      //   return 'could not be encoded.';
      // }
      //
      // final ByteData? referenceBytes = await referenceImage.toByteData();
      // if (referenceBytes == null) {
      //   return 'could not have its reference image encoded.';
      // }
      //
      // final int countDifferentPixels = _countDifferentPixels(
      //   Uint8List.view(bytes.buffer),
      //   Uint8List.view(referenceBytes.buffer),
      // );
      // return countDifferentPixels == 0
      //     ? null
      //     : 'does not match on $countDifferentPixels pixels';
      //
      // new (below)
      // ref [EnhancedLocalFileComparator]
      final result = await compareUiImages(image, referenceImage);
      if (!config.check(result)) {
        return 'does not match some pixels '
            'pixelDiffHistogram=${result.pixelDiffHistogram}';
      }
      if (!result.passed) {
        debugPrint('A tolerable difference of '
            'diffPercent=${result.diffPercent * 100}% '
            'with pixelDiffHistogram=${result.pixelDiffHistogram} '
            'was found when comparing golden.');
      }
      return null;
    });
  }

  @override
  Description describe(Description description) {
    return description.add(
      'rasterized image matches that of a $referenceImage reference image',
    );
  }
}
