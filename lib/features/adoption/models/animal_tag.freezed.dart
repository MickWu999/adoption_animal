// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'animal_tag.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AnimalTag {

 String get label; Color get color;
/// Create a copy of AnimalTag
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AnimalTagCopyWith<AnimalTag> get copyWith => _$AnimalTagCopyWithImpl<AnimalTag>(this as AnimalTag, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AnimalTag&&(identical(other.label, label) || other.label == label)&&(identical(other.color, color) || other.color == color));
}


@override
int get hashCode => Object.hash(runtimeType,label,color);

@override
String toString() {
  return 'AnimalTag(label: $label, color: $color)';
}


}

/// @nodoc
abstract mixin class $AnimalTagCopyWith<$Res>  {
  factory $AnimalTagCopyWith(AnimalTag value, $Res Function(AnimalTag) _then) = _$AnimalTagCopyWithImpl;
@useResult
$Res call({
 String label, Color color
});




}
/// @nodoc
class _$AnimalTagCopyWithImpl<$Res>
    implements $AnimalTagCopyWith<$Res> {
  _$AnimalTagCopyWithImpl(this._self, this._then);

  final AnimalTag _self;
  final $Res Function(AnimalTag) _then;

/// Create a copy of AnimalTag
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? label = null,Object? color = null,}) {
  return _then(_self.copyWith(
label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,color: null == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as Color,
  ));
}

}


/// Adds pattern-matching-related methods to [AnimalTag].
extension AnimalTagPatterns on AnimalTag {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AnimalTag value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AnimalTag() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AnimalTag value)  $default,){
final _that = this;
switch (_that) {
case _AnimalTag():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AnimalTag value)?  $default,){
final _that = this;
switch (_that) {
case _AnimalTag() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String label,  Color color)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AnimalTag() when $default != null:
return $default(_that.label,_that.color);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String label,  Color color)  $default,) {final _that = this;
switch (_that) {
case _AnimalTag():
return $default(_that.label,_that.color);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String label,  Color color)?  $default,) {final _that = this;
switch (_that) {
case _AnimalTag() when $default != null:
return $default(_that.label,_that.color);case _:
  return null;

}
}

}

/// @nodoc


class _AnimalTag implements AnimalTag {
  const _AnimalTag(this.label, this.color);
  

@override final  String label;
@override final  Color color;

/// Create a copy of AnimalTag
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AnimalTagCopyWith<_AnimalTag> get copyWith => __$AnimalTagCopyWithImpl<_AnimalTag>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AnimalTag&&(identical(other.label, label) || other.label == label)&&(identical(other.color, color) || other.color == color));
}


@override
int get hashCode => Object.hash(runtimeType,label,color);

@override
String toString() {
  return 'AnimalTag(label: $label, color: $color)';
}


}

/// @nodoc
abstract mixin class _$AnimalTagCopyWith<$Res> implements $AnimalTagCopyWith<$Res> {
  factory _$AnimalTagCopyWith(_AnimalTag value, $Res Function(_AnimalTag) _then) = __$AnimalTagCopyWithImpl;
@override @useResult
$Res call({
 String label, Color color
});




}
/// @nodoc
class __$AnimalTagCopyWithImpl<$Res>
    implements _$AnimalTagCopyWith<$Res> {
  __$AnimalTagCopyWithImpl(this._self, this._then);

  final _AnimalTag _self;
  final $Res Function(_AnimalTag) _then;

/// Create a copy of AnimalTag
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? label = null,Object? color = null,}) {
  return _then(_AnimalTag(
null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,null == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as Color,
  ));
}


}

// dart format on
