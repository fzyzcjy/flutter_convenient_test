import 'dart:ui' as ui;

import 'package:collection/collection.dart';
import 'package:convenient_test/convenient_test.dart';
import 'package:convenient_test_common/convenient_test_common.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_test/flutter_test.dart';

Future<List<int>> takeSnapshot({Future<void> Function()? pumper}) async {
  final element = _findElement();
  final image = await _captureImageFromElement(element, pumper: pumper);
  final byteData = await image.toByteData(format: ui.ImageByteFormat.png);
  return byteData!.buffer.asUint8List();
}

/// NOTE ref [flutter_test :: _matchers_io.dart :: MatchesGoldenFile :: matchAsync]
Element _findElement() {
  final finder = find.byType(ConvenientTestImageCaptureWrapper);
  final element = finder.evaluate().singleOrNull;
  if (element == null) {
    throw Exception(
      'Please put `ConvenientTestWrapperWidget` in the widget tree near root, '
      'or ensure ConvenientTestWrapperWidget.convenientTestActive=true',
    );
  }
  return element;
}

/// NOTE ref [flutter_test :: _matchers_io.dart :: captureImage]
Future<ui.Image> _captureImageFromElement(
  Element element, {
  Future<void> Function()? pumper,
}) async {
  assert(element.renderObject != null);
  var renderObject = element.renderObject!;
  while (!renderObject.isRepaintBoundary) {
    renderObject = renderObject.parent!;
  }

  // NOTE MODIFIED add to fix
  // see #234
  // see https://github.com/fzyzcjy/yplusplus/issues/4286#issuecomment-1170797044
  {
    var count = 0;
    while (renderObject.debugNeedsPaint && pumper != null) {
      if (count >= 20) {
        Log.i(
          'captureImageFromElement',
          'see debugNeedsPaint==true, but already pumped too many times, thus skip',
        );
        break;
      }

      Log.i(
        'captureImageFromElement',
        'see debugNeedsPaint==true and has pumper, thus pump',
      );
      await pumper();
      // https://github.com/fzyzcjy/yplusplus/issues/8485#issuecomment-1528908471
      await Future<void>.delayed(const Duration(milliseconds: 100));
      count++;
    }
  }

  if (renderObject.debugNeedsPaint) {
    Log.w(
      'captureImageFromElement',
      'debugNeedsPaint==true when taking snapshot',
    );
  }
  // assert(!renderObject.debugNeedsPaint);

  final layer = renderObject.debugLayer! as OffsetLayer;
  return layer.toImage(renderObject.paintBounds);
}
