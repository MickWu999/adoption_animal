import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../domain/models/app_models.dart';
import '../mappers/animal_api_mapper.dart';
import '../models/animal_api_query_params.dart';

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
  List<Animal> getAnimals() => const [];

  @override
  Future<List<Animal>> fetchAnimals(AnimalApiQueryParams params) async => const [];

  @override
  List<Shelter> getShelters() => const [];

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
        .map(AnimalApiMapper.fromJson)
        .toList(growable: false);
  }

  @override
  List<Shelter> getShelters() => const [];
}
