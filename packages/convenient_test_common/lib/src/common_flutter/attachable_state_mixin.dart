import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

mixin AttachableStateMixin<T> {
  T get state {
    assert(isStateSingle, 'Want to get this.state but wrong number of _states. $attachableStateMixinInfo');
    return _states.single;
  }

  int get numStates => _states.length;

  bool get isStateSingle => numStates == 1;

  String get attachableStateMixinInfo => 'AttachableStateMixin(runtimeType=$runtimeType, hash=$hashCode, '
      '_states=$_states (their hashCodes: ${_states.map((s) => s.hashCode).toList()}))';

  List<T> get states => _states;
  final _states = ObservableList<T>();

  void attach(T state) {
    // print('hi attach self=$hashCode _states=${_states.map((s) => s.hashCode).toList()} state=${state.hashCode}');
    assert(!_states.contains(state),
        'want to attach() but it already exists _states=${_states.map((s) => s.hashCode).toList()} state=${state.hashCode}');
    _states.add(state);
  }

  void detach(T state) {
    // print('hi detach self=$hashCode _states=${_states.map((s) => s.hashCode).toList()} state=${state.hashCode}');
    final removed = _states.remove(state);
    assert(removed,
        'want to detach() but it did not even exist _states=${_states.map((s) => s.hashCode).toList()} state=${state.hashCode}');
  }
}

class AttachableStateAttacherWidget<T extends AttachableStateMixin<S>, S> extends StatefulWidget {
  final T target;
  final S state;
  final Widget child;

  const AttachableStateAttacherWidget({
    super.key,
    required this.target,
    required this.state,
    required this.child,
  });

  @override
  _AttachableStateAttacherWidgetState<T, S> createState() => _AttachableStateAttacherWidgetState<T, S>();
}

class _AttachableStateAttacherWidgetState<T extends AttachableStateMixin<S>, S>
    extends State<AttachableStateAttacherWidget<T, S>> {
  @override
  void initState() {
    super.initState();
    widget.target.attach(widget.state);
  }

  @override
  void didUpdateWidget(covariant AttachableStateAttacherWidget<T, S> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (!identical(oldWidget.target, widget.target) || !identical(oldWidget.state, widget.state)) {
      oldWidget.target.detach(oldWidget.state);
      widget.target.attach(widget.state);
    }
  }

  @override
  void dispose() {
    widget.target.detach(widget.state);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.child;
}
