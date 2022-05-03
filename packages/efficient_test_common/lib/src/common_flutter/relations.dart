import 'package:mobx/mobx.dart';

class RelationOneToMany extends ObservableMap<int, ObservableList<int>> {
  void addRelation(int key, int val) => (this[key] ??= ObservableList()).add(val);

  void addRelations(int key, List<int> val) => (this[key] ??= ObservableList()).addAll(val);

  bool hasValOfKey(int key) => this[key]?.isNotEmpty ?? false;
}

class ObservableDefaultMap<K, V> extends ObservableMap<K, V> {
  final V Function(K key) createDefaultValue;

  ObservableDefaultMap({required this.createDefaultValue});

  ObservableDefaultMap.defaultValue(V defaultValue) : createDefaultValue = ((_) => defaultValue);

  @override
  V operator [](Object? key) {
    return super[key as K] ??= createDefaultValue(key);
  }
}
