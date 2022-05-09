import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';

extension ExtWidgetController on WidgetController {
  Future<void> multiDrag(
    Finder finder, {
    required Offset firstDownOffset,
    required Offset secondDownOffset,
    required List<Offset> firstFingerOffsets,
    required List<Offset> secondFingerOffsets,
    Future<void> Function(int index)? afterMove,
  }) async {
    final startLocation = getCenter(finder);

    await TestAsyncUtils.guard<void>(() async {
      final gestureOne = await startGesture(startLocation + firstDownOffset);
      final gestureTwo = await startGesture(startLocation + secondDownOffset);
      await pump();

      assert(firstFingerOffsets.length == secondFingerOffsets.length);
      for (var i = 0; i < firstFingerOffsets.length; ++i) {
        await gestureOne.moveBy(firstFingerOffsets[i]);
        await gestureTwo.moveBy(secondFingerOffsets[i]);
        await pump();
        await afterMove?.call(i);
      }

      await gestureOne.up();
      await gestureTwo.up();
      await pump();
    });
  }
}
