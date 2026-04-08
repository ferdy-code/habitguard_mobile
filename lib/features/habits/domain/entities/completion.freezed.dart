// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'completion.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Completion {

 String get id; String get habitId; DateTime get completedAt; String? get note; int get count;
/// Create a copy of Completion
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CompletionCopyWith<Completion> get copyWith => _$CompletionCopyWithImpl<Completion>(this as Completion, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Completion&&(identical(other.id, id) || other.id == id)&&(identical(other.habitId, habitId) || other.habitId == habitId)&&(identical(other.completedAt, completedAt) || other.completedAt == completedAt)&&(identical(other.note, note) || other.note == note)&&(identical(other.count, count) || other.count == count));
}


@override
int get hashCode => Object.hash(runtimeType,id,habitId,completedAt,note,count);

@override
String toString() {
  return 'Completion(id: $id, habitId: $habitId, completedAt: $completedAt, note: $note, count: $count)';
}


}

/// @nodoc
abstract mixin class $CompletionCopyWith<$Res>  {
  factory $CompletionCopyWith(Completion value, $Res Function(Completion) _then) = _$CompletionCopyWithImpl;
@useResult
$Res call({
 String id, String habitId, DateTime completedAt, String? note, int count
});




}
/// @nodoc
class _$CompletionCopyWithImpl<$Res>
    implements $CompletionCopyWith<$Res> {
  _$CompletionCopyWithImpl(this._self, this._then);

  final Completion _self;
  final $Res Function(Completion) _then;

/// Create a copy of Completion
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? habitId = null,Object? completedAt = null,Object? note = freezed,Object? count = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,habitId: null == habitId ? _self.habitId : habitId // ignore: cast_nullable_to_non_nullable
as String,completedAt: null == completedAt ? _self.completedAt : completedAt // ignore: cast_nullable_to_non_nullable
as DateTime,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [Completion].
extension CompletionPatterns on Completion {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Completion value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Completion() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Completion value)  $default,){
final _that = this;
switch (_that) {
case _Completion():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Completion value)?  $default,){
final _that = this;
switch (_that) {
case _Completion() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String habitId,  DateTime completedAt,  String? note,  int count)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Completion() when $default != null:
return $default(_that.id,_that.habitId,_that.completedAt,_that.note,_that.count);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String habitId,  DateTime completedAt,  String? note,  int count)  $default,) {final _that = this;
switch (_that) {
case _Completion():
return $default(_that.id,_that.habitId,_that.completedAt,_that.note,_that.count);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String habitId,  DateTime completedAt,  String? note,  int count)?  $default,) {final _that = this;
switch (_that) {
case _Completion() when $default != null:
return $default(_that.id,_that.habitId,_that.completedAt,_that.note,_that.count);case _:
  return null;

}
}

}

/// @nodoc


class _Completion implements Completion {
  const _Completion({required this.id, required this.habitId, required this.completedAt, this.note, this.count = 1});
  

@override final  String id;
@override final  String habitId;
@override final  DateTime completedAt;
@override final  String? note;
@override@JsonKey() final  int count;

/// Create a copy of Completion
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CompletionCopyWith<_Completion> get copyWith => __$CompletionCopyWithImpl<_Completion>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Completion&&(identical(other.id, id) || other.id == id)&&(identical(other.habitId, habitId) || other.habitId == habitId)&&(identical(other.completedAt, completedAt) || other.completedAt == completedAt)&&(identical(other.note, note) || other.note == note)&&(identical(other.count, count) || other.count == count));
}


@override
int get hashCode => Object.hash(runtimeType,id,habitId,completedAt,note,count);

@override
String toString() {
  return 'Completion(id: $id, habitId: $habitId, completedAt: $completedAt, note: $note, count: $count)';
}


}

/// @nodoc
abstract mixin class _$CompletionCopyWith<$Res> implements $CompletionCopyWith<$Res> {
  factory _$CompletionCopyWith(_Completion value, $Res Function(_Completion) _then) = __$CompletionCopyWithImpl;
@override @useResult
$Res call({
 String id, String habitId, DateTime completedAt, String? note, int count
});




}
/// @nodoc
class __$CompletionCopyWithImpl<$Res>
    implements _$CompletionCopyWith<$Res> {
  __$CompletionCopyWithImpl(this._self, this._then);

  final _Completion _self;
  final $Res Function(_Completion) _then;

/// Create a copy of Completion
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? habitId = null,Object? completedAt = null,Object? note = freezed,Object? count = null,}) {
  return _then(_Completion(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,habitId: null == habitId ? _self.habitId : habitId // ignore: cast_nullable_to_non_nullable
as String,completedAt: null == completedAt ? _self.completedAt : completedAt // ignore: cast_nullable_to_non_nullable
as DateTime,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
