// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_category.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$HomeCategory {

 String get label; IconData get icon; Color get background; Color get foreground;
/// Create a copy of HomeCategory
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeCategoryCopyWith<HomeCategory> get copyWith => _$HomeCategoryCopyWithImpl<HomeCategory>(this as HomeCategory, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeCategory&&(identical(other.label, label) || other.label == label)&&(identical(other.icon, icon) || other.icon == icon)&&(identical(other.background, background) || other.background == background)&&(identical(other.foreground, foreground) || other.foreground == foreground));
}


@override
int get hashCode => Object.hash(runtimeType,label,icon,background,foreground);

@override
String toString() {
  return 'HomeCategory(label: $label, icon: $icon, background: $background, foreground: $foreground)';
}


}

/// @nodoc
abstract mixin class $HomeCategoryCopyWith<$Res>  {
  factory $HomeCategoryCopyWith(HomeCategory value, $Res Function(HomeCategory) _then) = _$HomeCategoryCopyWithImpl;
@useResult
$Res call({
 String label, IconData icon, Color background, Color foreground
});




}
/// @nodoc
class _$HomeCategoryCopyWithImpl<$Res>
    implements $HomeCategoryCopyWith<$Res> {
  _$HomeCategoryCopyWithImpl(this._self, this._then);

  final HomeCategory _self;
  final $Res Function(HomeCategory) _then;

/// Create a copy of HomeCategory
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? label = null,Object? icon = null,Object? background = null,Object? foreground = null,}) {
  return _then(_self.copyWith(
label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,icon: null == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as IconData,background: null == background ? _self.background : background // ignore: cast_nullable_to_non_nullable
as Color,foreground: null == foreground ? _self.foreground : foreground // ignore: cast_nullable_to_non_nullable
as Color,
  ));
}

}


/// Adds pattern-matching-related methods to [HomeCategory].
extension HomeCategoryPatterns on HomeCategory {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HomeCategory value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HomeCategory() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HomeCategory value)  $default,){
final _that = this;
switch (_that) {
case _HomeCategory():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HomeCategory value)?  $default,){
final _that = this;
switch (_that) {
case _HomeCategory() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String label,  IconData icon,  Color background,  Color foreground)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HomeCategory() when $default != null:
return $default(_that.label,_that.icon,_that.background,_that.foreground);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String label,  IconData icon,  Color background,  Color foreground)  $default,) {final _that = this;
switch (_that) {
case _HomeCategory():
return $default(_that.label,_that.icon,_that.background,_that.foreground);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String label,  IconData icon,  Color background,  Color foreground)?  $default,) {final _that = this;
switch (_that) {
case _HomeCategory() when $default != null:
return $default(_that.label,_that.icon,_that.background,_that.foreground);case _:
  return null;

}
}

}

/// @nodoc


class _HomeCategory implements HomeCategory {
  const _HomeCategory({required this.label, required this.icon, required this.background, required this.foreground});
  

@override final  String label;
@override final  IconData icon;
@override final  Color background;
@override final  Color foreground;

/// Create a copy of HomeCategory
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HomeCategoryCopyWith<_HomeCategory> get copyWith => __$HomeCategoryCopyWithImpl<_HomeCategory>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HomeCategory&&(identical(other.label, label) || other.label == label)&&(identical(other.icon, icon) || other.icon == icon)&&(identical(other.background, background) || other.background == background)&&(identical(other.foreground, foreground) || other.foreground == foreground));
}


@override
int get hashCode => Object.hash(runtimeType,label,icon,background,foreground);

@override
String toString() {
  return 'HomeCategory(label: $label, icon: $icon, background: $background, foreground: $foreground)';
}


}

/// @nodoc
abstract mixin class _$HomeCategoryCopyWith<$Res> implements $HomeCategoryCopyWith<$Res> {
  factory _$HomeCategoryCopyWith(_HomeCategory value, $Res Function(_HomeCategory) _then) = __$HomeCategoryCopyWithImpl;
@override @useResult
$Res call({
 String label, IconData icon, Color background, Color foreground
});




}
/// @nodoc
class __$HomeCategoryCopyWithImpl<$Res>
    implements _$HomeCategoryCopyWith<$Res> {
  __$HomeCategoryCopyWithImpl(this._self, this._then);

  final _HomeCategory _self;
  final $Res Function(_HomeCategory) _then;

/// Create a copy of HomeCategory
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? label = null,Object? icon = null,Object? background = null,Object? foreground = null,}) {
  return _then(_HomeCategory(
label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,icon: null == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as IconData,background: null == background ? _self.background : background // ignore: cast_nullable_to_non_nullable
as Color,foreground: null == foreground ? _self.foreground : foreground // ignore: cast_nullable_to_non_nullable
as Color,
  ));
}


}

// dart format on
