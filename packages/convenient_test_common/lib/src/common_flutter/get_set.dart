class GetSet<T> {
  T Function() getter;
  void Function(T value) setter;

  GetSet({required this.getter, required this.setter});

  GetSet.gs(this.getter, this.setter);
}
