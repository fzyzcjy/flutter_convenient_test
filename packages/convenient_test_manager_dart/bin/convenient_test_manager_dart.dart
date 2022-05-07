import 'package:convenient_test_common_dart/convenient_test_common_dart.dart';
import 'package:convenient_test_manager_dart/misc/setup.dart';

const _kTag = 'main';

Future<void> main(List<String> args) async {
  Log.i(_kTag, 'main start');
  setup();
  // TODO do we need a infinite loop? or is `setup`'s grpc serve enough?
}
