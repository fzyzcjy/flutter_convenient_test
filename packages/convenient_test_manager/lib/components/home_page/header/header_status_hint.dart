import 'package:convenient_test_manager_dart/stores/worker_super_run_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

extension _Paints on WorkerSuperRunStatus {
  Color? get color {
    switch (this) {
      case WorkerSuperRunStatus.na:
        return null;
      case WorkerSuperRunStatus.runningTest:
        return Colors.blue;
      case WorkerSuperRunStatus.testAllDone:
        return Colors.green;
    }
  }

  String? get title {
    switch (this) {
      case WorkerSuperRunStatus.na:
        return null;
      case WorkerSuperRunStatus.runningTest:
        return 'Running';
      case WorkerSuperRunStatus.testAllDone:
        return 'Idle';
    }
  }
}

class HeaderStatusHint extends StatelessWidget {
  final WorkerSuperRunStatus status;

  const HeaderStatusHint({required this.status, super.key});

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        if (status == WorkerSuperRunStatus.na) return const SizedBox.shrink();

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: Container(
            decoration: BoxDecoration(
              color: status.color,
              borderRadius: BorderRadius.circular(4),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: DefaultTextStyle(
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.normal,
              ),
              child: Text(status.title!),
            ),
          ),
        );
      },
    );
  }
}
