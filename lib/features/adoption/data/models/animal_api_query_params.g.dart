// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'animal_api_query_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AnimalApiQueryParams _$AnimalApiQueryParamsFromJson(
  Map<String, dynamic> json,
) => _AnimalApiQueryParams(
  top: (json[r'$top'] as num?)?.toInt() ?? 1000,
  skip: (json[r'$skip'] as num?)?.toInt() ?? 0,
  animalId: json['animal_id'] as String? ?? '',
  animalSubid: json['animal_subid'] as String? ?? '',
  animalAreaPkid: (json['animal_area_pkid'] as num?)?.toInt() ?? 0,
  animalShelterPkid: (json['animal_shelter_pkid'] as num?)?.toInt() ?? 0,
  animalPlace: json['animal_place'] as String? ?? '',
  animalKind: json['animal_kind'] as String? ?? '',
  animalVariety: json['animal_Variety'] as String? ?? '',
  animalSex: json['animal_sex'] as String? ?? '',
  animalBodytype: json['animal_bodytype'] as String? ?? '',
  animalColour: json['animal_colour'] as String? ?? '',
  animalAge: json['animal_age'] as String? ?? '',
  animalSterilization: json['animal_sterilization'] as String? ?? '',
  animalBacterin: json['animal_bacterin'] as String? ?? '',
  animalFoundplace: json['animal_foundplace'] as String? ?? '',
  animalStatus: json['animal_status'] as String? ?? '',
  animalOpendate: json['animal_opendate'] as String? ?? '',
  shelterName: json['shelter_name'] as String? ?? '',
);

Map<String, dynamic> _$AnimalApiQueryParamsToJson(
  _AnimalApiQueryParams instance,
) => <String, dynamic>{
  r'$top': instance.top,
  r'$skip': instance.skip,
  'animal_id': instance.animalId,
  'animal_subid': instance.animalSubid,
  'animal_area_pkid': instance.animalAreaPkid,
  'animal_shelter_pkid': instance.animalShelterPkid,
  'animal_place': instance.animalPlace,
  'animal_kind': instance.animalKind,
  'animal_Variety': instance.animalVariety,
  'animal_sex': instance.animalSex,
  'animal_bodytype': instance.animalBodytype,
  'animal_colour': instance.animalColour,
  'animal_age': instance.animalAge,
  'animal_sterilization': instance.animalSterilization,
  'animal_bacterin': instance.animalBacterin,
  'animal_foundplace': instance.animalFoundplace,
  'animal_status': instance.animalStatus,
  'animal_opendate': instance.animalOpendate,
  'shelter_name': instance.shelterName,
};
