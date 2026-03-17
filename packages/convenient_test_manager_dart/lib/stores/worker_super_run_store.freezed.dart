// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'worker_super_run_store.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ITIMState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ITIMState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return '_ITIMState()';
}


}

/// @nodoc
class _$ITIMStateCopyWith<$Res>  {
_$ITIMStateCopyWith(_ITIMState _, $Res Function(_ITIMState) __);
}


/// Adds pattern-matching-related methods to [_ITIMState].
extension _ITIMStatePatterns on _ITIMState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ITIMStateInitial value)?  initial,TResult Function( ITIMStateGoOn value)?  goOn,TResult Function( ITIMStateRetryLast value)?  retryLast,TResult Function( ITIMStateFinished value)?  finished,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ITIMStateInitial() when initial != null:
return initial(_that);case ITIMStateGoOn() when goOn != null:
return goOn(_that);case ITIMStateRetryLast() when retryLast != null:
return retryLast(_that);case ITIMStateFinished() when finished != null:
return finished(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ITIMStateInitial value)  initial,required TResult Function( ITIMStateGoOn value)  goOn,required TResult Function( ITIMStateRetryLast value)  retryLast,required TResult Function( ITIMStateFinished value)  finished,}){
final _that = this;
switch (_that) {
case ITIMStateInitial():
return initial(_that);case ITIMStateGoOn():
return goOn(_that);case ITIMStateRetryLast():
return retryLast(_that);case ITIMStateFinished():
return finished(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ITIMStateInitial value)?  initial,TResult? Function( ITIMStateGoOn value)?  goOn,TResult? Function( ITIMStateRetryLast value)?  retryLast,TResult? Function( ITIMStateFinished value)?  finished,}){
final _that = this;
switch (_that) {
case ITIMStateInitial() when initial != null:
return initial(_that);case ITIMStateGoOn() when goOn != null:
return goOn(_that);case ITIMStateRetryLast() when retryLast != null:
return retryLast(_that);case ITIMStateFinished() when finished != null:
return finished(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function( String lastExecutedTestName)?  goOn,TResult Function( String lastExecutedTestName,  int lastExecutedTestFailCount)?  retryLast,TResult Function()?  finished,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ITIMStateInitial() when initial != null:
return initial();case ITIMStateGoOn() when goOn != null:
return goOn(_that.lastExecutedTestName);case ITIMStateRetryLast() when retryLast != null:
return retryLast(_that.lastExecutedTestName,_that.lastExecutedTestFailCount);case ITIMStateFinished() when finished != null:
return finished();case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function( String lastExecutedTestName)  goOn,required TResult Function( String lastExecutedTestName,  int lastExecutedTestFailCount)  retryLast,required TResult Function()  finished,}) {final _that = this;
switch (_that) {
case ITIMStateInitial():
return initial();case ITIMStateGoOn():
return goOn(_that.lastExecutedTestName);case ITIMStateRetryLast():
return retryLast(_that.lastExecutedTestName,_that.lastExecutedTestFailCount);case ITIMStateFinished():
return finished();case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function( String lastExecutedTestName)?  goOn,TResult? Function( String lastExecutedTestName,  int lastExecutedTestFailCount)?  retryLast,TResult? Function()?  finished,}) {final _that = this;
switch (_that) {
case ITIMStateInitial() when initial != null:
return initial();case ITIMStateGoOn() when goOn != null:
return goOn(_that.lastExecutedTestName);case ITIMStateRetryLast() when retryLast != null:
return retryLast(_that.lastExecutedTestName,_that.lastExecutedTestFailCount);case ITIMStateFinished() when finished != null:
return finished();case _:
  return null;

}
}

}

/// @nodoc


class ITIMStateInitial implements _ITIMState {
  const ITIMStateInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ITIMStateInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return '_ITIMState.initial()';
}


}




/// @nodoc


class ITIMStateGoOn implements _ITIMState {
  const ITIMStateGoOn({required this.lastExecutedTestName});
  

 final  String lastExecutedTestName;

/// Create a copy of _ITIMState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ITIMStateGoOnCopyWith<ITIMStateGoOn> get copyWith => _$ITIMStateGoOnCopyWithImpl<ITIMStateGoOn>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ITIMStateGoOn&&(identical(other.lastExecutedTestName, lastExecutedTestName) || other.lastExecutedTestName == lastExecutedTestName));
}


@override
int get hashCode => Object.hash(runtimeType,lastExecutedTestName);

@override
String toString() {
  return '_ITIMState.goOn(lastExecutedTestName: $lastExecutedTestName)';
}


}

/// @nodoc
abstract mixin class $ITIMStateGoOnCopyWith<$Res> implements _$ITIMStateCopyWith<$Res> {
  factory $ITIMStateGoOnCopyWith(ITIMStateGoOn value, $Res Function(ITIMStateGoOn) _then) = _$ITIMStateGoOnCopyWithImpl;
@useResult
$Res call({
 String lastExecutedTestName
});




}
/// @nodoc
class _$ITIMStateGoOnCopyWithImpl<$Res>
    implements $ITIMStateGoOnCopyWith<$Res> {
  _$ITIMStateGoOnCopyWithImpl(this._self, this._then);

  final ITIMStateGoOn _self;
  final $Res Function(ITIMStateGoOn) _then;

/// Create a copy of _ITIMState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? lastExecutedTestName = null,}) {
  return _then(ITIMStateGoOn(
lastExecutedTestName: null == lastExecutedTestName ? _self.lastExecutedTestName : lastExecutedTestName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ITIMStateRetryLast implements _ITIMState {
  const ITIMStateRetryLast({required this.lastExecutedTestName, required this.lastExecutedTestFailCount});
  

 final  String lastExecutedTestName;
 final  int lastExecutedTestFailCount;

/// Create a copy of _ITIMState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ITIMStateRetryLastCopyWith<ITIMStateRetryLast> get copyWith => _$ITIMStateRetryLastCopyWithImpl<ITIMStateRetryLast>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ITIMStateRetryLast&&(identical(other.lastExecutedTestName, lastExecutedTestName) || other.lastExecutedTestName == lastExecutedTestName)&&(identical(other.lastExecutedTestFailCount, lastExecutedTestFailCount) || other.lastExecutedTestFailCount == lastExecutedTestFailCount));
}


@override
int get hashCode => Object.hash(runtimeType,lastExecutedTestName,lastExecutedTestFailCount);

@override
String toString() {
  return '_ITIMState.retryLast(lastExecutedTestName: $lastExecutedTestName, lastExecutedTestFailCount: $lastExecutedTestFailCount)';
}


}

/// @nodoc
abstract mixin class $ITIMStateRetryLastCopyWith<$Res> implements _$ITIMStateCopyWith<$Res> {
  factory $ITIMStateRetryLastCopyWith(ITIMStateRetryLast value, $Res Function(ITIMStateRetryLast) _then) = _$ITIMStateRetryLastCopyWithImpl;
@useResult
$Res call({
 String lastExecutedTestName, int lastExecutedTestFailCount
});




}
/// @nodoc
class _$ITIMStateRetryLastCopyWithImpl<$Res>
    implements $ITIMStateRetryLastCopyWith<$Res> {
  _$ITIMStateRetryLastCopyWithImpl(this._self, this._then);

  final ITIMStateRetryLast _self;
  final $Res Function(ITIMStateRetryLast) _then;

/// Create a copy of _ITIMState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? lastExecutedTestName = null,Object? lastExecutedTestFailCount = null,}) {
  return _then(ITIMStateRetryLast(
lastExecutedTestName: null == lastExecutedTestName ? _self.lastExecutedTestName : lastExecutedTestName // ignore: cast_nullable_to_non_nullable
as String,lastExecutedTestFailCount: null == lastExecutedTestFailCount ? _self.lastExecutedTestFailCount : lastExecutedTestFailCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class ITIMStateFinished implements _ITIMState {
  const ITIMStateFinished();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ITIMStateFinished);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return '_ITIMState.finished()';
}


}




// dart format on
