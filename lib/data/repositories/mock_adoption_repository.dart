import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

import '../../domain/models/app_models.dart';

abstract class AdoptionRepository {
  List<HomeCategory> getHomeCategories();
  List<Animal> getAnimals();
  Future<List<Animal>> fetchAnimals(AnimalApiQueryParams params);
  List<Shelter> getShelters();
  List<NoticeItem> getNotifications();
}

class MockAdoptionRepository implements AdoptionRepository {
  const MockAdoptionRepository();

  @override
  List<HomeCategory> getHomeCategories() {
    return const [
      HomeCategory(
        label: '狗狗',
        icon: Icons.pets_rounded,
        background: Color(0xFFFFE4C6),
        foreground: Color(0xFFB56B1B),
      ),
      HomeCategory(
        label: '貓咪',
        icon: Icons.cruelty_free_rounded,
        background: Color(0xFFFFE9B9),
        foreground: Color(0xFFC38A08),
      ),
      HomeCategory(
        label: '幼年',
        icon: Icons.face_4_rounded,
        background: Color(0xFFFFD7C7),
        foreground: Color(0xFFC26A4B),
      ),
      HomeCategory(
        label: '附近',
        icon: Icons.near_me_rounded,
        background: Color(0xFFE3F1CC),
        foreground: Color(0xFF4F8A3F),
      ),
      HomeCategory(
        label: '已絕育',
        icon: Icons.favorite_rounded,
        background: Color(0xFFDFF0DD),
        foreground: Color(0xFF4F8A3F),
      ),
    ];
  }

  @override
  List<Animal> getAnimals() {
    return const [];
  }

  @override
  Future<List<Animal>> fetchAnimals(AnimalApiQueryParams params) async {
    return const [];
  }

  @override
  List<Shelter> getShelters() {
    return const [];
  }

  @override
  List<NoticeItem> getNotifications() {
    return const [
      NoticeItem(
        id: 'n1',
        title: '新毛孩上架',
        message: '台南市新增 2 隻幼犬可認養，快來看看。',
        time: '2 分鐘前',
        icon: Icons.pets_rounded,
        color: Color(0xFFF2B544),
      ),
      NoticeItem(
        id: 'n2',
        title: '收藏更新',
        message: '你收藏的「小黑」狀態更新為：已施打疫苗。',
        time: '1 小時前',
        icon: Icons.favorite_rounded,
        color: Color(0xFFE35D4F),
      ),
      NoticeItem(
        id: 'n3',
        title: '認養成功',
        message: '你追蹤的「小雪」已找到新家。',
        time: '昨天 18:30',
        icon: Icons.celebration_rounded,
        color: Color(0xFF4F8A3F),
      ),
    ];
  }
}

class RemoteAdoptionRepository extends MockAdoptionRepository {
  RemoteAdoptionRepository({Dio? dio})
    : _dio = dio ??
          Dio(
            BaseOptions(
              baseUrl: 'https://data.moa.gov.tw/Service/OpenData',
              connectTimeout: const Duration(seconds: 12),
              receiveTimeout: const Duration(seconds: 20),
            ),
          );

  final Dio _dio;

  @override
  Future<List<Animal>> fetchAnimals(AnimalApiQueryParams params) async {
    final response = await _dio.get(
      '/TransService.aspx',
      queryParameters: {
        'UnitId': 'QcbUEzN6E6DL',
        ...params.toQueryParameters(),
      },
    );

    final raw = response.data;
    final payload = raw is String ? jsonDecode(raw) : raw;
    final items = payload is List
        ? payload
        : payload is Map<String, dynamic>
            ? (payload['Data'] ??
                    payload['data'] ??
                    payload['result'] ??
                    const <dynamic>[])
                as List<dynamic>
            : const <dynamic>[];

    return items
        .whereType<Map<String, dynamic>>()
        .map(_animalFromApiJson)
        .toList(growable: false);
  }

  @override
  List<Shelter> getShelters() => const [];
}

Animal _animalFromApiJson(Map<String, dynamic> json) {
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
  final imagePath = albumFile.isNotEmpty
      ? albumFile
      : 'assets/images/others_animals/melissa-keizer-X-0FisCRIaA-unsplash.jpg';
  final type = animalKind == '貓'
      ? AnimalType.cat
      : animalKind == '狗'
      ? AnimalType.dog
      : AnimalType.other;
  final size = _displayBodytype(animalBodytype);
  final ageLabel = _displayAge(animalAge);
  final genderLabel = _displaySex(animalSex);

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
    size: size,
    ageLabel: ageLabel,
    genderLabel: genderLabel,
    type: type,
    tags: const [],
  );
}

String _asString(dynamic value) => value?.toString() ?? '';

int _asInt(dynamic value) {
  if (value is int) {
    return value;
  }
  return int.tryParse(value?.toString() ?? '') ?? 0;
}

String _displaySex(String value) {
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

String _displayBodytype(String value) {
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

String _displayAge(String value) {
  switch (value) {
    case 'CHILD':
      return '幼年';
    case 'ADULT':
      return '成年';
    default:
      return value;
  }
}
