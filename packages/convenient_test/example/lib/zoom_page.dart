import 'dart:math';

import 'package:flutter/material.dart';

class ZoomPage extends StatelessWidget {
  const ZoomPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ZoomPage')),
      body: Center(
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
                        Container(
                          width: 50,
                          height: 50,
                          color: _getColor(Point(x, y)),
                          child: Center(
                            child: Text('$x#$y'),
                          ),
                        )
                    ],
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }

  static const _colorArr = Colors.primaries;
  static const _shadeArr = [50, 100, 200, 300, 400, 500, 600, 700, 800, 900];

  Color _getColor(Point<int> point) => _colorArr[point.y][_shadeArr[point.x]]!;
}
