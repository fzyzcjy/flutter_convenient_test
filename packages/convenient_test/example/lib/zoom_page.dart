import 'dart:math';

import 'package:convenient_test/convenient_test.dart';
import 'package:flutter/material.dart';

class ZoomPage extends StatefulWidget {
  const ZoomPage({Key? key}) : super(key: key);

  @override
  State<ZoomPage> createState() => _ZoomPageState();
}

class _ZoomPageState extends State<ZoomPage> {
  static const _colorArr = Colors.primaries;
  static const _shadeArr = [50, 100, 200, 300, 400, 500, 600, 700, 800, 900];

  var _chosenPoint = const Point(0, 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ZoomPage')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('ChosenPoint: ${_chosenPoint.x}#${_chosenPoint.y}'),
            Mark(
              name: ZoomPageMark.palette,
              child: SizedBox(
                width: 275,
                height: 375,
                child: InteractiveViewer(
                  constrained: false,
                  child: Column(
                    children: [
                      for (var y = 0; y < _colorArr.length; ++y)
                        Row(
                          children: [
                            for (var x = 0; x < _shadeArr.length; ++x)
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    _chosenPoint = Point(x, y);
                                  });
                                },
                                child: Container(
                                  width: 50,
                                  height: 50,
                                  color: _getColor(Point(x, y), invert: _chosenPoint == Point(x, y)),
                                  child: Center(
                                    child: Text('$x#$y'),
                                  ),
                                ),
                              )
                          ],
                        )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color _getColor(Point<int> point, {required bool invert}) {
    var raw = _colorArr[point.y][_shadeArr[point.x]]!;
    return invert ? raw.invert() : raw;
  }
}

extension on Color {
  Color invert() => Color.fromARGB(alpha, 255 - red, 255 - green, 255 - blue);
}

enum ZoomPageMark {
  palette,
}
