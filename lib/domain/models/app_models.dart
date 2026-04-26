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
    final params = <String, dynamic>{
      r'$top': top,
      r'$skip': skip,
    };

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

class LookupOption {
  const LookupOption({
    required this.code,
    required this.label,
    this.countyCode,
  });

  final int code;
  final String label;
  final int? countyCode;
}

const countyOptions = <LookupOption>[
  LookupOption(code: 2, label: '台北市'),
  LookupOption(code: 3, label: '新北市'),
  LookupOption(code: 4, label: '基隆市'),
  LookupOption(code: 5, label: '宜蘭縣'),
  LookupOption(code: 6, label: '桃園縣'),
  LookupOption(code: 7, label: '新竹縣'),
  LookupOption(code: 8, label: '新竹市'),
  LookupOption(code: 9, label: '苗栗縣'),
  LookupOption(code: 10, label: '台中市'),
  LookupOption(code: 11, label: '彰化縣'),
  LookupOption(code: 12, label: '南投縣'),
  LookupOption(code: 13, label: '雲林縣'),
  LookupOption(code: 14, label: '嘉義縣'),
  LookupOption(code: 15, label: '嘉義市'),
  LookupOption(code: 16, label: '台南市'),
  LookupOption(code: 17, label: '高雄市'),
  LookupOption(code: 18, label: '屏東縣'),
  LookupOption(code: 19, label: '花蓮縣'),
  LookupOption(code: 20, label: '台東縣'),
  LookupOption(code: 21, label: '澎湖縣'),
  LookupOption(code: 22, label: '金門縣'),
  LookupOption(code: 23, label: '連江縣'),
];

const shelterOptions = <LookupOption>[
  LookupOption(code: 48, label: '基隆市寵物銀行', countyCode: 4),
  LookupOption(code: 49, label: '台北市動物之家', countyCode: 2),
  LookupOption(code: 50, label: '新北市板橋區公立動物之家', countyCode: 3),
  LookupOption(code: 51, label: '新北市新店區公立動物之家', countyCode: 3),
  LookupOption(code: 53, label: '新北市中和區公立動物之家', countyCode: 3),
  LookupOption(code: 55, label: '新北市淡水區公立動物之家', countyCode: 3),
  LookupOption(code: 56, label: '新北市瑞芳區公立動物之家', countyCode: 3),
  LookupOption(code: 58, label: '新北市五股區公立動物之家', countyCode: 3),
  LookupOption(code: 59, label: '新北市八里區公立動物之家', countyCode: 3),
  LookupOption(code: 60, label: '新北市三芝區公立動物之家', countyCode: 3),
  LookupOption(code: 61, label: '桃園市動物保護教育園區', countyCode: 6),
  LookupOption(code: 62, label: '新竹市動物收容所', countyCode: 8),
  LookupOption(code: 63, label: '新竹縣動物收容所', countyCode: 7),
  LookupOption(code: 67, label: '台中市動物之家南屯園區', countyCode: 10),
  LookupOption(code: 68, label: '台中市動物之家后里園區', countyCode: 10),
  LookupOption(code: 69, label: '彰化縣流浪狗中途之家', countyCode: 11),
  LookupOption(code: 70, label: '南投縣公立動物收容所', countyCode: 12),
  LookupOption(code: 71, label: '嘉義市流浪犬收容中心', countyCode: 15),
  LookupOption(code: 72, label: '嘉義縣流浪犬中途之家', countyCode: 14),
  LookupOption(code: 73, label: '台南市動物之家灣裡站', countyCode: 16),
  LookupOption(code: 74, label: '台南市動物之家善化站', countyCode: 16),
  LookupOption(code: 75, label: '高雄市壽山動物保護教育園區', countyCode: 17),
  LookupOption(code: 76, label: '高雄市燕巢動物保護關愛園區', countyCode: 17),
  LookupOption(code: 77, label: '屏東縣流浪動物收容所', countyCode: 18),
  LookupOption(code: 78, label: '宜蘭縣流浪動物中途之家', countyCode: 5),
  LookupOption(code: 79, label: '花蓮縣流浪犬中途之家', countyCode: 19),
  LookupOption(code: 80, label: '台東縣動物收容中心', countyCode: 20),
  LookupOption(code: 81, label: '連江縣流浪犬收容中心', countyCode: 23),
  LookupOption(code: 82, label: '金門縣動物收容中心', countyCode: 22),
  LookupOption(code: 83, label: '澎湖縣流浪動物收容中心', countyCode: 21),
  LookupOption(code: 89, label: '雲林縣流浪動物收容所', countyCode: 13),
  LookupOption(code: 92, label: '新北市政府動物保護防疫處', countyCode: 3),
  LookupOption(code: 96, label: '苗栗縣生態保育教育中心', countyCode: 9),
];

String countyLabelForCode(int code) {
  for (final option in countyOptions) {
    if (option.code == code) {
      return option.label;
    }
  }
  return code.toString();
}

String shelterLabelForCode(int code) {
  for (final option in shelterOptions) {
    if (option.code == code) {
      return option.label;
    }
  }
  return code.toString();
}

List<LookupOption> sheltersForCountyCode(int countyCode) {
  return shelterOptions
      .where((option) => option.countyCode == countyCode)
      .toList(growable: false);
}

typedef SearchFilters = AnimalSearchParams;
