// copied from: devtools_app

// ignore_for_file: strict_raw_type, prefer_final_in_for_each, use_function_type_syntax_for_parameters

import 'dart:async';
import 'dart:collection';
import 'dart:math';

import 'package:convenient_test_common_dart/src/change_notifier.dart';
import 'package:meta/meta.dart';

class Disposer {
  final List<StreamSubscription> _subscriptions = [];

  // final List<FocusNode> _focusNodes = [];

  final List<Listenable> _listenables = [];
  final List<VoidCallback> _listeners = [];

  /// Track a stream subscription to be automatically cancelled on dispose.
  void autoDisposeStreamSubscription(StreamSubscription subscription) {
    _subscriptions.add(subscription);
  }

  // /// Track a focus node that will be automatically disposed on dispose.
  // void autoDisposeFocusNode(FocusNode? node) {
  //   if (node == null) return;
  //   _focusNodes.add(node);
  // }

  /// Add a listener to a Listenable object that is automatically removed when
  /// cancel is called.
  void addAutoDisposeListener(Listenable? listenable, [VoidCallback? listener]) {
    if (listenable == null || listener == null) return;
    _listenables.add(listenable);
    _listeners.add(listener);
    listenable.addListener(listener);
  }

  /// Cancel all stream subscriptions added.
  ///
  /// It is fine to call this method and then add additional subscriptions.
  void cancelStreamSubscriptions() {
    for (StreamSubscription subscription in _subscriptions) {
      subscription.cancel();
    }
    _subscriptions.clear();
  }

  /// Cancel all listeners added.
  ///
  /// It is fine to call this method and then add additional listeners.
  void cancelListeners() {
    assert(_listenables.length == _listeners.length);
    for (int i = 0; i < _listenables.length; ++i) {
      _listenables[i].removeListener(_listeners[i]);
    }
    _listenables.clear();
    _listeners.clear();
  }

  // /// Cancel all focus nodes added.
  // ///
  // /// It is fine to call this method and then add additional focus nodes.
  // void cancelFocusNodes() {
  //   for (FocusNode focusNode in _focusNodes) {
  //     focusNode.dispose();
  //   }
  //   _focusNodes.clear();
  // }
}

// copied from: devtools_app utils.dart
Future<T> whenValueNonNull<T>(ValueListenable<T> listenable) {
  if (listenable.value != null) return Future.value(listenable.value);
  final completer = Completer<T>();
  void listener() {
    final value = listenable.value;
    if (value != null) {
      completer.complete(value);
      listenable.removeListener(listener);
    }
  }

  listenable.addListener(listener);
  return completer.future;
}

/// A [ChangeNotifier] that holds a list of data.
///
/// This class also exposes methods to interact with the data. By default,
/// listeners are notified whenever the data is modified, but notifying can be
/// optionally disabled.
class ListValueNotifier<T> extends ChangeNotifier implements ValueListenable<List<T>> {
  /// Creates a [ListValueNotifier] that wraps this value [_rawList].
  ListValueNotifier(List<T> rawList) : _rawList = List<T>.from(rawList) {
    _currentList = ImmutableList(_rawList);
  }

  List<T> _rawList;

  late ImmutableList<T> _currentList;

  @override
  List<T> get value => _currentList;

  @override
  // This override is needed to change visibility of the method.
  // ignore: unnecessary_overrides
  void notifyListeners() {
    super.notifyListeners();
  }

  void _listChanged() {
    _currentList = ImmutableList(_rawList);
    notifyListeners();
  }

  set last(T value) {
    // TODO(jacobr): use a more sophisticated data structure such as
    // https://en.wikipedia.org/wiki/Rope_(data_structure) to make last more
    // efficient.
    _rawList = _rawList.toList();
    _rawList.last = value;
    _listChanged();
  }

  /// Adds an element to the list and notifies listeners.
  void add(T element) {
    _rawList.add(element);
    _listChanged();
  }

  /// Replaces all elements in the list and notifies listeners. It's preferred
  /// to calling .clear() then .addAll(), because it only notifies listeners
  /// once.
  void replaceAll(Iterable<T> elements) {
    _rawList = <T>[];
    _rawList.addAll(elements);
    _listChanged();
  }

  /// Adds elements to the list and notifies listeners.
  void addAll(Iterable<T> elements) {
    _rawList.addAll(elements);
    _listChanged();
  }

  /// Clears the list and notifies listeners.
  void clear() {
    _rawList = <T>[];
    _listChanged();
  }

  /// Truncates to just the elements between [start] and [end].
  ///
  /// If [end] is omitted, it defaults to the [length] of this list.
  ///
  /// The `start` and `end` positions must satisfy the relations
  /// 0 ≤ `start` ≤ `end` ≤ [length]
  /// If `end` is equal to `start`, then the returned list is empty.
  void trimToSublist(int start, [int? end]) {
    // TODO(jacobr): use a more sophisticated data structure such as
    // https://en.wikipedia.org/wiki/Rope_(data_structure) to make the
    // implementation of this method more efficient.
    _rawList = _rawList.sublist(start, end);
    _listChanged();
  }

  /// Removes the first occurrence of [value] from this list.
  ///
  /// Runtime is O(n).
  bool remove(T value) {
    final index = _rawList.indexOf(value);
    if (index == -1) return false;
    _rawList = _rawList.toList();
    _rawList.removeAt(index);
    _listChanged();
    return true;
  }
}

/// Wrapper for a list that prevents any modification of the list's content.
///
/// This class should only be used as part of [ListValueNotifier].
@visibleForTesting
class ImmutableList<T> with ListMixin<T> implements List<T> {
  ImmutableList(this._rawList) : length = _rawList.length;

  final List<T> _rawList;

  @override
  int length;

  @override
  T operator [](int index) {
    if (index >= 0 && index < length) {
      return _rawList[index];
    } else {
      throw Exception('Index out of range [0-${length - 1}]: $index');
    }
  }

  @override
  void operator []=(int index, T value) {
    throw Exception('Cannot modify the content of ImmutableList');
  }

  @override
  void add(T element) {
    throw Exception('Cannot modify the content of ImmutableList');
  }

  @override
  void addAll(Iterable<T> iterable) {
    throw Exception('Cannot modify the content of ImmutableList');
  }

  @override
  bool remove(Object? element) {
    throw Exception('Cannot modify the content of ImmutableList');
  }

  @override
  T removeAt(int index) {
    throw Exception('Cannot modify the content of ImmutableList');
  }

  @override
  T removeLast() {
    throw Exception('Cannot modify the content of ImmutableList');
  }

  @override
  void removeRange(int start, int end) {
    throw Exception('Cannot modify the content of ImmutableList');
  }

  @override
  void removeWhere(bool test(T element)) {
    throw Exception('Cannot modify the content of ImmutableList');
  }

  @override
  void retainWhere(bool test(T element)) {
    throw Exception('Cannot modify the content of ImmutableList');
  }

  @override
  void insert(int index, T element) {
    throw Exception('Cannot modify the content of ImmutableList');
  }

  @override
  void insertAll(int index, Iterable<T> iterable) {
    throw Exception('Cannot modify the content of ImmutableList');
  }

  @override
  void clear() {
    throw Exception('Cannot modify the content of ImmutableList');
  }

  @override
  void fillRange(int start, int end, [T? fill]) {
    throw Exception('Cannot modify the content of ImmutableList');
  }

  @override
  void setRange(int start, int end, Iterable<T> iterable, [int skipCount = 0]) {
    throw Exception('Cannot modify the content of ImmutableList');
  }

  @override
  void replaceRange(int start, int end, Iterable<T> newContents) {
    throw Exception('Cannot modify the content of ImmutableList');
  }

  @override
  void setAll(int index, Iterable<T> iterable) {
    throw Exception('Cannot modify the content of ImmutableList');
  }

  @override
  void sort([int Function(T a, T b)? compare]) {
    throw Exception('Cannot modify the content of ImmutableList');
  }

  @override
  void shuffle([Random? random]) {
    throw Exception('Cannot modify the content of ImmutableList');
  }
}
