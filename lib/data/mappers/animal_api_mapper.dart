import '../../core/lookups/adoption_lookups.dart';
import '../../domain/models/app_models.dart';

class AnimalApiMapper {
  const AnimalApiMapper();

  static Animal fromJson(Map<String, dynamic> json) {
    // Supabase 接點 9:
    // 這裡負責把資料來源的原始欄位轉成 app 內部使用的 Animal model。
    // 若 Supabase 欄位命名不同，優先調整這層或另外新增 Supabase mapper。
    final animalAreaPkid = _asInt(json['animal_area_pkid']);
    final animalShelterPkid = _asInt(json['animal_shelter_pkid']);
    final animalKind = _asString(json['animal_kind']);
    final animalVariety = _asString(json['animal_Variety']);
    final animalSex = _asString(json['animal_sex']);
    final animalBodytype = _asString(json['animal_bodytype']);
    final animalColour = _asString(json['animal_colour']);
    final animalAge = _asString(json['animal_age']);
    final animalSterilization = _asString(json['animal_sterilization']);
    final animalBacterin = _asString(json['animal_bacterin']);
    final animalStatus = _asString(json['animal_status']);
    final animalTitle = _asString(json['animal_title']);
    final albumFile = _asString(json['album_file']);
    final shelterName = _asString(json['shelter_name']);
    final shelterAddress = _asString(json['shelter_address']);
    final shelterTel = _asString(json['shelter_tel']);
    final animalCode = _asString(json['animal_id']);

    final name = animalTitle.isNotEmpty
        ? animalTitle
        : animalVariety.isNotEmpty
        ? animalVariety
        : _asString(json['animal_subid']);
    final location = _asString(json['animal_place']).isNotEmpty
        ? _asString(json['animal_place'])
        : countyLabelForCode(animalAreaPkid);
    final shelterId = animalShelterPkid == 0
        ? 'remote-$animalAreaPkid'
        : animalShelterPkid.toString();
    final imagePath = albumFile;
    final type = animalKind == '貓'
        ? AnimalType.cat
        : animalKind == '狗'
        ? AnimalType.dog
        : AnimalType.other;

    return Animal(
      id: '$animalCode-$animalShelterPkid',
      animalId: animalCode,
      animalSubid: _asString(json['animal_subid']),
      animalAreaPkid: animalAreaPkid,
      animalShelterPkid: animalShelterPkid,
      animalPlace: _asString(json['animal_place']),
      animalKind: animalKind,
      animalVariety: animalVariety,
      animalSex: animalSex,
      animalBodytype: animalBodytype,
      animalColour: animalColour,
      animalAge: animalAge,
      animalSterilization: animalSterilization,
      animalBacterin: animalBacterin,
      animalFoundplace: _asString(json['animal_foundplace']),
      animalStatus: animalStatus,
      animalOpendate: _asString(json['animal_opendate']),
      name: name,
      imagePath: imagePath,
      location: location,
      shelterId: shelterId,
      shelterName: shelterName,
      shelterAddress: shelterAddress,
      shelterTel: shelterTel,
      breed: animalVariety,
      color: animalColour,
      size: _displayBodytype(animalBodytype),
      ageLabel: _displayAge(animalAge),
      genderLabel: _displaySex(animalSex),
      type: type,
      tags: const [],
    );
  }

  static List<Shelter> sheltersFromAnimals(List<Animal> animals) {
    // Supabase 接點 10:
    // 如果之後 shelter 也改成獨立資料表，這段可以改成直接由 shelter query 建立 model，
    // 不一定要再從 animal 清單反推。
    final sheltersById = <String, Shelter>{};
    for (final animal in animals) {
      final key = animal.animalShelterPkid != 0
          ? animal.animalShelterPkid.toString()
          : animal.shelterId;
      if (sheltersById.containsKey(key)) {
        continue;
      }
      sheltersById[key] = Shelter(
        id: key,
        shelterPkid: animal.animalShelterPkid,
        name: animal.shelterName,
        imagePath: 'assets/images/shaltar/sheltar.jpg',
        address: animal.shelterAddress,
        phone: animal.shelterTel,
        distance: '',
        capacity: '',
        openingHours: '',
      );
    }
    return sheltersById.values.toList(growable: false);
  }

  static String _asString(dynamic value) => value?.toString() ?? '';

  static int _asInt(dynamic value) {
    if (value is int) {
      return value;
    }
    return int.tryParse(value?.toString() ?? '') ?? 0;
  }

  static String _displaySex(String value) {
    switch (value) {
      case 'M':
        return '公';
      case 'F':
        return '母';
      case 'N':
        return '不詳';
      default:
        return value;
    }
  }

  static String _displayBodytype(String value) {
    switch (value) {
      case 'SMALL':
        return '小型';
      case 'MEDIUM':
        return '中型';
      case 'BIG':
        return '大型';
      default:
        return value;
    }
  }

  static String _displayAge(String value) {
    switch (value) {
      case 'CHILD':
        return '幼年';
      case 'ADULT':
        return '成年';
      default:
        return value;
    }
  }
}
