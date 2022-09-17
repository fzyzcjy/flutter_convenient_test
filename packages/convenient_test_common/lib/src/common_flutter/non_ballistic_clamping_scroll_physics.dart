import 'dart:math';

import 'package:convenient_test_common_dart/convenient_test_common_dart.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// ignore: unnecessary_import
import 'package:flutter/physics.dart';

// ignore_for_file: omit_local_variable_types, curly_braces_in_flow_control_structures

/// adapted from [ClampingScrollPhysics], hacky!
class NonBallisticClampingScrollPhysics extends ScrollPhysics {
  static const _kTag = 'NonBallisticClampingScrollPhysics';

  const NonBallisticClampingScrollPhysics({super.parent});

  @override
  NonBallisticClampingScrollPhysics applyTo(ScrollPhysics? ancestor) {
    return NonBallisticClampingScrollPhysics(parent: buildParent(ancestor));
  }

  @override
  double applyBoundaryConditions(ScrollMetrics position, double value) {
    assert(() {
      if (value == position.pixels) {
        throw FlutterError.fromParts(<DiagnosticsNode>[
          ErrorSummary('$runtimeType.applyBoundaryConditions() was called redundantly.'),
          ErrorDescription('The proposed new position, $value, is exactly equal to the current position of the '
              'given ${position.runtimeType}, ${position.pixels}.\n'
              'The applyBoundaryConditions method should only be called when the value is '
              'going to actually change the pixels, otherwise it is redundant.'),
          DiagnosticsProperty<ScrollPhysics>('The physics object in question was', this,
              style: DiagnosticsTreeStyle.errorProperty),
          DiagnosticsProperty<ScrollMetrics>('The position object in question was', position,
              style: DiagnosticsTreeStyle.errorProperty)
        ]);
      }
      return true;
    }());
    if (value < position.pixels && position.pixels <= position.minScrollExtent) // underscroll
      return value - position.pixels;
    if (position.maxScrollExtent <= position.pixels && position.pixels < value) // overscroll
      return value - position.pixels;
    if (value < position.minScrollExtent && position.minScrollExtent < position.pixels) // hit top edge
      return value - position.minScrollExtent;
    if (position.pixels < position.maxScrollExtent && position.maxScrollExtent < value) // hit bottom edge
      return value - position.maxScrollExtent;
    return 0.0;
  }

  @override
  Simulation? createBallisticSimulation(ScrollMetrics position, double velocity) {
    // Log.i(_kTag, 'createBallisticSimulation position=$position outOfRange=${position.outOfRange} velocity=$velocity');
    final Tolerance tolerance = this.tolerance;
    if (position.outOfRange) {
      double? end;
      if (position.pixels > position.maxScrollExtent) end = position.maxScrollExtent;
      if (position.pixels < position.minScrollExtent) end = position.minScrollExtent;
      assert(end != null);

      // NOTE XXX modified
      Log.i(_kTag, 'hack outOfRange end=$end position=$position velocity=$velocity');

      // V2
      return ScrollSpringSimulation(
        // NOTE from ScrollPhysics._kDefaultSpring
        SpringDescription.withDampingRatio(
          mass: 0.5 * 0.01, // NOTE
          stiffness: 100.0 * 1000000, // NOTE
          ratio: 1.0, // NOTE
        ),
        position.pixels,
        end!,
        min(0.0, velocity),
        tolerance: tolerance,
      );

      // return ScrollSpringSimulation(
      //   spring,
      //   position.pixels,
      //   end,
      //   min(0.0, velocity),
      //   tolerance: tolerance,
      // );
    }
    if (velocity.abs() < tolerance.velocity) return null;
    if (velocity > 0.0 && position.pixels >= position.maxScrollExtent) return null;
    if (velocity < 0.0 && position.pixels <= position.minScrollExtent) return null;
    return ClampingScrollSimulation(
      position: position.pixels,
      velocity: velocity,
      tolerance: tolerance,
    );
  }
}
