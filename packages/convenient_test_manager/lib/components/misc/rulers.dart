import 'package:flutter/material.dart';

class RulerDecoration extends StatelessWidget {
  final Size? rulerSize;
  final Widget child;

  const RulerDecoration({
    super.key,
    required this.rulerSize,
    required this.child,
  });

  static const _kRulerThickness = 20.0;

  @override
  Widget build(BuildContext context) {
    final rulerSize = this.rulerSize;

    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: _kRulerThickness,
            top: _kRulerThickness,
          ),
          child: child,
        ),
        if (rulerSize != null) ...[
          Positioned(
            left: 0,
            top: _kRulerThickness,
            bottom: 0,
            width: _kRulerThickness,
            child: RotatedBox(
              quarterTurns: 1,
              child: _buildRuler(rulerLength: rulerSize.height),
            ),
          ),
          Positioned(
            top: 0,
            left: _kRulerThickness,
            right: 0,
            height: _kRulerThickness,
            child: _buildRuler(rulerLength: rulerSize.width),
          ),
        ],
      ],
    );
  }

  Widget _buildRuler({required double rulerLength}) {
    return LayoutBuilder(
      builder: (_, constraints) {
        final rulerToWidgetSizeMultiplier = constraints.maxWidth / rulerLength;

        return Stack(
          children: [
            for (
              var rulerValue = 0;
              rulerValue < rulerLength;
              rulerValue += 100
            )
              ..._buildTick(
                rulerValue: rulerValue,
                rulerToWidgetSizeMultiplier: rulerToWidgetSizeMultiplier,
              ),
            ..._buildTick(
              rulerValue: rulerLength.round(),
              rulerToWidgetSizeMultiplier: rulerToWidgetSizeMultiplier,
            ),
          ],
        );
      },
    );
  }

  List<Widget> _buildTick({
    required int rulerValue,
    required double rulerToWidgetSizeMultiplier,
  }) {
    final left = rulerToWidgetSizeMultiplier * rulerValue;
    return [
      Positioned(top: 0, bottom: 0, left: left + 2, child: Text('$rulerValue')),
      Positioned(
        top: 0,
        bottom: 0,
        left: left,
        child: Container(width: 1, color: Colors.grey),
      ),
    ];
  }
}
