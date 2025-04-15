import 'package:convenient_test_common_dart/convenient_test_common_dart.dart';
import 'package:mobx/mobx.dart';

part 'raw_log_store.g.dart';

class RawLogStore = _RawLogStore with _$RawLogStore;

abstract class _RawLogStore with Store {
  final rawLogInTest =
      ObservableDefaultMap<int, String>(createDefaultValue: (_) => '');

  void clear() {
    rawLogInTest.clear();
  }
}
