import 'package:convenient_test_manager/components/misc/rotate_animation.dart';
import 'package:convenient_test_manager/utils/utils.dart';
import 'package:flutter/material.dart';

class StateIndicatorWidget extends StatelessWidget {
  final SimplifiedStateEnum state;
  final bool enableAnimation;

  const StateIndicatorWidget({Key? key, required this.state, this.enableAnimation = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 16,
      height: 16,
      child: _buildCore(),
    );
  }

  Widget _buildCore() {
    switch (state) {
      case SimplifiedStateEnum.pending:
        return const Icon(Icons.hourglass_empty, color: Colors.black87, size: 14);
      // return Center(
      //   child: SizedBox(
      //     width: 12,
      //     height: 12,
      //     child: Container(
      //       decoration: BoxDecoration(
      //         border: Border.all(color: Colors.grey),
      //         borderRadius: BorderRadius.circular(4),
      //       ),
      //       child: Center(
      //         child: Container(
      //           height: 1,
      //           width: 8,
      //           color: Colors.grey,
      //         ),
      //       ),
      //     ),
      //   ),
      // );
      case SimplifiedStateEnum.running:
        Widget result = const Icon(
          Icons.autorenew,
          size: 16,
          color: Colors.indigo,
        );
        if (enableAnimation) {
          result = RotateAnimation(
            duration: const Duration(seconds: 2),
            child: result,
          );
        }
        return result;
      case SimplifiedStateEnum.completeSuccess:
        return const Icon(Icons.check_circle_rounded, color: Colors.green, size: 16);
      case SimplifiedStateEnum.completeSkipped:
        return const Icon(Icons.remove, color: Colors.orange, size: 16);
      case SimplifiedStateEnum.completeFailureOrError:
        return const Icon(Icons.error, color: Colors.red, size: 16);
    }
  }
}
