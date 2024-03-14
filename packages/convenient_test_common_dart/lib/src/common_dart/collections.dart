mixin _ExhaustiveMapMixin<K, V> {
  Map<K, V> get _map;

  V operator [](K key) => _map[key]!;

  // ...forward...

  void operator []=(K key, V value) => _map[key] = value;

  Iterable<MapEntry<K, V>> get entries => _map.entries;

  Iterable<V> get values => _map.values;

  void addEntries(Iterable<MapEntry<K, V>> newEntries) =>
      _map.addEntries(newEntries);
}

class ExhaustiveMap<K, V> with _ExhaustiveMapMixin<K, V> {
  @override
  final Map<K, V> _map;

  ExhaustiveMap(Iterable<K> keys, V Function(K) initialValue)
      : this._(Map.fromEntries(keys.map((k) => MapEntry(k, initialValue(k)))));

  ExhaustiveMap.of(Iterable<K> keys, Map<K, V> src)
      :
        // 这么操作，主要是验证[src]真的包含所有的[keys]
        this._(Map.fromEntries(keys.map((k) => MapEntry(k, src[k] as V))));

  ExhaustiveMap._(this._map);
}
