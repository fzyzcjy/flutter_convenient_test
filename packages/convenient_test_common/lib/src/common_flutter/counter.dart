import 'package:mobx/mobx.dart';

part 'counter.g.dart';

abstract class _BaseCounter {
  int get value => _value;

  int get _value;

  set _value(int newVal);

  bool get positive => _value > 0;

  void withPlusOneSync(void Function() f) {
    _value++;
    try {
      f();
    } finally {
      _value--;
    }
  }

  Future<void> withPlusOneAsync(Future<void> Function() f) async {
    _value++;
    try {
      await f();
    } finally {
      _value--;
    }
  }
}

class ObservableCounter = _ObservableCounter with _$ObservableCounter;

abstract class _ObservableCounter extends _BaseCounter with Store {
  @override
  @observable
  // ignore: prefer_final_fields
  int _value = 0;

  // 故意override，是为了标注[@action]以生成相关代码
  @override
  @action
  void withPlusOneSync(void Function() f) => super.withPlusOneSync(f);

  @override
  @action
  Future<void> withPlusOneAsync(Future<void> Function() f) => super.withPlusOneAsync(f);
}
