import 'dart:async';
import 'dart:convert' hide Codec;
import 'dart:math';
import 'dart:ui';

import 'package:convenient_test_common/convenient_test_common.dart';
import 'package:convenient_test_dev/src/functions/log.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_test/flutter_test.dart' as flutter_test;
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image/image.dart' as image;
import 'package:path/path.dart' as path;

part 'goldens.g.dart';

@immutable
class GoldenMatcherGenerator {
  final String folder;
  final String extension;

  const GoldenMatcherGenerator({
    required this.folder,
    this.extension = 'png',
  });

  Matcher call(String stem, [GoldenConfig? config]) => flutter_test.matchesGoldenFile(_generateKey(stem, config));

  Uri _generateKey(String stem, GoldenConfig? config) =>
      EnhancedLocalFileComparator.createUri('$folder/$stem.$extension', config);
}

class EnhancedLocalFileComparator extends LocalFileComparator {
  static const _kTag = 'EnhancedLocalFileComparator';

  static EnhancedLocalFileComparator get instance => goldenFileComparator as EnhancedLocalFileComparator;

  final bool captureFailure;

  GoldenFailureInfo? get lastFailure => _lastFailure;
  GoldenFailureInfo? _lastFailure;

  EnhancedLocalFileComparator(super.testFile, {required this.captureFailure});

  // ref https://github.com/flutter/flutter/pull/77014#issuecomment-1048896776
  factory EnhancedLocalFileComparator.configFromCurrent({required bool captureFailure}) => EnhancedLocalFileComparator(
        Uri.file(path.join(path.fromUri((goldenFileComparator as LocalFileComparator).basedir), 'something.dart')),
        captureFailure: captureFailure,
      );

  String get basedirPath => path.fromUri(basedir);

  static Uri createUri(String path, GoldenConfig? config) => config.toUri(path);

  // NOTE MODIFIED from [super.compare]
  @override
  Future<bool> compare(Uint8List imageBytesBeforeCrop, Uri golden) async {
    final config = GoldenConfig.fromUri(golden);

    final imageBytesCropped = _cropImage(imageBytesBeforeCrop, config.cropBbox);

    // NOTE MODIFIED [GoldenFileComparator.compareLists] -> [myCompareLists]
    final MyComparisonResult result = await myCompareLists(
      imageBytesCropped,
      await getGoldenBytes(golden),
    );

    // ref https://github.com/flutter/flutter/pull/77014#issuecomment-1048896776
    if (!config.check(result)) {
      // print('hi ${basedir.path}');
      final String error =
          // ignore: prefer_interpolation_to_compose_strings
          await generateFailureOutput(result, golden, basedir) + '\npixelDiffHistogram=${result.pixelDiffHistogram}';
      throw FlutterError(error);
    }
    if (!result.passed) {
      Log.d(
          _kTag,
          'A tolerable difference of '
          'diffPercent=${result.diffPercent * 100}% '
          'with pixelDiffHistogram=${result.pixelDiffHistogram} '
          'was found when comparing $golden.');
    }
    return true;

    // if (!result.passed) {
    //   final String error = await generateFailureOutput(result, golden, basedir);
    //   throw FlutterError(error);
    // }
    // return result.passed;
  }

  @override
  Future<void> update(Uri golden, Uint8List imageBytesBeforeCrop) async {
    final config = GoldenConfig.fromUri(golden);

    if (!config.allowUpdate) {
      Log.d(_kTag, 'update() is requested but skipped (golden=$golden)');
      return;
    }

    final imageBytesCropped = _cropImage(imageBytesBeforeCrop, config.cropBbox);

    await super.update(golden, imageBytesCropped);
  }

  @override
  Future<String> generateFailureOutput(ComparisonResult result, Uri golden, Uri basedir, {String key = ''}) async {
    return captureFailure
        ? _generateFailureOutputByCapturingFailure(result, golden, basedir, key: key)
        : super.generateFailureOutput(result, golden, basedir, key: key);
  }

  // NOTE reference: [super.generateFailureOutput], but this function is (almost) completely rewritten
  Future<String> _generateFailureOutputByCapturingFailure(ComparisonResult result, Uri golden, Uri basedir,
      {String key = ''}) async {
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

  static Future<MyComparisonResult> myCompareLists(List<int> test, List<int> master) async =>
      _compareListsAllowSizeDiffer(test, master);
}

Uint8List _cropImage(Uint8List raw, Rectangle<int>? bbox) {
  if (bbox == null) return raw;

  final rawImage = image.decodeImage(raw)!;
  final croppedImage = image.copyCrop(rawImage, bbox.left, bbox.top, bbox.width, bbox.height);
  return image.encodeBmp(croppedImage) as Uint8List;
}

Future<MyComparisonResult> _compareListsAllowSizeDiffer(List<int> test, List<int> master) async {
  const _kTag = 'myCompareLists';

  final raw = await _compareListsWithExtraOutput(test, master);

  if (!raw.passed && (raw.error ?? '').startsWith('Pixel test failed, image sizes do not match.')) {
    Log.d(_kTag, 'see result.error=${raw.error}, thus change image size and re-compare');
    return _compareListsGivenSizeDiffer(test, master, raw);
  }

  return raw;
}

Future<MyComparisonResult> _compareListsGivenSizeDiffer(
    List<int> testRaw, List<int> masterRaw, ComparisonResult rawResult) async {
  final testRawImage = image.decodeImage(testRaw)!;
  final masterRawImage = image.decodeImage(masterRaw)!;

  final targetWidth = max(testRawImage.width, masterRawImage.width);
  final targetHeight = max(testRawImage.height, masterRawImage.height);

  List<int> padAndEncode(image.Image src) {
    final dst = image.Image(targetWidth, targetHeight);
    image.copyInto(dst, src, blend: false);
    return image.encodeNamedImage(dst, 'temp.png')!;
  }

  final testTarget = padAndEncode(testRawImage);
  final masterTarget = padAndEncode(masterRawImage);

  final secondResult = await _compareListsWithExtraOutput(testTarget, masterTarget);

  return MyComparisonResult(
    passed: false,
    diffPercent: secondResult.diffPercent,
    error: '${secondResult.error}\nOriginal result: ${rawResult.error}',
    diffs: secondResult.diffs,
    pixelDiffHistogram: secondResult.pixelDiffHistogram,
  );
}

// NOTE MODIFIED from [compareLists]
/// Returns a [MyComparisonResult] to describe the pixel differential of the
/// [test] and [master] image bytes provided.
Future<MyComparisonResult> _compareListsWithExtraOutput(List<int>? test, List<int>? master) async {
  if (identical(test, master)) {
    return MyComparisonResult(
      passed: true,
      diffPercent: 0.0,
      pixelDiffHistogram: null, // NOTE MODIFIED ADD
    );
  }

  if (test == null || master == null || test.isEmpty || master.isEmpty) {
    return MyComparisonResult(
      passed: false,
      diffPercent: 1.0,
      error: 'Pixel test failed, null image provided.',
      pixelDiffHistogram: null, // NOTE MODIFIED ADD
    );
  }

  final Codec testImageCodec = await instantiateImageCodec(Uint8List.fromList(test));
  final Image testImage = (await testImageCodec.getNextFrame()).image;

  final Codec masterImageCodec = await instantiateImageCodec(Uint8List.fromList(master));
  final Image masterImage = (await masterImageCodec.getNextFrame()).image;

  return await compareUiImages(testImage, masterImage);
}

// NOTE extracted from [_compareLists]
Future<MyComparisonResult> compareUiImages(Image testImage, Image masterImage) async {
  final ByteData? testImageRgba = await testImage.toByteData();
  final ByteData? masterImageRgba = await masterImage.toByteData();

  final int width = testImage.width;
  final int height = testImage.height;

  if (width != masterImage.width || height != masterImage.height) {
    return MyComparisonResult(
      passed: false,
      diffPercent: 1.0,
      pixelDiffHistogram: null, // NOTE MODIFIED ADD
      error: 'Pixel test failed, image sizes do not match.\n'
          'Master Image: ${masterImage.width} X ${masterImage.height}\n'
          'Test Image: ${testImage.width} X ${testImage.height}',
    );
  }

  int pixelDiffCount = 0;
  final int totalPixels = width * height;
  final pixelDiffHistogram = SimpleHistogram(totalSampleCount: totalPixels); // NOTE MODIFIED ADD
  final ByteData invertedMasterRgba = _invert(masterImageRgba!);
  final ByteData invertedTestRgba = _invert(testImageRgba!);

  final Uint8List testImageBytes = (await testImage.toByteData())!.buffer.asUint8List();
  final ByteData maskedDiffRgba = ByteData(testImageBytes.length);
  maskedDiffRgba.buffer.asUint8List().setRange(0, testImageBytes.length, testImageBytes);
  final ByteData isolatedDiffRgba = ByteData(width * height * 4);

  for (int x = 0; x < width; x++) {
    for (int y = 0; y < height; y++) {
      final int byteOffset = (width * y + x) * 4;
      final int testPixel = testImageRgba.getUint32(byteOffset);
      final int masterPixel = masterImageRgba.getUint32(byteOffset);

      final int diffPixel = (_readRed(testPixel) - _readRed(masterPixel)).abs() +
          (_readGreen(testPixel) - _readGreen(masterPixel)).abs() +
          (_readBlue(testPixel) - _readBlue(masterPixel)).abs() +
          (_readAlpha(testPixel) - _readAlpha(masterPixel)).abs();

      if (diffPixel != 0) {
        final int invertedMasterPixel = invertedMasterRgba.getUint32(byteOffset);
        final int invertedTestPixel = invertedTestRgba.getUint32(byteOffset);
        // We grab the max of the 0xAABBGGRR encoded bytes, and then convert
        // back to 0xRRGGBBAA for the actual pixel value, since this is how it
        // was historically done.
        final int maskPixel = _toRGBA(max(
          _toABGR(invertedMasterPixel),
          _toABGR(invertedTestPixel),
        ));
        maskedDiffRgba.setUint32(byteOffset, maskPixel);
        isolatedDiffRgba.setUint32(byteOffset, maskPixel);
        pixelDiffCount++;
        pixelDiffHistogram.addSample(diffPixel); // NOTE MODIFIED ADD
      }
    }
  }

  if (pixelDiffCount > 0) {
    final double diffPercent = pixelDiffCount / totalPixels;
    return MyComparisonResult(
      passed: false,
      diffPercent: diffPercent,
      pixelDiffHistogram: pixelDiffHistogram,
      error: 'Pixel test failed, '
          '${(diffPercent * 100).toStringAsFixed(2)}% '
          'diff detected.',
      diffs: <String, Image>{
        'masterImage': masterImage,
        'testImage': testImage,
        'maskedDiff': await _createImage(maskedDiffRgba, width, height),
        'isolatedDiff': await _createImage(isolatedDiffRgba, width, height),
      },
    );
  }
  return MyComparisonResult(
    passed: true,
    diffPercent: 0.0,
    pixelDiffHistogram: null, // NOTE MODIFIED ADD
  );
}

/// Inverts [imageBytes], returning a new [ByteData] object.
ByteData _invert(ByteData imageBytes) {
  final ByteData bytes = ByteData(imageBytes.lengthInBytes);
  // Invert the RGB data (but not A).
  for (int i = 0; i < imageBytes.lengthInBytes; i += 4) {
    bytes.setUint8(i, 255 - imageBytes.getUint8(i));
    bytes.setUint8(i + 1, 255 - imageBytes.getUint8(i + 1));
    bytes.setUint8(i + 2, 255 - imageBytes.getUint8(i + 2));
    bytes.setUint8(i + 3, imageBytes.getUint8(i + 3));
  }
  return bytes;
}

/// Reads the red value out of a 32 bit rgba pixel.
int _readRed(int pixel) => (pixel >> 24) & 0xff;

/// Reads the green value out of a 32 bit rgba pixel.
int _readGreen(int pixel) => (pixel >> 16) & 0xff;

/// Reads the blue value out of a 32 bit rgba pixel.
int _readBlue(int pixel) => (pixel >> 8) & 0xff;

/// Reads the alpha value out of a 32 bit rgba pixel.
int _readAlpha(int pixel) => pixel & 0xff;

/// Convenience wrapper around [decodeImageFromPixels].
Future<Image> _createImage(ByteData bytes, int width, int height) {
  final Completer<Image> completer = Completer<Image>();
  decodeImageFromPixels(
    bytes.buffer.asUint8List(),
    width,
    height,
    PixelFormat.rgba8888,
    completer.complete,
  );
  return completer.future;
}

// Converts a 32 bit rgba pixel to a 32 bit abgr pixel
int _toABGR(int rgba) => (_readAlpha(rgba) << 24) | (_readBlue(rgba) << 16) | (_readGreen(rgba) << 8) | _readRed(rgba);

// Converts a 32 bit abgr pixel to a 32 bit rgba pixel
int _toRGBA(int abgr) =>
    // This is just a mirror of the other conversion.
    _toABGR(abgr);

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

class MyComparisonResult extends ComparisonResult {
  final SimpleHistogram? pixelDiffHistogram;

  MyComparisonResult({
    required super.passed,
    required super.diffPercent,
    super.error,
    super.diffs,
    required this.pixelDiffHistogram,
  });
}

class SimpleHistogram {
  final int totalSampleCount;
  final _countMap = <int, int>{};

  SimpleHistogram({required this.totalSampleCount});

  void addSample(int sample) => _countMap[sample] = (_countMap[sample] ?? 0) + 1;

  int get maxSample => _countMap.keys.fold(0, max);

  int sampleCountGreaterThan(int diffPerPixel) =>
      _countMap.entries.where((entry) => entry.key >= diffPerPixel).map((e) => e.value).fold(0, (a, b) => a + b);

  @override
  String toString() {
    final sortedSamples = _countMap.keys.toList()..sort();
    final entries = <String>[];
    var cumCount = 0;
    for (final sample in sortedSamples) {
      cumCount += _countMap[sample]!;
      entries.add('[<=$sample] $cumCount');
    }
    return 'SimpleHistogram(totalSampleCount: $totalSampleCount, cumulation: ${entries.join(", ")})';
  }
}

class _RectangleIntJsonConverter extends JsonConverter<Rectangle<int>, Map<String, Object?>> {
  const _RectangleIntJsonConverter();

  @override
  Rectangle<int> fromJson(Map<String, Object?> json) => Rectangle(
        json['left']! as int,
        json['top']! as int,
        json['width']! as int,
        json['height']! as int,
      );

  @override
  Map<String, Object?> toJson(Rectangle<int> object) => {
        'left': object.left,
        'top': object.top,
        'width': object.width,
        'height': object.height,
      };
}

@JsonSerializable()
@immutable
@_RectangleIntJsonConverter()
class GoldenConfig {
  final bool allowUpdate;
  final GoldenTolerationEntry? maxToleration;
  final List<GoldenTolerationEntry>? greaterThanToleration;
  final Rectangle<int>? cropBbox;

  const GoldenConfig({
    required this.allowUpdate,
    this.maxToleration,
    this.greaterThanToleration,
    this.cropBbox,
  });

  const GoldenConfig.allowUpdate({
    this.maxToleration,
    this.greaterThanToleration,
    this.cropBbox,
  }) : allowUpdate = true;

  const GoldenConfig.disallowUpdate({
    this.maxToleration,
    this.greaterThanToleration,
    this.cropBbox,
  }) : allowUpdate = false;

  factory GoldenConfig.fromUri(Uri golden) {
    final configJson = golden.queryParameters['config'];
    return configJson == null
        ? const GoldenConfig.allowUpdate()
        : GoldenConfig.fromJson(jsonDecode(configJson) as Map<String, Object?>);
  }

  factory GoldenConfig.fromJson(Map<String, dynamic> json) => _$GoldenConfigFromJson(json);

  Map<String, dynamic> toJson() => _$GoldenConfigToJson(this);
}

@JsonSerializable()
@immutable
class GoldenTolerationEntry {
  final int diffPerPixel;
  final double countPercent;

  const GoldenTolerationEntry({
    required this.diffPerPixel,
    required this.countPercent,
  });

  static GoldenConfig? fromUri(Uri golden) {
    final configJson = golden.queryParameters['config'];
    return configJson == null ? null : GoldenConfig.fromJson(jsonDecode(configJson) as Map<String, Object?>);
  }

  factory GoldenTolerationEntry.fromJson(Map<String, dynamic> json) => _$GoldenTolerationEntryFromJson(json);

  Map<String, dynamic> toJson() => _$GoldenTolerationEntryToJson(this);
}

extension ExtGoldenConfig on GoldenConfig {
  static const _kTag = 'GoldenConfig';

  bool check(MyComparisonResult result) {
    final pixelDiffHistogram = result.pixelDiffHistogram;

    if (result.passed) return true;

    // 下面考虑[result.passed]==false的情况

    if (pixelDiffHistogram == null) return false;

    final maxToleration = this.maxToleration;
    if (maxToleration == null ||
        pixelDiffHistogram.maxSample > maxToleration.diffPerPixel ||
        result.diffPercent > maxToleration.countPercent) {
      Log.d(
          _kTag,
          'check failed because `maxToleration` violates '
          '(pixelDiffHistogram.maxSample=${pixelDiffHistogram.maxSample} maxToleration.diffPerPixel=${maxToleration?.diffPerPixel} '
          'result.diffPercent=${result.diffPercent} > maxToleration.countPercent=${maxToleration?.countPercent})');
      return false;
    }

    for (final entry in greaterThanToleration ?? <GoldenTolerationEntry>[]) {
      final sampleCountForThresh = pixelDiffHistogram.sampleCountGreaterThan(entry.diffPerPixel);
      if (sampleCountForThresh > entry.countPercent * pixelDiffHistogram.totalSampleCount) {
        Log.d(
            _kTag,
            'check failed because entry=${entry.toJson()} violates '
            '(sampleCountForThresh=$sampleCountForThresh, pixelDiffHistogram.totalSampleCount=${pixelDiffHistogram.totalSampleCount}, '
            'expect=${entry.countPercent * pixelDiffHistogram.totalSampleCount})');
        return false;
      }
    }
    return true;
  }
}

extension on GoldenConfig? {
  Uri toUri(String path) {
    final that = this;
    return Uri.file(path).replace(queryParameters: that == null ? null : <String, Object?>{'config': jsonEncode(that)});
  }
}
