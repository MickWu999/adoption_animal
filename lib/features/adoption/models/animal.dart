import 'package:freezed_annotation/freezed_annotation.dart';

import 'animal_enums.dart';
import 'animal_tag.dart';

part 'animal.freezed.dart';

@freezed
sealed class Animal with _$Animal {
  const factory Animal({
    required String id,
    required String animalId,
    required String animalSubid,
    required int animalAreaPkid,
    required int animalShelterPkid,
    required String animalPlace,
    required String animalKind,
    required String animalVariety,
    required String animalSex,
    required String animalBodytype,
    required String animalColour,
    required String animalAge,
    required String animalSterilization,
    required String animalBacterin,
    required String animalFoundplace,
    required String animalStatus,
    required String animalOpendate,
    required String name,
    required String imagePath,
    required String location,
    required String shelterId,
    required String shelterName,
    required String shelterAddress,
    required String shelterTel,
    required String breed,
    required String color,
    required String size,
    required String ageLabel,
    required String genderLabel,
    required AnimalType type,
    required List<AnimalTag> tags,
    @Default(false) bool isFavorite,
    @Default(false) bool isAdopted,
    @Default(false) bool isNeutered,
  }) = _Animal;
}
