import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

/// These are the parameters for the visualization of the recorded taps.
final _kTapRadius = 15.0, _kTapColor = Colors.grey[300]!, _kShadowColor = Colors.black, _kShadowElevation = 3.0;
const _kRemainAfterPointerUp = Duration(milliseconds: 100);

/// NOTE: refer to this answer for why use hitTest/handleEvent/etc https://stackoverflow.com/a/65067655
///
/// Widget that visualizes gestures.
///
/// It does not matter to this widget whether the child accepts the hit events.
/// Everything hitting the rect of the child will be recorded.
class GestureVisualizer extends SingleChildRenderObjectWidget {
  const GestureVisualizer({super.key, required Widget super.child});

  @override
  RenderObject createRenderObject(BuildContext context) {
    return _RenderGestureVisualizer();
  }
}

class _RenderGestureVisualizer extends RenderProxyBox {
  /// key: pointer id, value: the info
  final _recordedPointerInfoMap = <int, _RecordedPointerInfo>{};

  @override
  void detach() {
    _recordedPointerInfoMap.clear();
    super.detach();
  }

  @override
  bool hitTest(BoxHitTestResult result, {required Offset position}) {
    if (!size.contains(position)) return false;
    // We always want to add a hit test entry for ourselves as we want to react
    // to each and every hit event.
    result.add(BoxHitTestEntry(this, position));
    return hitTestChildren(result, position: position);
  }

  @override
  void handleEvent(PointerEvent event, covariant HitTestEntry entry) {
    // We do not want to interfere in the gesture arena, which is why we are not
    // using regular tap recognizers. Instead, we handle it ourselves and always
    // react to the hit events (ignoring the gesture arena).

    // by experiment, sometimes we see PointerHoverEvent with pointer=0 strangely...
    if (event.pointer == 0) {
      return;
    }

    if (event is PointerUpEvent || event is PointerCancelEvent) {
      Future.delayed(_kRemainAfterPointerUp, () {
        _recordedPointerInfoMap.remove(event.pointer);
        markNeedsPaint();
      });
    } else {
      _recordedPointerInfoMap[event.pointer] = _RecordedPointerInfo(event.localPosition);
      markNeedsPaint();
    }
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    context.paintChild(child!, offset);

    final canvas = context.canvas;
    for (final info in _recordedPointerInfoMap.values) {
      final path = Path()..addOval(Rect.fromCircle(center: info.localPosition, radius: _kTapRadius));

      canvas.drawShadow(path, _kShadowColor, _kShadowElevation, true);
      canvas.drawPath(path, Paint()..color = _kTapColor);
    }
  }
}

class _RecordedPointerInfo {
  _RecordedPointerInfo(this.localPosition);

  final Offset localPosition;
}
