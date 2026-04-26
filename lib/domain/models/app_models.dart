import 'package:flutter/material.dart';

enum AnimalType { dog, cat, other }

enum FavoriteFilter { all, dogs, cats, adopted }

extension AnimalTypeX on AnimalType {
  String get label {
    switch (this) {
      case AnimalType.dog:
        return '狗狗';
      case AnimalType.cat:
        return '貓咪';
      case AnimalType.other:
        return '其他';
    }
  }
}

extension FavoriteFilterX on FavoriteFilter {
  String get label {
    switch (this) {
      case FavoriteFilter.all:
        return '全部';
      case FavoriteFilter.dogs:
        return '狗狗';
      case FavoriteFilter.cats:
        return '貓咪';
      case FavoriteFilter.adopted:
        return '已送養';
    }
  }
}

class AnimalTag {
  const AnimalTag(this.label, this.color);

  final String label;
  final Color color;
}

class Animal {
  const Animal({
    required this.id,
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
    required this.name,
    required this.imagePath,
    required this.location,
    required this.shelterId,
    required this.shelterName,
    required this.shelterAddress,
    required this.shelterTel,
    required this.breed,
    required this.color,
    required this.size,
    required this.ageLabel,
    required this.genderLabel,
    required this.type,
    required this.tags,
    this.isFavorite = false,
    this.isAdopted = false,
    this.isNeutered = false,
  });

  final String id;
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
  final String name;
  final String imagePath;
  final String location;
  final String shelterId;
  final String shelterName;
  final String shelterAddress;
  final String shelterTel;
  final String breed;
  final String color;
  final String size;
  final String ageLabel;
  final String genderLabel;
  final AnimalType type;
  final List<AnimalTag> tags;
  final bool isFavorite;
  final bool isAdopted;
  final bool isNeutered;

  Animal copyWith({bool? isFavorite, bool? isAdopted}) {
    return Animal(
      id: id,
      animalId: animalId,
      animalSubid: animalSubid,
      animalAreaPkid: animalAreaPkid,
      animalShelterPkid: animalShelterPkid,
      animalPlace: animalPlace,
      animalKind: animalKind,
      animalVariety: animalVariety,
      animalSex: animalSex,
      animalBodytype: animalBodytype,
      animalColour: animalColour,
      animalAge: animalAge,
      animalSterilization: animalSterilization,
      animalBacterin: animalBacterin,
      animalFoundplace: animalFoundplace,
      animalStatus: animalStatus,
      animalOpendate: animalOpendate,
      name: name,
      imagePath: imagePath,
      location: location,
      shelterId: shelterId,
      shelterName: shelterName,
      shelterAddress: shelterAddress,
      shelterTel: shelterTel,
      breed: breed,
      color: color,
      size: size,
      ageLabel: ageLabel,
      genderLabel: genderLabel,
      type: type,
      tags: tags,
      isFavorite: isFavorite ?? this.isFavorite,
      isAdopted: isAdopted ?? this.isAdopted,
      isNeutered: isNeutered,
    );
  }
}

class Shelter {
  const Shelter({
    required this.id,
    required this.shelterPkid,
    required this.name,
    required this.imagePath,
    required this.address,
    required this.phone,
    required this.distance,
    required this.capacity,
    required this.openingHours,
  });

  final String id;
  final int shelterPkid;
  final String name;
  final String imagePath;
  final String address;
  final String phone;
  final String distance;
  final String capacity;
  final String openingHours;
}

class NoticeItem {
  const NoticeItem({
    required this.id,
    required this.title,
    required this.message,
    required this.time,
    required this.icon,
    required this.color,
  });

  final String id;
  final String title;
  final String message;
  final String time;
  final IconData icon;
  final Color color;
}

class HomeCategory {
  const HomeCategory({
    required this.label,
    required this.icon,
    required this.background,
    required this.foreground,
  });

  final String label;
  final IconData icon;
  final Color background;
  final Color foreground;
}

class AnimalSearchParams {
  const AnimalSearchParams({
    required this.animalAreaPkid,
    required this.animalShelterPkid,
    required this.animalKind,
    required this.animalVariety,
    required this.animalSex,
    required this.animalBodytype,
    required this.animalColour,
    required this.animalAge,
    required this.animalSterilization,
    required this.animalBacterin,
    required this.animalStatus,
  });

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

  final int animalAreaPkid;
  final int animalShelterPkid;
  final String animalKind;
  final String animalVariety;
  final String animalSex;
  final String animalBodytype;
  final String animalColour;
  final String animalAge;
  final String animalSterilization;
  final String animalBacterin;
  final String animalStatus;

  AnimalSearchParams copyWith({
    int? animalAreaPkid,
    int? animalShelterPkid,
    String? animalKind,
    String? animalVariety,
    String? animalSex,
    String? animalBodytype,
    String? animalColour,
    String? animalAge,
    String? animalSterilization,
    String? animalBacterin,
    String? animalStatus,
  }) {
    return AnimalSearchParams(
      animalAreaPkid: animalAreaPkid ?? this.animalAreaPkid,
      animalShelterPkid: animalShelterPkid ?? this.animalShelterPkid,
      animalKind: animalKind ?? this.animalKind,
      animalVariety: animalVariety ?? this.animalVariety,
      animalSex: animalSex ?? this.animalSex,
      animalBodytype: animalBodytype ?? this.animalBodytype,
      animalColour: animalColour ?? this.animalColour,
      animalAge: animalAge ?? this.animalAge,
      animalSterilization: animalSterilization ?? this.animalSterilization,
      animalBacterin: animalBacterin ?? this.animalBacterin,
      animalStatus: animalStatus ?? this.animalStatus,
    );
  }

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
