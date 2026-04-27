// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'animal.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Animal {

 String get id; String get animalId; String get animalSubid; int get animalAreaPkid; int get animalShelterPkid; String get animalPlace; String get animalKind; String get animalVariety; String get animalSex; String get animalBodytype; String get animalColour; String get animalAge; String get animalSterilization; String get animalBacterin; String get animalFoundplace; String get animalStatus; String get animalOpendate; String get name; String get imagePath; String get location; String get shelterId; String get shelterName; String get shelterAddress; String get shelterTel; String get breed; String get color; String get size; String get ageLabel; String get genderLabel; AnimalType get type; List<AnimalTag> get tags; bool get isFavorite; bool get isAdopted; bool get isNeutered;
/// Create a copy of Animal
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AnimalCopyWith<Animal> get copyWith => _$AnimalCopyWithImpl<Animal>(this as Animal, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Animal&&(identical(other.id, id) || other.id == id)&&(identical(other.animalId, animalId) || other.animalId == animalId)&&(identical(other.animalSubid, animalSubid) || other.animalSubid == animalSubid)&&(identical(other.animalAreaPkid, animalAreaPkid) || other.animalAreaPkid == animalAreaPkid)&&(identical(other.animalShelterPkid, animalShelterPkid) || other.animalShelterPkid == animalShelterPkid)&&(identical(other.animalPlace, animalPlace) || other.animalPlace == animalPlace)&&(identical(other.animalKind, animalKind) || other.animalKind == animalKind)&&(identical(other.animalVariety, animalVariety) || other.animalVariety == animalVariety)&&(identical(other.animalSex, animalSex) || other.animalSex == animalSex)&&(identical(other.animalBodytype, animalBodytype) || other.animalBodytype == animalBodytype)&&(identical(other.animalColour, animalColour) || other.animalColour == animalColour)&&(identical(other.animalAge, animalAge) || other.animalAge == animalAge)&&(identical(other.animalSterilization, animalSterilization) || other.animalSterilization == animalSterilization)&&(identical(other.animalBacterin, animalBacterin) || other.animalBacterin == animalBacterin)&&(identical(other.animalFoundplace, animalFoundplace) || other.animalFoundplace == animalFoundplace)&&(identical(other.animalStatus, animalStatus) || other.animalStatus == animalStatus)&&(identical(other.animalOpendate, animalOpendate) || other.animalOpendate == animalOpendate)&&(identical(other.name, name) || other.name == name)&&(identical(other.imagePath, imagePath) || other.imagePath == imagePath)&&(identical(other.location, location) || other.location == location)&&(identical(other.shelterId, shelterId) || other.shelterId == shelterId)&&(identical(other.shelterName, shelterName) || other.shelterName == shelterName)&&(identical(other.shelterAddress, shelterAddress) || other.shelterAddress == shelterAddress)&&(identical(other.shelterTel, shelterTel) || other.shelterTel == shelterTel)&&(identical(other.breed, breed) || other.breed == breed)&&(identical(other.color, color) || other.color == color)&&(identical(other.size, size) || other.size == size)&&(identical(other.ageLabel, ageLabel) || other.ageLabel == ageLabel)&&(identical(other.genderLabel, genderLabel) || other.genderLabel == genderLabel)&&(identical(other.type, type) || other.type == type)&&const DeepCollectionEquality().equals(other.tags, tags)&&(identical(other.isFavorite, isFavorite) || other.isFavorite == isFavorite)&&(identical(other.isAdopted, isAdopted) || other.isAdopted == isAdopted)&&(identical(other.isNeutered, isNeutered) || other.isNeutered == isNeutered));
}


@override
int get hashCode => Object.hashAll([runtimeType,id,animalId,animalSubid,animalAreaPkid,animalShelterPkid,animalPlace,animalKind,animalVariety,animalSex,animalBodytype,animalColour,animalAge,animalSterilization,animalBacterin,animalFoundplace,animalStatus,animalOpendate,name,imagePath,location,shelterId,shelterName,shelterAddress,shelterTel,breed,color,size,ageLabel,genderLabel,type,const DeepCollectionEquality().hash(tags),isFavorite,isAdopted,isNeutered]);

@override
String toString() {
  return 'Animal(id: $id, animalId: $animalId, animalSubid: $animalSubid, animalAreaPkid: $animalAreaPkid, animalShelterPkid: $animalShelterPkid, animalPlace: $animalPlace, animalKind: $animalKind, animalVariety: $animalVariety, animalSex: $animalSex, animalBodytype: $animalBodytype, animalColour: $animalColour, animalAge: $animalAge, animalSterilization: $animalSterilization, animalBacterin: $animalBacterin, animalFoundplace: $animalFoundplace, animalStatus: $animalStatus, animalOpendate: $animalOpendate, name: $name, imagePath: $imagePath, location: $location, shelterId: $shelterId, shelterName: $shelterName, shelterAddress: $shelterAddress, shelterTel: $shelterTel, breed: $breed, color: $color, size: $size, ageLabel: $ageLabel, genderLabel: $genderLabel, type: $type, tags: $tags, isFavorite: $isFavorite, isAdopted: $isAdopted, isNeutered: $isNeutered)';
}


}

/// @nodoc
abstract mixin class $AnimalCopyWith<$Res>  {
  factory $AnimalCopyWith(Animal value, $Res Function(Animal) _then) = _$AnimalCopyWithImpl;
@useResult
$Res call({
 String id, String animalId, String animalSubid, int animalAreaPkid, int animalShelterPkid, String animalPlace, String animalKind, String animalVariety, String animalSex, String animalBodytype, String animalColour, String animalAge, String animalSterilization, String animalBacterin, String animalFoundplace, String animalStatus, String animalOpendate, String name, String imagePath, String location, String shelterId, String shelterName, String shelterAddress, String shelterTel, String breed, String color, String size, String ageLabel, String genderLabel, AnimalType type, List<AnimalTag> tags, bool isFavorite, bool isAdopted, bool isNeutered
});




}
/// @nodoc
class _$AnimalCopyWithImpl<$Res>
    implements $AnimalCopyWith<$Res> {
  _$AnimalCopyWithImpl(this._self, this._then);

  final Animal _self;
  final $Res Function(Animal) _then;

/// Create a copy of Animal
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? animalId = null,Object? animalSubid = null,Object? animalAreaPkid = null,Object? animalShelterPkid = null,Object? animalPlace = null,Object? animalKind = null,Object? animalVariety = null,Object? animalSex = null,Object? animalBodytype = null,Object? animalColour = null,Object? animalAge = null,Object? animalSterilization = null,Object? animalBacterin = null,Object? animalFoundplace = null,Object? animalStatus = null,Object? animalOpendate = null,Object? name = null,Object? imagePath = null,Object? location = null,Object? shelterId = null,Object? shelterName = null,Object? shelterAddress = null,Object? shelterTel = null,Object? breed = null,Object? color = null,Object? size = null,Object? ageLabel = null,Object? genderLabel = null,Object? type = null,Object? tags = null,Object? isFavorite = null,Object? isAdopted = null,Object? isNeutered = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,animalId: null == animalId ? _self.animalId : animalId // ignore: cast_nullable_to_non_nullable
as String,animalSubid: null == animalSubid ? _self.animalSubid : animalSubid // ignore: cast_nullable_to_non_nullable
as String,animalAreaPkid: null == animalAreaPkid ? _self.animalAreaPkid : animalAreaPkid // ignore: cast_nullable_to_non_nullable
as int,animalShelterPkid: null == animalShelterPkid ? _self.animalShelterPkid : animalShelterPkid // ignore: cast_nullable_to_non_nullable
as int,animalPlace: null == animalPlace ? _self.animalPlace : animalPlace // ignore: cast_nullable_to_non_nullable
as String,animalKind: null == animalKind ? _self.animalKind : animalKind // ignore: cast_nullable_to_non_nullable
as String,animalVariety: null == animalVariety ? _self.animalVariety : animalVariety // ignore: cast_nullable_to_non_nullable
as String,animalSex: null == animalSex ? _self.animalSex : animalSex // ignore: cast_nullable_to_non_nullable
as String,animalBodytype: null == animalBodytype ? _self.animalBodytype : animalBodytype // ignore: cast_nullable_to_non_nullable
as String,animalColour: null == animalColour ? _self.animalColour : animalColour // ignore: cast_nullable_to_non_nullable
as String,animalAge: null == animalAge ? _self.animalAge : animalAge // ignore: cast_nullable_to_non_nullable
as String,animalSterilization: null == animalSterilization ? _self.animalSterilization : animalSterilization // ignore: cast_nullable_to_non_nullable
as String,animalBacterin: null == animalBacterin ? _self.animalBacterin : animalBacterin // ignore: cast_nullable_to_non_nullable
as String,animalFoundplace: null == animalFoundplace ? _self.animalFoundplace : animalFoundplace // ignore: cast_nullable_to_non_nullable
as String,animalStatus: null == animalStatus ? _self.animalStatus : animalStatus // ignore: cast_nullable_to_non_nullable
as String,animalOpendate: null == animalOpendate ? _self.animalOpendate : animalOpendate // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,imagePath: null == imagePath ? _self.imagePath : imagePath // ignore: cast_nullable_to_non_nullable
as String,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String,shelterId: null == shelterId ? _self.shelterId : shelterId // ignore: cast_nullable_to_non_nullable
as String,shelterName: null == shelterName ? _self.shelterName : shelterName // ignore: cast_nullable_to_non_nullable
as String,shelterAddress: null == shelterAddress ? _self.shelterAddress : shelterAddress // ignore: cast_nullable_to_non_nullable
as String,shelterTel: null == shelterTel ? _self.shelterTel : shelterTel // ignore: cast_nullable_to_non_nullable
as String,breed: null == breed ? _self.breed : breed // ignore: cast_nullable_to_non_nullable
as String,color: null == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as String,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as String,ageLabel: null == ageLabel ? _self.ageLabel : ageLabel // ignore: cast_nullable_to_non_nullable
as String,genderLabel: null == genderLabel ? _self.genderLabel : genderLabel // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as AnimalType,tags: null == tags ? _self.tags : tags // ignore: cast_nullable_to_non_nullable
as List<AnimalTag>,isFavorite: null == isFavorite ? _self.isFavorite : isFavorite // ignore: cast_nullable_to_non_nullable
as bool,isAdopted: null == isAdopted ? _self.isAdopted : isAdopted // ignore: cast_nullable_to_non_nullable
as bool,isNeutered: null == isNeutered ? _self.isNeutered : isNeutered // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [Animal].
extension AnimalPatterns on Animal {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Animal value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Animal() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Animal value)  $default,){
final _that = this;
switch (_that) {
case _Animal():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Animal value)?  $default,){
final _that = this;
switch (_that) {
case _Animal() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String animalId,  String animalSubid,  int animalAreaPkid,  int animalShelterPkid,  String animalPlace,  String animalKind,  String animalVariety,  String animalSex,  String animalBodytype,  String animalColour,  String animalAge,  String animalSterilization,  String animalBacterin,  String animalFoundplace,  String animalStatus,  String animalOpendate,  String name,  String imagePath,  String location,  String shelterId,  String shelterName,  String shelterAddress,  String shelterTel,  String breed,  String color,  String size,  String ageLabel,  String genderLabel,  AnimalType type,  List<AnimalTag> tags,  bool isFavorite,  bool isAdopted,  bool isNeutered)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Animal() when $default != null:
return $default(_that.id,_that.animalId,_that.animalSubid,_that.animalAreaPkid,_that.animalShelterPkid,_that.animalPlace,_that.animalKind,_that.animalVariety,_that.animalSex,_that.animalBodytype,_that.animalColour,_that.animalAge,_that.animalSterilization,_that.animalBacterin,_that.animalFoundplace,_that.animalStatus,_that.animalOpendate,_that.name,_that.imagePath,_that.location,_that.shelterId,_that.shelterName,_that.shelterAddress,_that.shelterTel,_that.breed,_that.color,_that.size,_that.ageLabel,_that.genderLabel,_that.type,_that.tags,_that.isFavorite,_that.isAdopted,_that.isNeutered);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String animalId,  String animalSubid,  int animalAreaPkid,  int animalShelterPkid,  String animalPlace,  String animalKind,  String animalVariety,  String animalSex,  String animalBodytype,  String animalColour,  String animalAge,  String animalSterilization,  String animalBacterin,  String animalFoundplace,  String animalStatus,  String animalOpendate,  String name,  String imagePath,  String location,  String shelterId,  String shelterName,  String shelterAddress,  String shelterTel,  String breed,  String color,  String size,  String ageLabel,  String genderLabel,  AnimalType type,  List<AnimalTag> tags,  bool isFavorite,  bool isAdopted,  bool isNeutered)  $default,) {final _that = this;
switch (_that) {
case _Animal():
return $default(_that.id,_that.animalId,_that.animalSubid,_that.animalAreaPkid,_that.animalShelterPkid,_that.animalPlace,_that.animalKind,_that.animalVariety,_that.animalSex,_that.animalBodytype,_that.animalColour,_that.animalAge,_that.animalSterilization,_that.animalBacterin,_that.animalFoundplace,_that.animalStatus,_that.animalOpendate,_that.name,_that.imagePath,_that.location,_that.shelterId,_that.shelterName,_that.shelterAddress,_that.shelterTel,_that.breed,_that.color,_that.size,_that.ageLabel,_that.genderLabel,_that.type,_that.tags,_that.isFavorite,_that.isAdopted,_that.isNeutered);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String animalId,  String animalSubid,  int animalAreaPkid,  int animalShelterPkid,  String animalPlace,  String animalKind,  String animalVariety,  String animalSex,  String animalBodytype,  String animalColour,  String animalAge,  String animalSterilization,  String animalBacterin,  String animalFoundplace,  String animalStatus,  String animalOpendate,  String name,  String imagePath,  String location,  String shelterId,  String shelterName,  String shelterAddress,  String shelterTel,  String breed,  String color,  String size,  String ageLabel,  String genderLabel,  AnimalType type,  List<AnimalTag> tags,  bool isFavorite,  bool isAdopted,  bool isNeutered)?  $default,) {final _that = this;
switch (_that) {
case _Animal() when $default != null:
return $default(_that.id,_that.animalId,_that.animalSubid,_that.animalAreaPkid,_that.animalShelterPkid,_that.animalPlace,_that.animalKind,_that.animalVariety,_that.animalSex,_that.animalBodytype,_that.animalColour,_that.animalAge,_that.animalSterilization,_that.animalBacterin,_that.animalFoundplace,_that.animalStatus,_that.animalOpendate,_that.name,_that.imagePath,_that.location,_that.shelterId,_that.shelterName,_that.shelterAddress,_that.shelterTel,_that.breed,_that.color,_that.size,_that.ageLabel,_that.genderLabel,_that.type,_that.tags,_that.isFavorite,_that.isAdopted,_that.isNeutered);case _:
  return null;

}
}

}

/// @nodoc


class _Animal implements Animal {
  const _Animal({required this.id, required this.animalId, required this.animalSubid, required this.animalAreaPkid, required this.animalShelterPkid, required this.animalPlace, required this.animalKind, required this.animalVariety, required this.animalSex, required this.animalBodytype, required this.animalColour, required this.animalAge, required this.animalSterilization, required this.animalBacterin, required this.animalFoundplace, required this.animalStatus, required this.animalOpendate, required this.name, required this.imagePath, required this.location, required this.shelterId, required this.shelterName, required this.shelterAddress, required this.shelterTel, required this.breed, required this.color, required this.size, required this.ageLabel, required this.genderLabel, required this.type, required final  List<AnimalTag> tags, this.isFavorite = false, this.isAdopted = false, this.isNeutered = false}): _tags = tags;
  

@override final  String id;
@override final  String animalId;
@override final  String animalSubid;
@override final  int animalAreaPkid;
@override final  int animalShelterPkid;
@override final  String animalPlace;
@override final  String animalKind;
@override final  String animalVariety;
@override final  String animalSex;
@override final  String animalBodytype;
@override final  String animalColour;
@override final  String animalAge;
@override final  String animalSterilization;
@override final  String animalBacterin;
@override final  String animalFoundplace;
@override final  String animalStatus;
@override final  String animalOpendate;
@override final  String name;
@override final  String imagePath;
@override final  String location;
@override final  String shelterId;
@override final  String shelterName;
@override final  String shelterAddress;
@override final  String shelterTel;
@override final  String breed;
@override final  String color;
@override final  String size;
@override final  String ageLabel;
@override final  String genderLabel;
@override final  AnimalType type;
 final  List<AnimalTag> _tags;
@override List<AnimalTag> get tags {
  if (_tags is EqualUnmodifiableListView) return _tags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tags);
}

@override@JsonKey() final  bool isFavorite;
@override@JsonKey() final  bool isAdopted;
@override@JsonKey() final  bool isNeutered;

/// Create a copy of Animal
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AnimalCopyWith<_Animal> get copyWith => __$AnimalCopyWithImpl<_Animal>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Animal&&(identical(other.id, id) || other.id == id)&&(identical(other.animalId, animalId) || other.animalId == animalId)&&(identical(other.animalSubid, animalSubid) || other.animalSubid == animalSubid)&&(identical(other.animalAreaPkid, animalAreaPkid) || other.animalAreaPkid == animalAreaPkid)&&(identical(other.animalShelterPkid, animalShelterPkid) || other.animalShelterPkid == animalShelterPkid)&&(identical(other.animalPlace, animalPlace) || other.animalPlace == animalPlace)&&(identical(other.animalKind, animalKind) || other.animalKind == animalKind)&&(identical(other.animalVariety, animalVariety) || other.animalVariety == animalVariety)&&(identical(other.animalSex, animalSex) || other.animalSex == animalSex)&&(identical(other.animalBodytype, animalBodytype) || other.animalBodytype == animalBodytype)&&(identical(other.animalColour, animalColour) || other.animalColour == animalColour)&&(identical(other.animalAge, animalAge) || other.animalAge == animalAge)&&(identical(other.animalSterilization, animalSterilization) || other.animalSterilization == animalSterilization)&&(identical(other.animalBacterin, animalBacterin) || other.animalBacterin == animalBacterin)&&(identical(other.animalFoundplace, animalFoundplace) || other.animalFoundplace == animalFoundplace)&&(identical(other.animalStatus, animalStatus) || other.animalStatus == animalStatus)&&(identical(other.animalOpendate, animalOpendate) || other.animalOpendate == animalOpendate)&&(identical(other.name, name) || other.name == name)&&(identical(other.imagePath, imagePath) || other.imagePath == imagePath)&&(identical(other.location, location) || other.location == location)&&(identical(other.shelterId, shelterId) || other.shelterId == shelterId)&&(identical(other.shelterName, shelterName) || other.shelterName == shelterName)&&(identical(other.shelterAddress, shelterAddress) || other.shelterAddress == shelterAddress)&&(identical(other.shelterTel, shelterTel) || other.shelterTel == shelterTel)&&(identical(other.breed, breed) || other.breed == breed)&&(identical(other.color, color) || other.color == color)&&(identical(other.size, size) || other.size == size)&&(identical(other.ageLabel, ageLabel) || other.ageLabel == ageLabel)&&(identical(other.genderLabel, genderLabel) || other.genderLabel == genderLabel)&&(identical(other.type, type) || other.type == type)&&const DeepCollectionEquality().equals(other._tags, _tags)&&(identical(other.isFavorite, isFavorite) || other.isFavorite == isFavorite)&&(identical(other.isAdopted, isAdopted) || other.isAdopted == isAdopted)&&(identical(other.isNeutered, isNeutered) || other.isNeutered == isNeutered));
}


@override
int get hashCode => Object.hashAll([runtimeType,id,animalId,animalSubid,animalAreaPkid,animalShelterPkid,animalPlace,animalKind,animalVariety,animalSex,animalBodytype,animalColour,animalAge,animalSterilization,animalBacterin,animalFoundplace,animalStatus,animalOpendate,name,imagePath,location,shelterId,shelterName,shelterAddress,shelterTel,breed,color,size,ageLabel,genderLabel,type,const DeepCollectionEquality().hash(_tags),isFavorite,isAdopted,isNeutered]);

@override
String toString() {
  return 'Animal(id: $id, animalId: $animalId, animalSubid: $animalSubid, animalAreaPkid: $animalAreaPkid, animalShelterPkid: $animalShelterPkid, animalPlace: $animalPlace, animalKind: $animalKind, animalVariety: $animalVariety, animalSex: $animalSex, animalBodytype: $animalBodytype, animalColour: $animalColour, animalAge: $animalAge, animalSterilization: $animalSterilization, animalBacterin: $animalBacterin, animalFoundplace: $animalFoundplace, animalStatus: $animalStatus, animalOpendate: $animalOpendate, name: $name, imagePath: $imagePath, location: $location, shelterId: $shelterId, shelterName: $shelterName, shelterAddress: $shelterAddress, shelterTel: $shelterTel, breed: $breed, color: $color, size: $size, ageLabel: $ageLabel, genderLabel: $genderLabel, type: $type, tags: $tags, isFavorite: $isFavorite, isAdopted: $isAdopted, isNeutered: $isNeutered)';
}


}

/// @nodoc
abstract mixin class _$AnimalCopyWith<$Res> implements $AnimalCopyWith<$Res> {
  factory _$AnimalCopyWith(_Animal value, $Res Function(_Animal) _then) = __$AnimalCopyWithImpl;
@override @useResult
$Res call({
 String id, String animalId, String animalSubid, int animalAreaPkid, int animalShelterPkid, String animalPlace, String animalKind, String animalVariety, String animalSex, String animalBodytype, String animalColour, String animalAge, String animalSterilization, String animalBacterin, String animalFoundplace, String animalStatus, String animalOpendate, String name, String imagePath, String location, String shelterId, String shelterName, String shelterAddress, String shelterTel, String breed, String color, String size, String ageLabel, String genderLabel, AnimalType type, List<AnimalTag> tags, bool isFavorite, bool isAdopted, bool isNeutered
});




}
/// @nodoc
class __$AnimalCopyWithImpl<$Res>
    implements _$AnimalCopyWith<$Res> {
  __$AnimalCopyWithImpl(this._self, this._then);

  final _Animal _self;
  final $Res Function(_Animal) _then;

/// Create a copy of Animal
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? animalId = null,Object? animalSubid = null,Object? animalAreaPkid = null,Object? animalShelterPkid = null,Object? animalPlace = null,Object? animalKind = null,Object? animalVariety = null,Object? animalSex = null,Object? animalBodytype = null,Object? animalColour = null,Object? animalAge = null,Object? animalSterilization = null,Object? animalBacterin = null,Object? animalFoundplace = null,Object? animalStatus = null,Object? animalOpendate = null,Object? name = null,Object? imagePath = null,Object? location = null,Object? shelterId = null,Object? shelterName = null,Object? shelterAddress = null,Object? shelterTel = null,Object? breed = null,Object? color = null,Object? size = null,Object? ageLabel = null,Object? genderLabel = null,Object? type = null,Object? tags = null,Object? isFavorite = null,Object? isAdopted = null,Object? isNeutered = null,}) {
  return _then(_Animal(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,animalId: null == animalId ? _self.animalId : animalId // ignore: cast_nullable_to_non_nullable
as String,animalSubid: null == animalSubid ? _self.animalSubid : animalSubid // ignore: cast_nullable_to_non_nullable
as String,animalAreaPkid: null == animalAreaPkid ? _self.animalAreaPkid : animalAreaPkid // ignore: cast_nullable_to_non_nullable
as int,animalShelterPkid: null == animalShelterPkid ? _self.animalShelterPkid : animalShelterPkid // ignore: cast_nullable_to_non_nullable
as int,animalPlace: null == animalPlace ? _self.animalPlace : animalPlace // ignore: cast_nullable_to_non_nullable
as String,animalKind: null == animalKind ? _self.animalKind : animalKind // ignore: cast_nullable_to_non_nullable
as String,animalVariety: null == animalVariety ? _self.animalVariety : animalVariety // ignore: cast_nullable_to_non_nullable
as String,animalSex: null == animalSex ? _self.animalSex : animalSex // ignore: cast_nullable_to_non_nullable
as String,animalBodytype: null == animalBodytype ? _self.animalBodytype : animalBodytype // ignore: cast_nullable_to_non_nullable
as String,animalColour: null == animalColour ? _self.animalColour : animalColour // ignore: cast_nullable_to_non_nullable
as String,animalAge: null == animalAge ? _self.animalAge : animalAge // ignore: cast_nullable_to_non_nullable
as String,animalSterilization: null == animalSterilization ? _self.animalSterilization : animalSterilization // ignore: cast_nullable_to_non_nullable
as String,animalBacterin: null == animalBacterin ? _self.animalBacterin : animalBacterin // ignore: cast_nullable_to_non_nullable
as String,animalFoundplace: null == animalFoundplace ? _self.animalFoundplace : animalFoundplace // ignore: cast_nullable_to_non_nullable
as String,animalStatus: null == animalStatus ? _self.animalStatus : animalStatus // ignore: cast_nullable_to_non_nullable
as String,animalOpendate: null == animalOpendate ? _self.animalOpendate : animalOpendate // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,imagePath: null == imagePath ? _self.imagePath : imagePath // ignore: cast_nullable_to_non_nullable
as String,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String,shelterId: null == shelterId ? _self.shelterId : shelterId // ignore: cast_nullable_to_non_nullable
as String,shelterName: null == shelterName ? _self.shelterName : shelterName // ignore: cast_nullable_to_non_nullable
as String,shelterAddress: null == shelterAddress ? _self.shelterAddress : shelterAddress // ignore: cast_nullable_to_non_nullable
as String,shelterTel: null == shelterTel ? _self.shelterTel : shelterTel // ignore: cast_nullable_to_non_nullable
as String,breed: null == breed ? _self.breed : breed // ignore: cast_nullable_to_non_nullable
as String,color: null == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as String,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as String,ageLabel: null == ageLabel ? _self.ageLabel : ageLabel // ignore: cast_nullable_to_non_nullable
as String,genderLabel: null == genderLabel ? _self.genderLabel : genderLabel // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as AnimalType,tags: null == tags ? _self._tags : tags // ignore: cast_nullable_to_non_nullable
as List<AnimalTag>,isFavorite: null == isFavorite ? _self.isFavorite : isFavorite // ignore: cast_nullable_to_non_nullable
as bool,isAdopted: null == isAdopted ? _self.isAdopted : isAdopted // ignore: cast_nullable_to_non_nullable
as bool,isNeutered: null == isNeutered ? _self.isNeutered : isNeutered // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
