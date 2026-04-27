// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'animal_search_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AnimalSearchParams {

 int get animalAreaPkid; int get animalShelterPkid; String get animalKind; String get animalVariety; String get animalSex; String get animalBodytype; String get animalColour; String get animalAge; String get animalSterilization; String get animalBacterin; String get animalStatus;
/// Create a copy of AnimalSearchParams
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AnimalSearchParamsCopyWith<AnimalSearchParams> get copyWith => _$AnimalSearchParamsCopyWithImpl<AnimalSearchParams>(this as AnimalSearchParams, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AnimalSearchParams&&(identical(other.animalAreaPkid, animalAreaPkid) || other.animalAreaPkid == animalAreaPkid)&&(identical(other.animalShelterPkid, animalShelterPkid) || other.animalShelterPkid == animalShelterPkid)&&(identical(other.animalKind, animalKind) || other.animalKind == animalKind)&&(identical(other.animalVariety, animalVariety) || other.animalVariety == animalVariety)&&(identical(other.animalSex, animalSex) || other.animalSex == animalSex)&&(identical(other.animalBodytype, animalBodytype) || other.animalBodytype == animalBodytype)&&(identical(other.animalColour, animalColour) || other.animalColour == animalColour)&&(identical(other.animalAge, animalAge) || other.animalAge == animalAge)&&(identical(other.animalSterilization, animalSterilization) || other.animalSterilization == animalSterilization)&&(identical(other.animalBacterin, animalBacterin) || other.animalBacterin == animalBacterin)&&(identical(other.animalStatus, animalStatus) || other.animalStatus == animalStatus));
}


@override
int get hashCode => Object.hash(runtimeType,animalAreaPkid,animalShelterPkid,animalKind,animalVariety,animalSex,animalBodytype,animalColour,animalAge,animalSterilization,animalBacterin,animalStatus);

@override
String toString() {
  return 'AnimalSearchParams(animalAreaPkid: $animalAreaPkid, animalShelterPkid: $animalShelterPkid, animalKind: $animalKind, animalVariety: $animalVariety, animalSex: $animalSex, animalBodytype: $animalBodytype, animalColour: $animalColour, animalAge: $animalAge, animalSterilization: $animalSterilization, animalBacterin: $animalBacterin, animalStatus: $animalStatus)';
}


}

/// @nodoc
abstract mixin class $AnimalSearchParamsCopyWith<$Res>  {
  factory $AnimalSearchParamsCopyWith(AnimalSearchParams value, $Res Function(AnimalSearchParams) _then) = _$AnimalSearchParamsCopyWithImpl;
@useResult
$Res call({
 int animalAreaPkid, int animalShelterPkid, String animalKind, String animalVariety, String animalSex, String animalBodytype, String animalColour, String animalAge, String animalSterilization, String animalBacterin, String animalStatus
});




}
/// @nodoc
class _$AnimalSearchParamsCopyWithImpl<$Res>
    implements $AnimalSearchParamsCopyWith<$Res> {
  _$AnimalSearchParamsCopyWithImpl(this._self, this._then);

  final AnimalSearchParams _self;
  final $Res Function(AnimalSearchParams) _then;

/// Create a copy of AnimalSearchParams
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? animalAreaPkid = null,Object? animalShelterPkid = null,Object? animalKind = null,Object? animalVariety = null,Object? animalSex = null,Object? animalBodytype = null,Object? animalColour = null,Object? animalAge = null,Object? animalSterilization = null,Object? animalBacterin = null,Object? animalStatus = null,}) {
  return _then(_self.copyWith(
animalAreaPkid: null == animalAreaPkid ? _self.animalAreaPkid : animalAreaPkid // ignore: cast_nullable_to_non_nullable
as int,animalShelterPkid: null == animalShelterPkid ? _self.animalShelterPkid : animalShelterPkid // ignore: cast_nullable_to_non_nullable
as int,animalKind: null == animalKind ? _self.animalKind : animalKind // ignore: cast_nullable_to_non_nullable
as String,animalVariety: null == animalVariety ? _self.animalVariety : animalVariety // ignore: cast_nullable_to_non_nullable
as String,animalSex: null == animalSex ? _self.animalSex : animalSex // ignore: cast_nullable_to_non_nullable
as String,animalBodytype: null == animalBodytype ? _self.animalBodytype : animalBodytype // ignore: cast_nullable_to_non_nullable
as String,animalColour: null == animalColour ? _self.animalColour : animalColour // ignore: cast_nullable_to_non_nullable
as String,animalAge: null == animalAge ? _self.animalAge : animalAge // ignore: cast_nullable_to_non_nullable
as String,animalSterilization: null == animalSterilization ? _self.animalSterilization : animalSterilization // ignore: cast_nullable_to_non_nullable
as String,animalBacterin: null == animalBacterin ? _self.animalBacterin : animalBacterin // ignore: cast_nullable_to_non_nullable
as String,animalStatus: null == animalStatus ? _self.animalStatus : animalStatus // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [AnimalSearchParams].
extension AnimalSearchParamsPatterns on AnimalSearchParams {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AnimalSearchParams value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AnimalSearchParams() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AnimalSearchParams value)  $default,){
final _that = this;
switch (_that) {
case _AnimalSearchParams():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AnimalSearchParams value)?  $default,){
final _that = this;
switch (_that) {
case _AnimalSearchParams() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int animalAreaPkid,  int animalShelterPkid,  String animalKind,  String animalVariety,  String animalSex,  String animalBodytype,  String animalColour,  String animalAge,  String animalSterilization,  String animalBacterin,  String animalStatus)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AnimalSearchParams() when $default != null:
return $default(_that.animalAreaPkid,_that.animalShelterPkid,_that.animalKind,_that.animalVariety,_that.animalSex,_that.animalBodytype,_that.animalColour,_that.animalAge,_that.animalSterilization,_that.animalBacterin,_that.animalStatus);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int animalAreaPkid,  int animalShelterPkid,  String animalKind,  String animalVariety,  String animalSex,  String animalBodytype,  String animalColour,  String animalAge,  String animalSterilization,  String animalBacterin,  String animalStatus)  $default,) {final _that = this;
switch (_that) {
case _AnimalSearchParams():
return $default(_that.animalAreaPkid,_that.animalShelterPkid,_that.animalKind,_that.animalVariety,_that.animalSex,_that.animalBodytype,_that.animalColour,_that.animalAge,_that.animalSterilization,_that.animalBacterin,_that.animalStatus);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int animalAreaPkid,  int animalShelterPkid,  String animalKind,  String animalVariety,  String animalSex,  String animalBodytype,  String animalColour,  String animalAge,  String animalSterilization,  String animalBacterin,  String animalStatus)?  $default,) {final _that = this;
switch (_that) {
case _AnimalSearchParams() when $default != null:
return $default(_that.animalAreaPkid,_that.animalShelterPkid,_that.animalKind,_that.animalVariety,_that.animalSex,_that.animalBodytype,_that.animalColour,_that.animalAge,_that.animalSterilization,_that.animalBacterin,_that.animalStatus);case _:
  return null;

}
}

}

/// @nodoc


class _AnimalSearchParams extends AnimalSearchParams {
  const _AnimalSearchParams({required this.animalAreaPkid, required this.animalShelterPkid, required this.animalKind, required this.animalVariety, required this.animalSex, required this.animalBodytype, required this.animalColour, required this.animalAge, required this.animalSterilization, required this.animalBacterin, required this.animalStatus}): super._();
  

@override final  int animalAreaPkid;
@override final  int animalShelterPkid;
@override final  String animalKind;
@override final  String animalVariety;
@override final  String animalSex;
@override final  String animalBodytype;
@override final  String animalColour;
@override final  String animalAge;
@override final  String animalSterilization;
@override final  String animalBacterin;
@override final  String animalStatus;

/// Create a copy of AnimalSearchParams
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AnimalSearchParamsCopyWith<_AnimalSearchParams> get copyWith => __$AnimalSearchParamsCopyWithImpl<_AnimalSearchParams>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AnimalSearchParams&&(identical(other.animalAreaPkid, animalAreaPkid) || other.animalAreaPkid == animalAreaPkid)&&(identical(other.animalShelterPkid, animalShelterPkid) || other.animalShelterPkid == animalShelterPkid)&&(identical(other.animalKind, animalKind) || other.animalKind == animalKind)&&(identical(other.animalVariety, animalVariety) || other.animalVariety == animalVariety)&&(identical(other.animalSex, animalSex) || other.animalSex == animalSex)&&(identical(other.animalBodytype, animalBodytype) || other.animalBodytype == animalBodytype)&&(identical(other.animalColour, animalColour) || other.animalColour == animalColour)&&(identical(other.animalAge, animalAge) || other.animalAge == animalAge)&&(identical(other.animalSterilization, animalSterilization) || other.animalSterilization == animalSterilization)&&(identical(other.animalBacterin, animalBacterin) || other.animalBacterin == animalBacterin)&&(identical(other.animalStatus, animalStatus) || other.animalStatus == animalStatus));
}


@override
int get hashCode => Object.hash(runtimeType,animalAreaPkid,animalShelterPkid,animalKind,animalVariety,animalSex,animalBodytype,animalColour,animalAge,animalSterilization,animalBacterin,animalStatus);

@override
String toString() {
  return 'AnimalSearchParams(animalAreaPkid: $animalAreaPkid, animalShelterPkid: $animalShelterPkid, animalKind: $animalKind, animalVariety: $animalVariety, animalSex: $animalSex, animalBodytype: $animalBodytype, animalColour: $animalColour, animalAge: $animalAge, animalSterilization: $animalSterilization, animalBacterin: $animalBacterin, animalStatus: $animalStatus)';
}


}

/// @nodoc
abstract mixin class _$AnimalSearchParamsCopyWith<$Res> implements $AnimalSearchParamsCopyWith<$Res> {
  factory _$AnimalSearchParamsCopyWith(_AnimalSearchParams value, $Res Function(_AnimalSearchParams) _then) = __$AnimalSearchParamsCopyWithImpl;
@override @useResult
$Res call({
 int animalAreaPkid, int animalShelterPkid, String animalKind, String animalVariety, String animalSex, String animalBodytype, String animalColour, String animalAge, String animalSterilization, String animalBacterin, String animalStatus
});




}
/// @nodoc
class __$AnimalSearchParamsCopyWithImpl<$Res>
    implements _$AnimalSearchParamsCopyWith<$Res> {
  __$AnimalSearchParamsCopyWithImpl(this._self, this._then);

  final _AnimalSearchParams _self;
  final $Res Function(_AnimalSearchParams) _then;

/// Create a copy of AnimalSearchParams
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? animalAreaPkid = null,Object? animalShelterPkid = null,Object? animalKind = null,Object? animalVariety = null,Object? animalSex = null,Object? animalBodytype = null,Object? animalColour = null,Object? animalAge = null,Object? animalSterilization = null,Object? animalBacterin = null,Object? animalStatus = null,}) {
  return _then(_AnimalSearchParams(
animalAreaPkid: null == animalAreaPkid ? _self.animalAreaPkid : animalAreaPkid // ignore: cast_nullable_to_non_nullable
as int,animalShelterPkid: null == animalShelterPkid ? _self.animalShelterPkid : animalShelterPkid // ignore: cast_nullable_to_non_nullable
as int,animalKind: null == animalKind ? _self.animalKind : animalKind // ignore: cast_nullable_to_non_nullable
as String,animalVariety: null == animalVariety ? _self.animalVariety : animalVariety // ignore: cast_nullable_to_non_nullable
as String,animalSex: null == animalSex ? _self.animalSex : animalSex // ignore: cast_nullable_to_non_nullable
as String,animalBodytype: null == animalBodytype ? _self.animalBodytype : animalBodytype // ignore: cast_nullable_to_non_nullable
as String,animalColour: null == animalColour ? _self.animalColour : animalColour // ignore: cast_nullable_to_non_nullable
as String,animalAge: null == animalAge ? _self.animalAge : animalAge // ignore: cast_nullable_to_non_nullable
as String,animalSterilization: null == animalSterilization ? _self.animalSterilization : animalSterilization // ignore: cast_nullable_to_non_nullable
as String,animalBacterin: null == animalBacterin ? _self.animalBacterin : animalBacterin // ignore: cast_nullable_to_non_nullable
as String,animalStatus: null == animalStatus ? _self.animalStatus : animalStatus // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
