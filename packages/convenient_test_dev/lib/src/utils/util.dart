import 'package:convenient_test_common/convenient_test_common.dart';
import 'package:flutter/material.dart' hide State;
import 'package:flutter_test/flutter_test.dart';
import 'package:test_api/src/backend/state.dart'; // ignore_for_file: implementation_imports

class DelegatingFinder implements Finder {
  final Finder target;
  final String? overrideDescription;

  DelegatingFinder(this.target, {this.overrideDescription});

  @override
  String get description => overrideDescription ?? target.description;

  @override
  Iterable<Element> apply(Iterable<Element> candidates) => target.apply(candidates);

  @override
  bool get skipOffstage => target.skipOffstage;

  @override
  Iterable<Element> get allCandidates => target.allCandidates;

  @override
  FinderResult<Element> evaluate() => target.evaluate();

  @override
  bool precache() => target.precache();

  @override
  Finder get first => target.first;

  @override
  Finder get last => target.last;

  @override
  Finder at(int index) => target.at(index);

  @override
  Finder hitTestable({Alignment at = Alignment.center}) => target.hitTestable(at: at);

  @override
  String toString({bool describeSelf = false}) => target.toString(describeSelf: describeSelf);

  @override
  String describeMatch(Plurality plurality) => target.describeMatch(plurality);

  @override
  Iterable<Element> findInCandidates(Iterable<Element> candidates) => target.findInCandidates(candidates);

  @override
  FinderResult<Element> get found => target.found;

  @override
  bool get hasFound => target.hasFound;

  @override
  Future<void> reset() async {
    target.reset();
  }

  @override
  void runCached(VoidCallback run) => target.runCached(run);

  @override
  bool tryEvaluate() => target.tryEvaluate();
}

extension ExtState on State {
  TestEntryState toProto() {
    return TestEntryState(
      status: status.name,
      result: result.name,
      // status: status.toProto(),
      // result: result.toProto(),
    );
  }
}

// extension ExtStatus on Status {
//   StateStatus toProto() {
//     switch (this) {
//       case Status.pending:
//         return StateStatus.PENDING;
//       case Status.running:
//         return StateStatus.RUNNING;
//       case Status.complete:
//         return StateStatus.COMPLETE;
//       default:
//         throw ArgumentError('Invalid result name "$name".');
//     }
//   }
// }
//
// extension ExtResult on Result {
//   StateResult toProto() {
//     switch (this) {
//       case Result.success:
//         return StateResult.SUCCESS;
//       case Result.skipped:
//         return StateResult.SKIPPED;
//       case Result.failure:
//         return StateResult.FAILURE;
//       case Result.error:
//         return StateResult.ERROR;
//       default:
//         throw ArgumentError('Invalid result name "$name".');
//     }
//   }
// }
