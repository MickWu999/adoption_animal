import 'package:freezed_annotation/freezed_annotation.dart';

part 'animal_search_params.freezed.dart';

@freezed
sealed class AnimalSearchParams with _$AnimalSearchParams {
  const AnimalSearchParams._();

  const factory AnimalSearchParams({
    required int animalAreaPkid,
    required int animalShelterPkid,
    required String animalKind,
    required String animalVariety,
    required String animalSex,
    required String animalBodytype,
    required String animalColour,
    required String animalAge,
    required String animalSterilization,
    required String animalBacterin,
    required String animalStatus,
  }) = _AnimalSearchParams;

  factory AnimalSearchParams.defaults() => const AnimalSearchParams(
    animalAreaPkid: 0,
    animalShelterPkid: 0,
    animalKind: '',
    animalVariety: '',
    animalSex: '',
    animalBodytype: '',
    animalColour: '',
    animalAge: '',
    animalSterilization: '',
    animalBacterin: '',
    animalStatus: '',
  );

  bool get hasAnyFilter =>
      animalAreaPkid != 0 ||
      animalShelterPkid != 0 ||
      animalKind.isNotEmpty ||
      animalVariety.isNotEmpty ||
      animalSex.isNotEmpty ||
      animalBodytype.isNotEmpty ||
      animalColour.isNotEmpty ||
      animalAge.isNotEmpty ||
      animalSterilization.isNotEmpty ||
      animalBacterin.isNotEmpty ||
      animalStatus.isNotEmpty;
}

typedef SearchFilters = AnimalSearchParams;
