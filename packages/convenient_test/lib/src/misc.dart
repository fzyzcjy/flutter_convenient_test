import 'package:collection/collection.dart';
import 'package:convenient_test/src/gesture_visualizer.dart';
import 'package:flutter/material.dart';

class ConvenientTestWrapperWidget extends StatelessWidget {
  final Widget child;

  static var convenientTestActive = false;

  const ConvenientTestWrapperWidget({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (!convenientTestActive) return child;

    return ConvenientTestImageCaptureWrapper(
      child: GestureVisualizer(child: child),
    );
  }
}

/// ref: Flutter's "golden test" implementations
class ConvenientTestImageCaptureWrapper extends StatelessWidget {
  final Widget child;

  const ConvenientTestImageCaptureWrapper({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // take snapshot needs a [RepaintBoundary]
    return RepaintBoundary(
      child: child,
    );
  }
}

// Similar to Cypress' commonly used approach - add a `<mytag data-test="hello"/>` in HTML, and
// use `cy.get('[data-test=hello]')` when testing to find that widget.
// Why make this a separate Widget? Because HTML's padding/margin/... becomes a separate Widget in Flutter's world.
// Therefore, the data-test property in HTML is also a Widget now.
// P.S. For the Cypress's approach, please see Cypress's intro doc, or see `cypress-realworld-app`'s `cy.getBySel`.
class Mark extends StatelessWidget {
  final Object name;
  final bool repaintBoundary;
  final Object? data;
  final Widget child;

  const Mark({
    Key? key,
    required this.name,
    this.repaintBoundary = false,
    this.data,
    required this.child,
  }) : super(key: key);

  T childTyped<T>() => child as T;

  @override
  Widget build(BuildContext context) {
    if (!ConvenientTestWrapperWidget.convenientTestActive) return child;

    final color = kColorList['$name'.hashCode % kColorList.length];

    return Stack(
      fit: StackFit.passthrough,
      children: [
        repaintBoundary //
            ? RepaintBoundary(child: child)
            : child,
        Positioned(
          left: 0,
          top: 0,
          right: 0,
          bottom: 0,
          child: IgnorePointer(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: color, width: 1.0),
              ),
            ),
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          top: 0,
          child: IgnorePointer(
            child: Text(
              _nameBrief,
              style: TextStyle(
                fontSize: 9,
                color: color,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ],
    );
  }

  String get _nameBrief {
    final nameFull = '$name'.replaceAll('Mark.', '.');
    final nameChunks = nameFull.split('.');
    return nameChunks.map(_onlyUpperOrFirstLetter).join('.');
  }

  String _onlyUpperOrFirstLetter(String s) {
    return s.split('').whereIndexed((i, ch) => i == 0 || ch.toUpperCase() == ch).join('');
  }
}

const kColorList = [
  Colors.red,
  Colors.pink,
  Colors.purple,
  Colors.deepPurple,
  // Colors.indigo,
  // Colors.blue,
  // Colors.lightBlue,
  Colors.cyan,
  Colors.teal,
  Colors.green,
  Colors.lightGreen,
  Colors.lime,
  Colors.yellow,
  Colors.amber,
  Colors.orange,
  Colors.deepOrange,
  // Colors.brown,
  // Colors.grey,
  // Colors.blueGrey,
  // Colors.black,
];
