// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'habit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Habit {

 String get id; String get userId; String get title; String? get description; String get emoji; String get color; HabitFrequency get frequency; int? get customDays; int get targetCount; String? get category; bool get reminderEnabled; String? get reminderTime; int get sortOrder; bool get isArchived; int get currentStreak; DateTime get createdAt; DateTime get updatedAt;
/// Create a copy of Habit
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HabitCopyWith<Habit> get copyWith => _$HabitCopyWithImpl<Habit>(this as Habit, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Habit&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.emoji, emoji) || other.emoji == emoji)&&(identical(other.color, color) || other.color == color)&&(identical(other.frequency, frequency) || other.frequency == frequency)&&(identical(other.customDays, customDays) || other.customDays == customDays)&&(identical(other.targetCount, targetCount) || other.targetCount == targetCount)&&(identical(other.category, category) || other.category == category)&&(identical(other.reminderEnabled, reminderEnabled) || other.reminderEnabled == reminderEnabled)&&(identical(other.reminderTime, reminderTime) || other.reminderTime == reminderTime)&&(identical(other.sortOrder, sortOrder) || other.sortOrder == sortOrder)&&(identical(other.isArchived, isArchived) || other.isArchived == isArchived)&&(identical(other.currentStreak, currentStreak) || other.currentStreak == currentStreak)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,userId,title,description,emoji,color,frequency,customDays,targetCount,category,reminderEnabled,reminderTime,sortOrder,isArchived,currentStreak,createdAt,updatedAt);

@override
String toString() {
  return 'Habit(id: $id, userId: $userId, title: $title, description: $description, emoji: $emoji, color: $color, frequency: $frequency, customDays: $customDays, targetCount: $targetCount, category: $category, reminderEnabled: $reminderEnabled, reminderTime: $reminderTime, sortOrder: $sortOrder, isArchived: $isArchived, currentStreak: $currentStreak, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $HabitCopyWith<$Res>  {
  factory $HabitCopyWith(Habit value, $Res Function(Habit) _then) = _$HabitCopyWithImpl;
@useResult
$Res call({
 String id, String userId, String title, String? description, String emoji, String color, HabitFrequency frequency, int? customDays, int targetCount, String? category, bool reminderEnabled, String? reminderTime, int sortOrder, bool isArchived, int currentStreak, DateTime createdAt, DateTime updatedAt
});




}
/// @nodoc
class _$HabitCopyWithImpl<$Res>
    implements $HabitCopyWith<$Res> {
  _$HabitCopyWithImpl(this._self, this._then);

  final Habit _self;
  final $Res Function(Habit) _then;

/// Create a copy of Habit
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? userId = null,Object? title = null,Object? description = freezed,Object? emoji = null,Object? color = null,Object? frequency = null,Object? customDays = freezed,Object? targetCount = null,Object? category = freezed,Object? reminderEnabled = null,Object? reminderTime = freezed,Object? sortOrder = null,Object? isArchived = null,Object? currentStreak = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,emoji: null == emoji ? _self.emoji : emoji // ignore: cast_nullable_to_non_nullable
as String,color: null == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as String,frequency: null == frequency ? _self.frequency : frequency // ignore: cast_nullable_to_non_nullable
as HabitFrequency,customDays: freezed == customDays ? _self.customDays : customDays // ignore: cast_nullable_to_non_nullable
as int?,targetCount: null == targetCount ? _self.targetCount : targetCount // ignore: cast_nullable_to_non_nullable
as int,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String?,reminderEnabled: null == reminderEnabled ? _self.reminderEnabled : reminderEnabled // ignore: cast_nullable_to_non_nullable
as bool,reminderTime: freezed == reminderTime ? _self.reminderTime : reminderTime // ignore: cast_nullable_to_non_nullable
as String?,sortOrder: null == sortOrder ? _self.sortOrder : sortOrder // ignore: cast_nullable_to_non_nullable
as int,isArchived: null == isArchived ? _self.isArchived : isArchived // ignore: cast_nullable_to_non_nullable
as bool,currentStreak: null == currentStreak ? _self.currentStreak : currentStreak // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [Habit].
extension HabitPatterns on Habit {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Habit value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Habit() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Habit value)  $default,){
final _that = this;
switch (_that) {
case _Habit():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Habit value)?  $default,){
final _that = this;
switch (_that) {
case _Habit() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String userId,  String title,  String? description,  String emoji,  String color,  HabitFrequency frequency,  int? customDays,  int targetCount,  String? category,  bool reminderEnabled,  String? reminderTime,  int sortOrder,  bool isArchived,  int currentStreak,  DateTime createdAt,  DateTime updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Habit() when $default != null:
return $default(_that.id,_that.userId,_that.title,_that.description,_that.emoji,_that.color,_that.frequency,_that.customDays,_that.targetCount,_that.category,_that.reminderEnabled,_that.reminderTime,_that.sortOrder,_that.isArchived,_that.currentStreak,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String userId,  String title,  String? description,  String emoji,  String color,  HabitFrequency frequency,  int? customDays,  int targetCount,  String? category,  bool reminderEnabled,  String? reminderTime,  int sortOrder,  bool isArchived,  int currentStreak,  DateTime createdAt,  DateTime updatedAt)  $default,) {final _that = this;
switch (_that) {
case _Habit():
return $default(_that.id,_that.userId,_that.title,_that.description,_that.emoji,_that.color,_that.frequency,_that.customDays,_that.targetCount,_that.category,_that.reminderEnabled,_that.reminderTime,_that.sortOrder,_that.isArchived,_that.currentStreak,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String userId,  String title,  String? description,  String emoji,  String color,  HabitFrequency frequency,  int? customDays,  int targetCount,  String? category,  bool reminderEnabled,  String? reminderTime,  int sortOrder,  bool isArchived,  int currentStreak,  DateTime createdAt,  DateTime updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _Habit() when $default != null:
return $default(_that.id,_that.userId,_that.title,_that.description,_that.emoji,_that.color,_that.frequency,_that.customDays,_that.targetCount,_that.category,_that.reminderEnabled,_that.reminderTime,_that.sortOrder,_that.isArchived,_that.currentStreak,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc


class _Habit implements Habit {
  const _Habit({required this.id, required this.userId, required this.title, this.description, this.emoji = '⭐', this.color = '#4CAF50', this.frequency = HabitFrequency.daily, this.customDays, this.targetCount = 1, this.category, this.reminderEnabled = false, this.reminderTime, this.sortOrder = 0, this.isArchived = false, this.currentStreak = 0, required this.createdAt, required this.updatedAt});
  

@override final  String id;
@override final  String userId;
@override final  String title;
@override final  String? description;
@override@JsonKey() final  String emoji;
@override@JsonKey() final  String color;
@override@JsonKey() final  HabitFrequency frequency;
@override final  int? customDays;
@override@JsonKey() final  int targetCount;
@override final  String? category;
@override@JsonKey() final  bool reminderEnabled;
@override final  String? reminderTime;
@override@JsonKey() final  int sortOrder;
@override@JsonKey() final  bool isArchived;
@override@JsonKey() final  int currentStreak;
@override final  DateTime createdAt;
@override final  DateTime updatedAt;

/// Create a copy of Habit
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HabitCopyWith<_Habit> get copyWith => __$HabitCopyWithImpl<_Habit>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Habit&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.emoji, emoji) || other.emoji == emoji)&&(identical(other.color, color) || other.color == color)&&(identical(other.frequency, frequency) || other.frequency == frequency)&&(identical(other.customDays, customDays) || other.customDays == customDays)&&(identical(other.targetCount, targetCount) || other.targetCount == targetCount)&&(identical(other.category, category) || other.category == category)&&(identical(other.reminderEnabled, reminderEnabled) || other.reminderEnabled == reminderEnabled)&&(identical(other.reminderTime, reminderTime) || other.reminderTime == reminderTime)&&(identical(other.sortOrder, sortOrder) || other.sortOrder == sortOrder)&&(identical(other.isArchived, isArchived) || other.isArchived == isArchived)&&(identical(other.currentStreak, currentStreak) || other.currentStreak == currentStreak)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,userId,title,description,emoji,color,frequency,customDays,targetCount,category,reminderEnabled,reminderTime,sortOrder,isArchived,currentStreak,createdAt,updatedAt);

@override
String toString() {
  return 'Habit(id: $id, userId: $userId, title: $title, description: $description, emoji: $emoji, color: $color, frequency: $frequency, customDays: $customDays, targetCount: $targetCount, category: $category, reminderEnabled: $reminderEnabled, reminderTime: $reminderTime, sortOrder: $sortOrder, isArchived: $isArchived, currentStreak: $currentStreak, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$HabitCopyWith<$Res> implements $HabitCopyWith<$Res> {
  factory _$HabitCopyWith(_Habit value, $Res Function(_Habit) _then) = __$HabitCopyWithImpl;
@override @useResult
$Res call({
 String id, String userId, String title, String? description, String emoji, String color, HabitFrequency frequency, int? customDays, int targetCount, String? category, bool reminderEnabled, String? reminderTime, int sortOrder, bool isArchived, int currentStreak, DateTime createdAt, DateTime updatedAt
});




}
/// @nodoc
class __$HabitCopyWithImpl<$Res>
    implements _$HabitCopyWith<$Res> {
  __$HabitCopyWithImpl(this._self, this._then);

  final _Habit _self;
  final $Res Function(_Habit) _then;

/// Create a copy of Habit
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? userId = null,Object? title = null,Object? description = freezed,Object? emoji = null,Object? color = null,Object? frequency = null,Object? customDays = freezed,Object? targetCount = null,Object? category = freezed,Object? reminderEnabled = null,Object? reminderTime = freezed,Object? sortOrder = null,Object? isArchived = null,Object? currentStreak = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_Habit(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,emoji: null == emoji ? _self.emoji : emoji // ignore: cast_nullable_to_non_nullable
as String,color: null == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as String,frequency: null == frequency ? _self.frequency : frequency // ignore: cast_nullable_to_non_nullable
as HabitFrequency,customDays: freezed == customDays ? _self.customDays : customDays // ignore: cast_nullable_to_non_nullable
as int?,targetCount: null == targetCount ? _self.targetCount : targetCount // ignore: cast_nullable_to_non_nullable
as int,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String?,reminderEnabled: null == reminderEnabled ? _self.reminderEnabled : reminderEnabled // ignore: cast_nullable_to_non_nullable
as bool,reminderTime: freezed == reminderTime ? _self.reminderTime : reminderTime // ignore: cast_nullable_to_non_nullable
as String?,sortOrder: null == sortOrder ? _self.sortOrder : sortOrder // ignore: cast_nullable_to_non_nullable
as int,isArchived: null == isArchived ? _self.isArchived : isArchived // ignore: cast_nullable_to_non_nullable
as bool,currentStreak: null == currentStreak ? _self.currentStreak : currentStreak // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
