// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'focus_session.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FocusSession {

 String get id; String get userId; FocusType get type; int get focusMinutes; int get breakMinutes; int get actualFocusSeconds; FocusSessionStatus get status; List<String> get blockedApps; DateTime get startedAt; DateTime? get endedAt; DateTime get createdAt;
/// Create a copy of FocusSession
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FocusSessionCopyWith<FocusSession> get copyWith => _$FocusSessionCopyWithImpl<FocusSession>(this as FocusSession, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FocusSession&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.type, type) || other.type == type)&&(identical(other.focusMinutes, focusMinutes) || other.focusMinutes == focusMinutes)&&(identical(other.breakMinutes, breakMinutes) || other.breakMinutes == breakMinutes)&&(identical(other.actualFocusSeconds, actualFocusSeconds) || other.actualFocusSeconds == actualFocusSeconds)&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.blockedApps, blockedApps)&&(identical(other.startedAt, startedAt) || other.startedAt == startedAt)&&(identical(other.endedAt, endedAt) || other.endedAt == endedAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,userId,type,focusMinutes,breakMinutes,actualFocusSeconds,status,const DeepCollectionEquality().hash(blockedApps),startedAt,endedAt,createdAt);

@override
String toString() {
  return 'FocusSession(id: $id, userId: $userId, type: $type, focusMinutes: $focusMinutes, breakMinutes: $breakMinutes, actualFocusSeconds: $actualFocusSeconds, status: $status, blockedApps: $blockedApps, startedAt: $startedAt, endedAt: $endedAt, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $FocusSessionCopyWith<$Res>  {
  factory $FocusSessionCopyWith(FocusSession value, $Res Function(FocusSession) _then) = _$FocusSessionCopyWithImpl;
@useResult
$Res call({
 String id, String userId, FocusType type, int focusMinutes, int breakMinutes, int actualFocusSeconds, FocusSessionStatus status, List<String> blockedApps, DateTime startedAt, DateTime? endedAt, DateTime createdAt
});




}
/// @nodoc
class _$FocusSessionCopyWithImpl<$Res>
    implements $FocusSessionCopyWith<$Res> {
  _$FocusSessionCopyWithImpl(this._self, this._then);

  final FocusSession _self;
  final $Res Function(FocusSession) _then;

/// Create a copy of FocusSession
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? userId = null,Object? type = null,Object? focusMinutes = null,Object? breakMinutes = null,Object? actualFocusSeconds = null,Object? status = null,Object? blockedApps = null,Object? startedAt = null,Object? endedAt = freezed,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as FocusType,focusMinutes: null == focusMinutes ? _self.focusMinutes : focusMinutes // ignore: cast_nullable_to_non_nullable
as int,breakMinutes: null == breakMinutes ? _self.breakMinutes : breakMinutes // ignore: cast_nullable_to_non_nullable
as int,actualFocusSeconds: null == actualFocusSeconds ? _self.actualFocusSeconds : actualFocusSeconds // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as FocusSessionStatus,blockedApps: null == blockedApps ? _self.blockedApps : blockedApps // ignore: cast_nullable_to_non_nullable
as List<String>,startedAt: null == startedAt ? _self.startedAt : startedAt // ignore: cast_nullable_to_non_nullable
as DateTime,endedAt: freezed == endedAt ? _self.endedAt : endedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [FocusSession].
extension FocusSessionPatterns on FocusSession {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FocusSession value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FocusSession() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FocusSession value)  $default,){
final _that = this;
switch (_that) {
case _FocusSession():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FocusSession value)?  $default,){
final _that = this;
switch (_that) {
case _FocusSession() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String userId,  FocusType type,  int focusMinutes,  int breakMinutes,  int actualFocusSeconds,  FocusSessionStatus status,  List<String> blockedApps,  DateTime startedAt,  DateTime? endedAt,  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FocusSession() when $default != null:
return $default(_that.id,_that.userId,_that.type,_that.focusMinutes,_that.breakMinutes,_that.actualFocusSeconds,_that.status,_that.blockedApps,_that.startedAt,_that.endedAt,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String userId,  FocusType type,  int focusMinutes,  int breakMinutes,  int actualFocusSeconds,  FocusSessionStatus status,  List<String> blockedApps,  DateTime startedAt,  DateTime? endedAt,  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _FocusSession():
return $default(_that.id,_that.userId,_that.type,_that.focusMinutes,_that.breakMinutes,_that.actualFocusSeconds,_that.status,_that.blockedApps,_that.startedAt,_that.endedAt,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String userId,  FocusType type,  int focusMinutes,  int breakMinutes,  int actualFocusSeconds,  FocusSessionStatus status,  List<String> blockedApps,  DateTime startedAt,  DateTime? endedAt,  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _FocusSession() when $default != null:
return $default(_that.id,_that.userId,_that.type,_that.focusMinutes,_that.breakMinutes,_that.actualFocusSeconds,_that.status,_that.blockedApps,_that.startedAt,_that.endedAt,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc


class _FocusSession implements FocusSession {
  const _FocusSession({required this.id, required this.userId, required this.type, required this.focusMinutes, required this.breakMinutes, required this.actualFocusSeconds, required this.status, final  List<String> blockedApps = const [], required this.startedAt, this.endedAt, required this.createdAt}): _blockedApps = blockedApps;
  

@override final  String id;
@override final  String userId;
@override final  FocusType type;
@override final  int focusMinutes;
@override final  int breakMinutes;
@override final  int actualFocusSeconds;
@override final  FocusSessionStatus status;
 final  List<String> _blockedApps;
@override@JsonKey() List<String> get blockedApps {
  if (_blockedApps is EqualUnmodifiableListView) return _blockedApps;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_blockedApps);
}

@override final  DateTime startedAt;
@override final  DateTime? endedAt;
@override final  DateTime createdAt;

/// Create a copy of FocusSession
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FocusSessionCopyWith<_FocusSession> get copyWith => __$FocusSessionCopyWithImpl<_FocusSession>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FocusSession&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.type, type) || other.type == type)&&(identical(other.focusMinutes, focusMinutes) || other.focusMinutes == focusMinutes)&&(identical(other.breakMinutes, breakMinutes) || other.breakMinutes == breakMinutes)&&(identical(other.actualFocusSeconds, actualFocusSeconds) || other.actualFocusSeconds == actualFocusSeconds)&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other._blockedApps, _blockedApps)&&(identical(other.startedAt, startedAt) || other.startedAt == startedAt)&&(identical(other.endedAt, endedAt) || other.endedAt == endedAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,userId,type,focusMinutes,breakMinutes,actualFocusSeconds,status,const DeepCollectionEquality().hash(_blockedApps),startedAt,endedAt,createdAt);

@override
String toString() {
  return 'FocusSession(id: $id, userId: $userId, type: $type, focusMinutes: $focusMinutes, breakMinutes: $breakMinutes, actualFocusSeconds: $actualFocusSeconds, status: $status, blockedApps: $blockedApps, startedAt: $startedAt, endedAt: $endedAt, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$FocusSessionCopyWith<$Res> implements $FocusSessionCopyWith<$Res> {
  factory _$FocusSessionCopyWith(_FocusSession value, $Res Function(_FocusSession) _then) = __$FocusSessionCopyWithImpl;
@override @useResult
$Res call({
 String id, String userId, FocusType type, int focusMinutes, int breakMinutes, int actualFocusSeconds, FocusSessionStatus status, List<String> blockedApps, DateTime startedAt, DateTime? endedAt, DateTime createdAt
});




}
/// @nodoc
class __$FocusSessionCopyWithImpl<$Res>
    implements _$FocusSessionCopyWith<$Res> {
  __$FocusSessionCopyWithImpl(this._self, this._then);

  final _FocusSession _self;
  final $Res Function(_FocusSession) _then;

/// Create a copy of FocusSession
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? userId = null,Object? type = null,Object? focusMinutes = null,Object? breakMinutes = null,Object? actualFocusSeconds = null,Object? status = null,Object? blockedApps = null,Object? startedAt = null,Object? endedAt = freezed,Object? createdAt = null,}) {
  return _then(_FocusSession(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as FocusType,focusMinutes: null == focusMinutes ? _self.focusMinutes : focusMinutes // ignore: cast_nullable_to_non_nullable
as int,breakMinutes: null == breakMinutes ? _self.breakMinutes : breakMinutes // ignore: cast_nullable_to_non_nullable
as int,actualFocusSeconds: null == actualFocusSeconds ? _self.actualFocusSeconds : actualFocusSeconds // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as FocusSessionStatus,blockedApps: null == blockedApps ? _self._blockedApps : blockedApps // ignore: cast_nullable_to_non_nullable
as List<String>,startedAt: null == startedAt ? _self.startedAt : startedAt // ignore: cast_nullable_to_non_nullable
as DateTime,endedAt: freezed == endedAt ? _self.endedAt : endedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
