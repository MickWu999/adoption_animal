import '../models/app_models.dart';
import 'animal_api_mapper.dart';

class SupabaseAdoptionMapper {
  const SupabaseAdoptionMapper._();

  static Animal animalFromRow(Map<String, dynamic> row) {
    final shelter = _shelterMapFromRow(row['shelter']);
    final animalKind = _string(row['animal_kind']);
    final animalVariety = _string(row['animal_variety']);
    final animalSex = _string(row['animal_sex']);
    final animalBodytype = _string(row['animal_bodytype']);
    final animalColour = _string(row['animal_colour']);
    final animalAge = _string(row['animal_age']);
    final shelterId =
        _string(row['shelter_id']).isNotEmpty
            ? _string(row['shelter_id'])
            : _int(row['animal_shelter_pkid']).toString();
    final shelterName =
        _string(shelter?['name']).isNotEmpty
            ? _string(shelter?['name'])
            : _string(row['shelter_name_snapshot']);
    final shelterAddress =
        _string(shelter?['address']).isNotEmpty
            ? _string(shelter?['address'])
            : _string(row['shelter_address_snapshot']);
    final shelterPhone =
        _string(shelter?['phone']).isNotEmpty
            ? _string(shelter?['phone'])
            : _string(row['shelter_tel_snapshot']);
    final title = _string(row['animal_title']);
    final name =
        title.isNotEmpty
            ? title
            : animalVariety.isNotEmpty
            ? animalVariety
            : _string(row['animal_subid']);

    return Animal(
      id: _string(row['id']),
      animalId: _string(row['animal_id']),
      animalSubid: _string(row['animal_subid']),
      animalAreaPkid: _int(row['animal_area_pkid']),
      animalShelterPkid: _int(row['animal_shelter_pkid']),
      animalPlace: _string(row['animal_place']),
      animalKind: animalKind,
      animalVariety: animalVariety,
      animalSex: animalSex,
      animalBodytype: animalBodytype,
      animalColour: animalColour,
      animalAge: animalAge,
      animalSterilization: _string(row['animal_sterilization']),
      animalBacterin: _string(row['animal_bacterin']),
      animalFoundplace: _string(row['animal_foundplace']),
      animalStatus: _string(row['animal_status']),
      animalOpendate: _string(row['animal_opendate']),
      name: name,
      imagePath: _string(row['album_file']),
      location: _string(row['animal_place']),
      shelterId: shelterId,
      shelterName: shelterName,
      shelterAddress: shelterAddress,
      shelterTel: shelterPhone,
      breed: animalVariety,
      color: animalColour,
      size: _displayBodytype(animalBodytype),
      ageLabel: _displayAge(animalAge),
      genderLabel: _displaySex(animalSex),
      type: _typeFromKind(animalKind),
      tags: const [],
      isFavorite: _int(row['favorite_count']) > 0,
      isAdopted: _string(row['availability_status']) == 'left_shelter',
      isNeutered: _string(row['animal_sterilization']) == 'T',
    );
  }

  static Shelter? shelterFromAnimalRow(Map<String, dynamic> row) {
    final shelter = _shelterMapFromRow(row['shelter']);
    if (shelter == null) {
      return null;
    }
    return shelterFromShelterRow(shelter);
  }

  static Shelter shelterFromShelterRow(Map<String, dynamic> row) {
    return Shelter(
      id: _string(row['id']),
      shelterPkid: 0,
      name: _string(row['name']),
      imagePath: _string(row['image_url']).isNotEmpty
          ? _string(row['image_url'])
          : 'assets/images/shaltar/sheltar.jpg',
      address: _string(row['address']),
      phone: _string(row['phone']),
      distance: '',
      capacity: '',
      openingHours: _string(row['opening_time']),
    );
  }

  static List<Shelter> mergedSheltersFromAnimals(List<Animal> animals) {
    return AnimalApiMapper.sheltersFromAnimals(animals);
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

  static AnimalType _typeFromKind(String animalKind) {
    switch (animalKind) {
      case '貓':
        return AnimalType.cat;
      case '狗':
        return AnimalType.dog;
      default:
        return AnimalType.other;
    }
  }

  static Map<String, dynamic>? _shelterMapFromRow(dynamic value) {
    if (value is Map<String, dynamic>) {
      return value;
    }
    if (value is Map) {
      return value.map(
        (key, entry) => MapEntry(key.toString(), entry),
      );
    }
    return null;
  }

  static String _string(dynamic value) => value?.toString() ?? '';

  static int _int(dynamic value) {
    if (value is int) {
      return value;
    }
    return int.tryParse(value?.toString() ?? '') ?? 0;
  }
}
