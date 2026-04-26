// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notice_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$NoticeItem {

 String get id; String get title; String get message; String get time; IconData get icon; Color get color;
/// Create a copy of NoticeItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NoticeItemCopyWith<NoticeItem> get copyWith => _$NoticeItemCopyWithImpl<NoticeItem>(this as NoticeItem, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NoticeItem&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.message, message) || other.message == message)&&(identical(other.time, time) || other.time == time)&&(identical(other.icon, icon) || other.icon == icon)&&(identical(other.color, color) || other.color == color));
}


@override
int get hashCode => Object.hash(runtimeType,id,title,message,time,icon,color);

@override
String toString() {
  return 'NoticeItem(id: $id, title: $title, message: $message, time: $time, icon: $icon, color: $color)';
}


}

/// @nodoc
abstract mixin class $NoticeItemCopyWith<$Res>  {
  factory $NoticeItemCopyWith(NoticeItem value, $Res Function(NoticeItem) _then) = _$NoticeItemCopyWithImpl;
@useResult
$Res call({
 String id, String title, String message, String time, IconData icon, Color color
});




}
/// @nodoc
class _$NoticeItemCopyWithImpl<$Res>
    implements $NoticeItemCopyWith<$Res> {
  _$NoticeItemCopyWithImpl(this._self, this._then);

  final NoticeItem _self;
  final $Res Function(NoticeItem) _then;

/// Create a copy of NoticeItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? message = null,Object? time = null,Object? icon = null,Object? color = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,time: null == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as String,icon: null == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as IconData,color: null == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as Color,
  ));
}

}


/// Adds pattern-matching-related methods to [NoticeItem].
extension NoticeItemPatterns on NoticeItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NoticeItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NoticeItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NoticeItem value)  $default,){
final _that = this;
switch (_that) {
case _NoticeItem():
return $default(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NoticeItem value)?  $default,){
final _that = this;
switch (_that) {
case _NoticeItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  String message,  String time,  IconData icon,  Color color)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NoticeItem() when $default != null:
return $default(_that.id,_that.title,_that.message,_that.time,_that.icon,_that.color);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  String message,  String time,  IconData icon,  Color color)  $default,) {final _that = this;
switch (_that) {
case _NoticeItem():
return $default(_that.id,_that.title,_that.message,_that.time,_that.icon,_that.color);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  String message,  String time,  IconData icon,  Color color)?  $default,) {final _that = this;
switch (_that) {
case _NoticeItem() when $default != null:
return $default(_that.id,_that.title,_that.message,_that.time,_that.icon,_that.color);case _:
  return null;

}
}

}

/// @nodoc


class _NoticeItem implements NoticeItem {
  const _NoticeItem({required this.id, required this.title, required this.message, required this.time, required this.icon, required this.color});
  

@override final  String id;
@override final  String title;
@override final  String message;
@override final  String time;
@override final  IconData icon;
@override final  Color color;

/// Create a copy of NoticeItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NoticeItemCopyWith<_NoticeItem> get copyWith => __$NoticeItemCopyWithImpl<_NoticeItem>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NoticeItem&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.message, message) || other.message == message)&&(identical(other.time, time) || other.time == time)&&(identical(other.icon, icon) || other.icon == icon)&&(identical(other.color, color) || other.color == color));
}


@override
int get hashCode => Object.hash(runtimeType,id,title,message,time,icon,color);

@override
String toString() {
  return 'NoticeItem(id: $id, title: $title, message: $message, time: $time, icon: $icon, color: $color)';
}


}

/// @nodoc
abstract mixin class _$NoticeItemCopyWith<$Res> implements $NoticeItemCopyWith<$Res> {
  factory _$NoticeItemCopyWith(_NoticeItem value, $Res Function(_NoticeItem) _then) = __$NoticeItemCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, String message, String time, IconData icon, Color color
});




}
/// @nodoc
class __$NoticeItemCopyWithImpl<$Res>
    implements _$NoticeItemCopyWith<$Res> {
  __$NoticeItemCopyWithImpl(this._self, this._then);

  final _NoticeItem _self;
  final $Res Function(_NoticeItem) _then;

/// Create a copy of NoticeItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? message = null,Object? time = null,Object? icon = null,Object? color = null,}) {
  return _then(_NoticeItem(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,time: null == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as String,icon: null == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as IconData,color: null == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as Color,
  ));
}


}

// dart format on
