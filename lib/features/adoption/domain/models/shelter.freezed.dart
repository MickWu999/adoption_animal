// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shelter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Shelter {

 String get id; int get shelterPkid; String get name; String get imagePath; String get address; String get phone; String get distance; String get capacity; String get openingHours;
/// Create a copy of Shelter
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ShelterCopyWith<Shelter> get copyWith => _$ShelterCopyWithImpl<Shelter>(this as Shelter, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Shelter&&(identical(other.id, id) || other.id == id)&&(identical(other.shelterPkid, shelterPkid) || other.shelterPkid == shelterPkid)&&(identical(other.name, name) || other.name == name)&&(identical(other.imagePath, imagePath) || other.imagePath == imagePath)&&(identical(other.address, address) || other.address == address)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.distance, distance) || other.distance == distance)&&(identical(other.capacity, capacity) || other.capacity == capacity)&&(identical(other.openingHours, openingHours) || other.openingHours == openingHours));
}


@override
int get hashCode => Object.hash(runtimeType,id,shelterPkid,name,imagePath,address,phone,distance,capacity,openingHours);

@override
String toString() {
  return 'Shelter(id: $id, shelterPkid: $shelterPkid, name: $name, imagePath: $imagePath, address: $address, phone: $phone, distance: $distance, capacity: $capacity, openingHours: $openingHours)';
}


}

/// @nodoc
abstract mixin class $ShelterCopyWith<$Res>  {
  factory $ShelterCopyWith(Shelter value, $Res Function(Shelter) _then) = _$ShelterCopyWithImpl;
@useResult
$Res call({
 String id, int shelterPkid, String name, String imagePath, String address, String phone, String distance, String capacity, String openingHours
});




}
/// @nodoc
class _$ShelterCopyWithImpl<$Res>
    implements $ShelterCopyWith<$Res> {
  _$ShelterCopyWithImpl(this._self, this._then);

  final Shelter _self;
  final $Res Function(Shelter) _then;

/// Create a copy of Shelter
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? shelterPkid = null,Object? name = null,Object? imagePath = null,Object? address = null,Object? phone = null,Object? distance = null,Object? capacity = null,Object? openingHours = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,shelterPkid: null == shelterPkid ? _self.shelterPkid : shelterPkid // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,imagePath: null == imagePath ? _self.imagePath : imagePath // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,distance: null == distance ? _self.distance : distance // ignore: cast_nullable_to_non_nullable
as String,capacity: null == capacity ? _self.capacity : capacity // ignore: cast_nullable_to_non_nullable
as String,openingHours: null == openingHours ? _self.openingHours : openingHours // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [Shelter].
extension ShelterPatterns on Shelter {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Shelter value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Shelter() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Shelter value)  $default,){
final _that = this;
switch (_that) {
case _Shelter():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Shelter value)?  $default,){
final _that = this;
switch (_that) {
case _Shelter() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  int shelterPkid,  String name,  String imagePath,  String address,  String phone,  String distance,  String capacity,  String openingHours)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Shelter() when $default != null:
return $default(_that.id,_that.shelterPkid,_that.name,_that.imagePath,_that.address,_that.phone,_that.distance,_that.capacity,_that.openingHours);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  int shelterPkid,  String name,  String imagePath,  String address,  String phone,  String distance,  String capacity,  String openingHours)  $default,) {final _that = this;
switch (_that) {
case _Shelter():
return $default(_that.id,_that.shelterPkid,_that.name,_that.imagePath,_that.address,_that.phone,_that.distance,_that.capacity,_that.openingHours);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  int shelterPkid,  String name,  String imagePath,  String address,  String phone,  String distance,  String capacity,  String openingHours)?  $default,) {final _that = this;
switch (_that) {
case _Shelter() when $default != null:
return $default(_that.id,_that.shelterPkid,_that.name,_that.imagePath,_that.address,_that.phone,_that.distance,_that.capacity,_that.openingHours);case _:
  return null;

}
}

}

/// @nodoc


class _Shelter implements Shelter {
  const _Shelter({required this.id, required this.shelterPkid, required this.name, required this.imagePath, required this.address, required this.phone, required this.distance, required this.capacity, required this.openingHours});
  

@override final  String id;
@override final  int shelterPkid;
@override final  String name;
@override final  String imagePath;
@override final  String address;
@override final  String phone;
@override final  String distance;
@override final  String capacity;
@override final  String openingHours;

/// Create a copy of Shelter
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ShelterCopyWith<_Shelter> get copyWith => __$ShelterCopyWithImpl<_Shelter>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Shelter&&(identical(other.id, id) || other.id == id)&&(identical(other.shelterPkid, shelterPkid) || other.shelterPkid == shelterPkid)&&(identical(other.name, name) || other.name == name)&&(identical(other.imagePath, imagePath) || other.imagePath == imagePath)&&(identical(other.address, address) || other.address == address)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.distance, distance) || other.distance == distance)&&(identical(other.capacity, capacity) || other.capacity == capacity)&&(identical(other.openingHours, openingHours) || other.openingHours == openingHours));
}


@override
int get hashCode => Object.hash(runtimeType,id,shelterPkid,name,imagePath,address,phone,distance,capacity,openingHours);

@override
String toString() {
  return 'Shelter(id: $id, shelterPkid: $shelterPkid, name: $name, imagePath: $imagePath, address: $address, phone: $phone, distance: $distance, capacity: $capacity, openingHours: $openingHours)';
}


}

/// @nodoc
abstract mixin class _$ShelterCopyWith<$Res> implements $ShelterCopyWith<$Res> {
  factory _$ShelterCopyWith(_Shelter value, $Res Function(_Shelter) _then) = __$ShelterCopyWithImpl;
@override @useResult
$Res call({
 String id, int shelterPkid, String name, String imagePath, String address, String phone, String distance, String capacity, String openingHours
});




}
/// @nodoc
class __$ShelterCopyWithImpl<$Res>
    implements _$ShelterCopyWith<$Res> {
  __$ShelterCopyWithImpl(this._self, this._then);

  final _Shelter _self;
  final $Res Function(_Shelter) _then;

/// Create a copy of Shelter
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? shelterPkid = null,Object? name = null,Object? imagePath = null,Object? address = null,Object? phone = null,Object? distance = null,Object? capacity = null,Object? openingHours = null,}) {
  return _then(_Shelter(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,shelterPkid: null == shelterPkid ? _self.shelterPkid : shelterPkid // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,imagePath: null == imagePath ? _self.imagePath : imagePath // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,distance: null == distance ? _self.distance : distance // ignore: cast_nullable_to_non_nullable
as String,capacity: null == capacity ? _self.capacity : capacity // ignore: cast_nullable_to_non_nullable
as String,openingHours: null == openingHours ? _self.openingHours : openingHours // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
