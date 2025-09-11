import 'dart:math';

import 'package:convenient_test_dev/convenient_test_dev.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  goldenFileComparator = EnhancedLocalFileComparator.configFromCurrent(
    captureFailure: false,
  );

  group('EnhancedLocalFileComparator', () {
    testWidgets('cropBbox', (tester) async {
      final goldenKey = UniqueKey();

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: RepaintBoundary(
                key: goldenKey,
                child: Column(
                  children: [
                    Container(color: Colors.red, width: 200, height: 50),
                    Container(color: Colors.green, width: 200, height: 50),
                    Container(color: Colors.green[300], width: 200, height: 50),
                    Container(color: Colors.red[300], width: 200, height: 50),
                  ],
                ),
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byKey(goldenKey),
        matchesGoldenFile(
          EnhancedLocalFileComparator.createUri(
            'crop_bbox_golden.png',
            const GoldenConfig.allowUpdate(
              cropBbox: Rectangle(0, 50, 200, 100),
            ),
          ),
        ),
      );
    });
  });
}
