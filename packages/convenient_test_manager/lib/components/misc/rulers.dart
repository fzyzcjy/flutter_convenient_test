import 'package:flutter/material.dart';

class RulerDecoration extends StatelessWidget {
  final Size? rulerSize;
  final Widget child;

  const RulerDecoration({super.key, required this.rulerSize, required this.child});

  static const _kRulerThickness = 24.0;

  @override
  Widget build(BuildContext context) {
    final rulerSize = this.rulerSize;

    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: _kRulerThickness, top: _kRulerThickness),
          child: child,
        ),
        if (rulerSize != null) ...[
          Positioned(
            left: 0,
            top: 0,
            bottom: 0,
            width: _kRulerThickness,
            child: RotatedBox(
              quarterTurns: 1,
              child: _buildRuler(rulerLength: rulerSize.height),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: _kRulerThickness,
            child: _buildRuler(rulerLength: rulerSize.width),
          ),
        ],
      ],
    );
  }

  Widget _buildRuler({required double rulerLength}) {
    return Row(
      children: [
        for (var rulerValue = 0; rulerValue < rulerLength; rulerValue += 100) _buildTick(rulerValue: rulerValue),
        _buildTick(rulerValue: rulerLength.round()),
      ],
    );
  }

  Widget _buildTick({required int rulerValue}) {
    return Text('$rulerValue');
  }
}
