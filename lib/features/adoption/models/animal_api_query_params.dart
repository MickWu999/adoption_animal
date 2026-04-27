import 'package:freezed_annotation/freezed_annotation.dart';

import 'app_models.dart';

part 'animal_api_query_params.freezed.dart';
part 'animal_api_query_params.g.dart';

@freezed
sealed class AnimalApiQueryParams with _$AnimalApiQueryParams {
  const AnimalApiQueryParams._();

  @JsonSerializable(includeIfNull: false)
  const factory AnimalApiQueryParams({
    @Default(1000) @JsonKey(name: r'$top') int top,
    @Default(0) @JsonKey(name: r'$skip') int skip,
    @Default('') @JsonKey(name: 'animal_id') String animalId,
    @Default('') @JsonKey(name: 'animal_subid') String animalSubid,
    @Default(0) @JsonKey(name: 'animal_area_pkid') int animalAreaPkid,
    @Default(0) @JsonKey(name: 'animal_shelter_pkid') int animalShelterPkid,
    @Default('') @JsonKey(name: 'animal_place') String animalPlace,
    @Default('') @JsonKey(name: 'animal_kind') String animalKind,
    @Default('') @JsonKey(name: 'animal_Variety') String animalVariety,
    @Default('') @JsonKey(name: 'animal_sex') String animalSex,
    @Default('') @JsonKey(name: 'animal_bodytype') String animalBodytype,
    @Default('') @JsonKey(name: 'animal_colour') String animalColour,
    @Default('') @JsonKey(name: 'animal_age') String animalAge,
    @Default('')
    @JsonKey(name: 'animal_sterilization')
    String animalSterilization,
    @Default('') @JsonKey(name: 'animal_bacterin') String animalBacterin,
    @Default('') @JsonKey(name: 'animal_foundplace') String animalFoundplace,
    @Default('') @JsonKey(name: 'animal_status') String animalStatus,
    @Default('') @JsonKey(name: 'animal_opendate') String animalOpendate,
    @Default('') @JsonKey(name: 'shelter_name') String shelterName,
  }) = _AnimalApiQueryParams;

  factory AnimalApiQueryParams.fromJson(Map<String, dynamic> json) =>
      _$AnimalApiQueryParamsFromJson(json);

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

  Map<String, dynamic> toQueryParameters() {
    // Supabase 接點 8:
    // 這個方法是給目前 REST API 用的。
    // 若切到 Supabase，通常不會再用 queryParameters，而是把這些欄位改成 query.where/eq/ilike/range。
    final params = Map<String, dynamic>.from(toJson());
    params.removeWhere((key, value) {
      if (value is String) {
        return value.isEmpty;
      }
      if (value is int) {
        return value == 0 && key != r'$top' && key != r'$skip';
      }
      return value == null;
    });

    return params;
  }
}
