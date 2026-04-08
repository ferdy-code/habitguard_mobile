// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'screen_time_entry.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ScreenTimeEntry {

 String get packageName; String get appName; int get usageMinutes; String get category; DateTime get date;
/// Create a copy of ScreenTimeEntry
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ScreenTimeEntryCopyWith<ScreenTimeEntry> get copyWith => _$ScreenTimeEntryCopyWithImpl<ScreenTimeEntry>(this as ScreenTimeEntry, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ScreenTimeEntry&&(identical(other.packageName, packageName) || other.packageName == packageName)&&(identical(other.appName, appName) || other.appName == appName)&&(identical(other.usageMinutes, usageMinutes) || other.usageMinutes == usageMinutes)&&(identical(other.category, category) || other.category == category)&&(identical(other.date, date) || other.date == date));
}


@override
int get hashCode => Object.hash(runtimeType,packageName,appName,usageMinutes,category,date);

@override
String toString() {
  return 'ScreenTimeEntry(packageName: $packageName, appName: $appName, usageMinutes: $usageMinutes, category: $category, date: $date)';
}


}

/// @nodoc
abstract mixin class $ScreenTimeEntryCopyWith<$Res>  {
  factory $ScreenTimeEntryCopyWith(ScreenTimeEntry value, $Res Function(ScreenTimeEntry) _then) = _$ScreenTimeEntryCopyWithImpl;
@useResult
$Res call({
 String packageName, String appName, int usageMinutes, String category, DateTime date
});




}
/// @nodoc
class _$ScreenTimeEntryCopyWithImpl<$Res>
    implements $ScreenTimeEntryCopyWith<$Res> {
  _$ScreenTimeEntryCopyWithImpl(this._self, this._then);

  final ScreenTimeEntry _self;
  final $Res Function(ScreenTimeEntry) _then;

/// Create a copy of ScreenTimeEntry
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? packageName = null,Object? appName = null,Object? usageMinutes = null,Object? category = null,Object? date = null,}) {
  return _then(_self.copyWith(
packageName: null == packageName ? _self.packageName : packageName // ignore: cast_nullable_to_non_nullable
as String,appName: null == appName ? _self.appName : appName // ignore: cast_nullable_to_non_nullable
as String,usageMinutes: null == usageMinutes ? _self.usageMinutes : usageMinutes // ignore: cast_nullable_to_non_nullable
as int,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [ScreenTimeEntry].
extension ScreenTimeEntryPatterns on ScreenTimeEntry {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ScreenTimeEntry value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ScreenTimeEntry() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ScreenTimeEntry value)  $default,){
final _that = this;
switch (_that) {
case _ScreenTimeEntry():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ScreenTimeEntry value)?  $default,){
final _that = this;
switch (_that) {
case _ScreenTimeEntry() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String packageName,  String appName,  int usageMinutes,  String category,  DateTime date)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ScreenTimeEntry() when $default != null:
return $default(_that.packageName,_that.appName,_that.usageMinutes,_that.category,_that.date);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String packageName,  String appName,  int usageMinutes,  String category,  DateTime date)  $default,) {final _that = this;
switch (_that) {
case _ScreenTimeEntry():
return $default(_that.packageName,_that.appName,_that.usageMinutes,_that.category,_that.date);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String packageName,  String appName,  int usageMinutes,  String category,  DateTime date)?  $default,) {final _that = this;
switch (_that) {
case _ScreenTimeEntry() when $default != null:
return $default(_that.packageName,_that.appName,_that.usageMinutes,_that.category,_that.date);case _:
  return null;

}
}

}

/// @nodoc


class _ScreenTimeEntry implements ScreenTimeEntry {
  const _ScreenTimeEntry({required this.packageName, required this.appName, required this.usageMinutes, required this.category, required this.date});
  

@override final  String packageName;
@override final  String appName;
@override final  int usageMinutes;
@override final  String category;
@override final  DateTime date;

/// Create a copy of ScreenTimeEntry
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ScreenTimeEntryCopyWith<_ScreenTimeEntry> get copyWith => __$ScreenTimeEntryCopyWithImpl<_ScreenTimeEntry>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ScreenTimeEntry&&(identical(other.packageName, packageName) || other.packageName == packageName)&&(identical(other.appName, appName) || other.appName == appName)&&(identical(other.usageMinutes, usageMinutes) || other.usageMinutes == usageMinutes)&&(identical(other.category, category) || other.category == category)&&(identical(other.date, date) || other.date == date));
}


@override
int get hashCode => Object.hash(runtimeType,packageName,appName,usageMinutes,category,date);

@override
String toString() {
  return 'ScreenTimeEntry(packageName: $packageName, appName: $appName, usageMinutes: $usageMinutes, category: $category, date: $date)';
}


}

/// @nodoc
abstract mixin class _$ScreenTimeEntryCopyWith<$Res> implements $ScreenTimeEntryCopyWith<$Res> {
  factory _$ScreenTimeEntryCopyWith(_ScreenTimeEntry value, $Res Function(_ScreenTimeEntry) _then) = __$ScreenTimeEntryCopyWithImpl;
@override @useResult
$Res call({
 String packageName, String appName, int usageMinutes, String category, DateTime date
});




}
/// @nodoc
class __$ScreenTimeEntryCopyWithImpl<$Res>
    implements _$ScreenTimeEntryCopyWith<$Res> {
  __$ScreenTimeEntryCopyWithImpl(this._self, this._then);

  final _ScreenTimeEntry _self;
  final $Res Function(_ScreenTimeEntry) _then;

/// Create a copy of ScreenTimeEntry
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? packageName = null,Object? appName = null,Object? usageMinutes = null,Object? category = null,Object? date = null,}) {
  return _then(_ScreenTimeEntry(
packageName: null == packageName ? _self.packageName : packageName // ignore: cast_nullable_to_non_nullable
as String,appName: null == appName ? _self.appName : appName // ignore: cast_nullable_to_non_nullable
as String,usageMinutes: null == usageMinutes ? _self.usageMinutes : usageMinutes // ignore: cast_nullable_to_non_nullable
as int,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

/// @nodoc
mixin _$ScreenTimeLimit {

 String get id; String? get packageName; String? get category; int get dailyLimitMinutes; bool get isActive; DateTime get createdAt;
/// Create a copy of ScreenTimeLimit
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ScreenTimeLimitCopyWith<ScreenTimeLimit> get copyWith => _$ScreenTimeLimitCopyWithImpl<ScreenTimeLimit>(this as ScreenTimeLimit, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ScreenTimeLimit&&(identical(other.id, id) || other.id == id)&&(identical(other.packageName, packageName) || other.packageName == packageName)&&(identical(other.category, category) || other.category == category)&&(identical(other.dailyLimitMinutes, dailyLimitMinutes) || other.dailyLimitMinutes == dailyLimitMinutes)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,packageName,category,dailyLimitMinutes,isActive,createdAt);

@override
String toString() {
  return 'ScreenTimeLimit(id: $id, packageName: $packageName, category: $category, dailyLimitMinutes: $dailyLimitMinutes, isActive: $isActive, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $ScreenTimeLimitCopyWith<$Res>  {
  factory $ScreenTimeLimitCopyWith(ScreenTimeLimit value, $Res Function(ScreenTimeLimit) _then) = _$ScreenTimeLimitCopyWithImpl;
@useResult
$Res call({
 String id, String? packageName, String? category, int dailyLimitMinutes, bool isActive, DateTime createdAt
});




}
/// @nodoc
class _$ScreenTimeLimitCopyWithImpl<$Res>
    implements $ScreenTimeLimitCopyWith<$Res> {
  _$ScreenTimeLimitCopyWithImpl(this._self, this._then);

  final ScreenTimeLimit _self;
  final $Res Function(ScreenTimeLimit) _then;

/// Create a copy of ScreenTimeLimit
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? packageName = freezed,Object? category = freezed,Object? dailyLimitMinutes = null,Object? isActive = null,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,packageName: freezed == packageName ? _self.packageName : packageName // ignore: cast_nullable_to_non_nullable
as String?,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String?,dailyLimitMinutes: null == dailyLimitMinutes ? _self.dailyLimitMinutes : dailyLimitMinutes // ignore: cast_nullable_to_non_nullable
as int,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [ScreenTimeLimit].
extension ScreenTimeLimitPatterns on ScreenTimeLimit {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ScreenTimeLimit value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ScreenTimeLimit() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ScreenTimeLimit value)  $default,){
final _that = this;
switch (_that) {
case _ScreenTimeLimit():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ScreenTimeLimit value)?  $default,){
final _that = this;
switch (_that) {
case _ScreenTimeLimit() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String? packageName,  String? category,  int dailyLimitMinutes,  bool isActive,  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ScreenTimeLimit() when $default != null:
return $default(_that.id,_that.packageName,_that.category,_that.dailyLimitMinutes,_that.isActive,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String? packageName,  String? category,  int dailyLimitMinutes,  bool isActive,  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _ScreenTimeLimit():
return $default(_that.id,_that.packageName,_that.category,_that.dailyLimitMinutes,_that.isActive,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String? packageName,  String? category,  int dailyLimitMinutes,  bool isActive,  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _ScreenTimeLimit() when $default != null:
return $default(_that.id,_that.packageName,_that.category,_that.dailyLimitMinutes,_that.isActive,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc


class _ScreenTimeLimit implements ScreenTimeLimit {
  const _ScreenTimeLimit({required this.id, this.packageName, this.category, required this.dailyLimitMinutes, this.isActive = true, required this.createdAt});
  

@override final  String id;
@override final  String? packageName;
@override final  String? category;
@override final  int dailyLimitMinutes;
@override@JsonKey() final  bool isActive;
@override final  DateTime createdAt;

/// Create a copy of ScreenTimeLimit
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ScreenTimeLimitCopyWith<_ScreenTimeLimit> get copyWith => __$ScreenTimeLimitCopyWithImpl<_ScreenTimeLimit>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ScreenTimeLimit&&(identical(other.id, id) || other.id == id)&&(identical(other.packageName, packageName) || other.packageName == packageName)&&(identical(other.category, category) || other.category == category)&&(identical(other.dailyLimitMinutes, dailyLimitMinutes) || other.dailyLimitMinutes == dailyLimitMinutes)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,packageName,category,dailyLimitMinutes,isActive,createdAt);

@override
String toString() {
  return 'ScreenTimeLimit(id: $id, packageName: $packageName, category: $category, dailyLimitMinutes: $dailyLimitMinutes, isActive: $isActive, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$ScreenTimeLimitCopyWith<$Res> implements $ScreenTimeLimitCopyWith<$Res> {
  factory _$ScreenTimeLimitCopyWith(_ScreenTimeLimit value, $Res Function(_ScreenTimeLimit) _then) = __$ScreenTimeLimitCopyWithImpl;
@override @useResult
$Res call({
 String id, String? packageName, String? category, int dailyLimitMinutes, bool isActive, DateTime createdAt
});




}
/// @nodoc
class __$ScreenTimeLimitCopyWithImpl<$Res>
    implements _$ScreenTimeLimitCopyWith<$Res> {
  __$ScreenTimeLimitCopyWithImpl(this._self, this._then);

  final _ScreenTimeLimit _self;
  final $Res Function(_ScreenTimeLimit) _then;

/// Create a copy of ScreenTimeLimit
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? packageName = freezed,Object? category = freezed,Object? dailyLimitMinutes = null,Object? isActive = null,Object? createdAt = null,}) {
  return _then(_ScreenTimeLimit(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,packageName: freezed == packageName ? _self.packageName : packageName // ignore: cast_nullable_to_non_nullable
as String?,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String?,dailyLimitMinutes: null == dailyLimitMinutes ? _self.dailyLimitMinutes : dailyLimitMinutes // ignore: cast_nullable_to_non_nullable
as int,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

/// @nodoc
mixin _$DailyTotal {

 DateTime get date; int get totalMinutes;
/// Create a copy of DailyTotal
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DailyTotalCopyWith<DailyTotal> get copyWith => _$DailyTotalCopyWithImpl<DailyTotal>(this as DailyTotal, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DailyTotal&&(identical(other.date, date) || other.date == date)&&(identical(other.totalMinutes, totalMinutes) || other.totalMinutes == totalMinutes));
}


@override
int get hashCode => Object.hash(runtimeType,date,totalMinutes);

@override
String toString() {
  return 'DailyTotal(date: $date, totalMinutes: $totalMinutes)';
}


}

/// @nodoc
abstract mixin class $DailyTotalCopyWith<$Res>  {
  factory $DailyTotalCopyWith(DailyTotal value, $Res Function(DailyTotal) _then) = _$DailyTotalCopyWithImpl;
@useResult
$Res call({
 DateTime date, int totalMinutes
});




}
/// @nodoc
class _$DailyTotalCopyWithImpl<$Res>
    implements $DailyTotalCopyWith<$Res> {
  _$DailyTotalCopyWithImpl(this._self, this._then);

  final DailyTotal _self;
  final $Res Function(DailyTotal) _then;

/// Create a copy of DailyTotal
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? date = null,Object? totalMinutes = null,}) {
  return _then(_self.copyWith(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,totalMinutes: null == totalMinutes ? _self.totalMinutes : totalMinutes // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [DailyTotal].
extension DailyTotalPatterns on DailyTotal {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DailyTotal value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DailyTotal() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DailyTotal value)  $default,){
final _that = this;
switch (_that) {
case _DailyTotal():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DailyTotal value)?  $default,){
final _that = this;
switch (_that) {
case _DailyTotal() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DateTime date,  int totalMinutes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DailyTotal() when $default != null:
return $default(_that.date,_that.totalMinutes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DateTime date,  int totalMinutes)  $default,) {final _that = this;
switch (_that) {
case _DailyTotal():
return $default(_that.date,_that.totalMinutes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DateTime date,  int totalMinutes)?  $default,) {final _that = this;
switch (_that) {
case _DailyTotal() when $default != null:
return $default(_that.date,_that.totalMinutes);case _:
  return null;

}
}

}

/// @nodoc


class _DailyTotal implements DailyTotal {
  const _DailyTotal({required this.date, required this.totalMinutes});
  

@override final  DateTime date;
@override final  int totalMinutes;

/// Create a copy of DailyTotal
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DailyTotalCopyWith<_DailyTotal> get copyWith => __$DailyTotalCopyWithImpl<_DailyTotal>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DailyTotal&&(identical(other.date, date) || other.date == date)&&(identical(other.totalMinutes, totalMinutes) || other.totalMinutes == totalMinutes));
}


@override
int get hashCode => Object.hash(runtimeType,date,totalMinutes);

@override
String toString() {
  return 'DailyTotal(date: $date, totalMinutes: $totalMinutes)';
}


}

/// @nodoc
abstract mixin class _$DailyTotalCopyWith<$Res> implements $DailyTotalCopyWith<$Res> {
  factory _$DailyTotalCopyWith(_DailyTotal value, $Res Function(_DailyTotal) _then) = __$DailyTotalCopyWithImpl;
@override @useResult
$Res call({
 DateTime date, int totalMinutes
});




}
/// @nodoc
class __$DailyTotalCopyWithImpl<$Res>
    implements _$DailyTotalCopyWith<$Res> {
  __$DailyTotalCopyWithImpl(this._self, this._then);

  final _DailyTotal _self;
  final $Res Function(_DailyTotal) _then;

/// Create a copy of DailyTotal
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? date = null,Object? totalMinutes = null,}) {
  return _then(_DailyTotal(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,totalMinutes: null == totalMinutes ? _self.totalMinutes : totalMinutes // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
mixin _$CategoryBreakdown {

 String get category; int get totalMinutes; double get percentage;
/// Create a copy of CategoryBreakdown
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CategoryBreakdownCopyWith<CategoryBreakdown> get copyWith => _$CategoryBreakdownCopyWithImpl<CategoryBreakdown>(this as CategoryBreakdown, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CategoryBreakdown&&(identical(other.category, category) || other.category == category)&&(identical(other.totalMinutes, totalMinutes) || other.totalMinutes == totalMinutes)&&(identical(other.percentage, percentage) || other.percentage == percentage));
}


@override
int get hashCode => Object.hash(runtimeType,category,totalMinutes,percentage);

@override
String toString() {
  return 'CategoryBreakdown(category: $category, totalMinutes: $totalMinutes, percentage: $percentage)';
}


}

/// @nodoc
abstract mixin class $CategoryBreakdownCopyWith<$Res>  {
  factory $CategoryBreakdownCopyWith(CategoryBreakdown value, $Res Function(CategoryBreakdown) _then) = _$CategoryBreakdownCopyWithImpl;
@useResult
$Res call({
 String category, int totalMinutes, double percentage
});




}
/// @nodoc
class _$CategoryBreakdownCopyWithImpl<$Res>
    implements $CategoryBreakdownCopyWith<$Res> {
  _$CategoryBreakdownCopyWithImpl(this._self, this._then);

  final CategoryBreakdown _self;
  final $Res Function(CategoryBreakdown) _then;

/// Create a copy of CategoryBreakdown
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? category = null,Object? totalMinutes = null,Object? percentage = null,}) {
  return _then(_self.copyWith(
category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,totalMinutes: null == totalMinutes ? _self.totalMinutes : totalMinutes // ignore: cast_nullable_to_non_nullable
as int,percentage: null == percentage ? _self.percentage : percentage // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [CategoryBreakdown].
extension CategoryBreakdownPatterns on CategoryBreakdown {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CategoryBreakdown value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CategoryBreakdown() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CategoryBreakdown value)  $default,){
final _that = this;
switch (_that) {
case _CategoryBreakdown():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CategoryBreakdown value)?  $default,){
final _that = this;
switch (_that) {
case _CategoryBreakdown() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String category,  int totalMinutes,  double percentage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CategoryBreakdown() when $default != null:
return $default(_that.category,_that.totalMinutes,_that.percentage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String category,  int totalMinutes,  double percentage)  $default,) {final _that = this;
switch (_that) {
case _CategoryBreakdown():
return $default(_that.category,_that.totalMinutes,_that.percentage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String category,  int totalMinutes,  double percentage)?  $default,) {final _that = this;
switch (_that) {
case _CategoryBreakdown() when $default != null:
return $default(_that.category,_that.totalMinutes,_that.percentage);case _:
  return null;

}
}

}

/// @nodoc


class _CategoryBreakdown implements CategoryBreakdown {
  const _CategoryBreakdown({required this.category, required this.totalMinutes, required this.percentage});
  

@override final  String category;
@override final  int totalMinutes;
@override final  double percentage;

/// Create a copy of CategoryBreakdown
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CategoryBreakdownCopyWith<_CategoryBreakdown> get copyWith => __$CategoryBreakdownCopyWithImpl<_CategoryBreakdown>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CategoryBreakdown&&(identical(other.category, category) || other.category == category)&&(identical(other.totalMinutes, totalMinutes) || other.totalMinutes == totalMinutes)&&(identical(other.percentage, percentage) || other.percentage == percentage));
}


@override
int get hashCode => Object.hash(runtimeType,category,totalMinutes,percentage);

@override
String toString() {
  return 'CategoryBreakdown(category: $category, totalMinutes: $totalMinutes, percentage: $percentage)';
}


}

/// @nodoc
abstract mixin class _$CategoryBreakdownCopyWith<$Res> implements $CategoryBreakdownCopyWith<$Res> {
  factory _$CategoryBreakdownCopyWith(_CategoryBreakdown value, $Res Function(_CategoryBreakdown) _then) = __$CategoryBreakdownCopyWithImpl;
@override @useResult
$Res call({
 String category, int totalMinutes, double percentage
});




}
/// @nodoc
class __$CategoryBreakdownCopyWithImpl<$Res>
    implements _$CategoryBreakdownCopyWith<$Res> {
  __$CategoryBreakdownCopyWithImpl(this._self, this._then);

  final _CategoryBreakdown _self;
  final $Res Function(_CategoryBreakdown) _then;

/// Create a copy of CategoryBreakdown
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? category = null,Object? totalMinutes = null,Object? percentage = null,}) {
  return _then(_CategoryBreakdown(
category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,totalMinutes: null == totalMinutes ? _self.totalMinutes : totalMinutes // ignore: cast_nullable_to_non_nullable
as int,percentage: null == percentage ? _self.percentage : percentage // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
