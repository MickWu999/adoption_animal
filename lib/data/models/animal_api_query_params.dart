import '../../domain/models/app_models.dart';

class AnimalApiQueryParams {
  const AnimalApiQueryParams({
    this.top = 1000,
    this.skip = 0,
    this.animalId = '',
    this.animalSubid = '',
    this.animalAreaPkid = 0,
    this.animalShelterPkid = 0,
    this.animalPlace = '',
    this.animalKind = '',
    this.animalVariety = '',
    this.animalSex = '',
    this.animalBodytype = '',
    this.animalColour = '',
    this.animalAge = '',
    this.animalSterilization = '',
    this.animalBacterin = '',
    this.animalFoundplace = '',
    this.animalStatus = '',
    this.animalOpendate = '',
    this.shelterName = '',
  });

  factory AnimalApiQueryParams.fromSearchParams(
    AnimalSearchParams searchParams, {
    int top = 1000,
    int skip = 0,
  }) {
    // Supabase 接點 7:
    // 這層是 UI 篩選條件與資料來源查詢條件的轉換點。
    // 若未來欄位名稱改成 Supabase schema，可優先在這裡或 repository 內統一映射。
    return AnimalApiQueryParams(
      top: top,
      skip: skip,
      animalAreaPkid: searchParams.animalAreaPkid,
      animalShelterPkid: searchParams.animalShelterPkid,
      animalKind: searchParams.animalKind,
      animalVariety: searchParams.animalVariety,
      animalSex: searchParams.animalSex,
      animalBodytype: searchParams.animalBodytype,
      animalColour: searchParams.animalColour,
      animalAge: searchParams.animalAge,
      animalSterilization: searchParams.animalSterilization,
      animalBacterin: searchParams.animalBacterin,
      animalStatus: searchParams.animalStatus,
    );
  }

  final int top;
  final int skip;
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
  final String shelterName;

  Map<String, dynamic> toQueryParameters() {
    // Supabase 接點 8:
    // 這個方法是給目前 REST API 用的。
    // 若切到 Supabase，通常不會再用 queryParameters，而是把這些欄位改成 query.where/eq/ilike/range。
    final params = <String, dynamic>{r'$top': top, r'$skip': skip};

    void putIfNotEmpty(String key, Object value) {
      if (value is String && value.isNotEmpty) {
        params[key] = value;
      } else if (value is int && value != 0) {
        params[key] = value;
      }
    }

    putIfNotEmpty('animal_id', animalId);
    putIfNotEmpty('animal_subid', animalSubid);
    putIfNotEmpty('animal_area_pkid', animalAreaPkid);
    putIfNotEmpty('animal_shelter_pkid', animalShelterPkid);
    putIfNotEmpty('animal_place', animalPlace);
    putIfNotEmpty('animal_kind', animalKind);
    putIfNotEmpty('animal_Variety', animalVariety);
    putIfNotEmpty('animal_sex', animalSex);
    putIfNotEmpty('animal_bodytype', animalBodytype);
    putIfNotEmpty('animal_colour', animalColour);
    putIfNotEmpty('animal_age', animalAge);
    putIfNotEmpty('animal_sterilization', animalSterilization);
    putIfNotEmpty('animal_bacterin', animalBacterin);
    putIfNotEmpty('animal_foundplace', animalFoundplace);
    putIfNotEmpty('animal_status', animalStatus);
    putIfNotEmpty('animal_opendate', animalOpendate);
    putIfNotEmpty('shelter_name', shelterName);
    return params;
  }
}
