class AnimalApiResponse {
  const AnimalApiResponse({
    required this.animalId,
    required this.animalSubid,
    required this.animalAreaPkid,
    required this.animalShelterPkid,
    required this.animalPlace,
    required this.animalKind,
    required this.animalVariety,
    required this.animalSex,
    required this.animalBodytype,
    required this.animalColour,
    required this.animalAge,
    required this.animalSterilization,
    required this.animalBacterin,
    required this.animalFoundplace,
    required this.animalStatus,
    required this.animalOpendate,
    required this.animalTitle,
    required this.albumFile,
    required this.shelterName,
    required this.shelterAddress,
    required this.shelterTel,
  });

  factory AnimalApiResponse.fromJson(Map<String, dynamic> json) {
    return AnimalApiResponse(
      animalId: _asString(json['animal_id']),
      animalSubid: _asString(json['animal_subid']),
      animalAreaPkid: _asInt(json['animal_area_pkid']),
      animalShelterPkid: _asInt(json['animal_shelter_pkid']),
      animalPlace: _asString(json['animal_place']),
      animalKind: _asString(json['animal_kind']),
      animalVariety: _asString(json['animal_Variety']),
      animalSex: _asString(json['animal_sex']),
      animalBodytype: _asString(json['animal_bodytype']),
      animalColour: _asString(json['animal_colour']),
      animalAge: _asString(json['animal_age']),
      animalSterilization: _asString(json['animal_sterilization']),
      animalBacterin: _asString(json['animal_bacterin']),
      animalFoundplace: _asString(json['animal_foundplace']),
      animalStatus: _asString(json['animal_status']),
      animalOpendate: _asString(json['animal_opendate']),
      animalTitle: _asString(json['animal_title']),
      albumFile: _asString(json['album_file']),
      shelterName: _asString(json['shelter_name']),
      shelterAddress: _asString(json['shelter_address']),
      shelterTel: _asString(json['shelter_tel']),
    );
  }

  final String animalId;
  final String animalSubid;
  final int animalAreaPkid;
  final int animalShelterPkid;
  final String animalPlace;
  final String animalKind;
  final String animalVariety;
  final String animalSex;
  final String animalBodytype;
  final String animalColour;
  final String animalAge;
  final String animalSterilization;
  final String animalBacterin;
  final String animalFoundplace;
  final String animalStatus;
  final String animalOpendate;
  final String animalTitle;
  final String albumFile;
  final String shelterName;
  final String shelterAddress;
  final String shelterTel;
}

String _asString(dynamic value) => value?.toString() ?? '';

int _asInt(dynamic value) {
  if (value is int) {
    return value;
  }
  return int.tryParse(value?.toString() ?? '') ?? 0;
}
