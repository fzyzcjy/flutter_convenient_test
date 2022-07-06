// copied from: change_notifier.dart

typedef VoidCallback = void Function();

abstract class Listenable {
  const Listenable();

  // factory Listenable.merge(List<Listenable?> listenables) = _MergingListenable;

  void addListener(VoidCallback listener);

  void removeListener(VoidCallback listener);
}

abstract class ValueListenable<T> extends Listenable {
  const ValueListenable();

  T get value;
}
