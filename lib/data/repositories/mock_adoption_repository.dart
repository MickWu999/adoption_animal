import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../domain/models/app_models.dart';
import '../mappers/animal_api_mapper.dart';
import '../models/animal_api_query_params.dart';

abstract class AdoptionRepository {
  // Supabase 接點 4:
  // 新增 Supabase repository 時，優先維持這個介面不變，
  // 這樣 presentation layer 不需要跟著調整。
  List<HomeCategory> getHomeCategories();
  List<Animal> getAnimals();
  Future<AnimalPage> fetchAnimals(AnimalApiQueryParams params);
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
  Future<AnimalPage> fetchAnimals(AnimalApiQueryParams params) async =>
      const AnimalPage(items: [], hasMore: false);

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
    : _dio =
          dio ??
          Dio(
            BaseOptions(
              baseUrl: 'https://data.moa.gov.tw/Service/OpenData',
              connectTimeout: const Duration(seconds: 12),
              receiveTimeout: const Duration(seconds: 20),
            ),
          );

  final Dio _dio;

  @override
  Future<AnimalPage> fetchAnimals(AnimalApiQueryParams params) async {
    // Supabase 接點 5:
    // 目前這裡是 REST API 呼叫；之後可直接改成 Supabase select/range/filter。
    // 建議保留回傳 AnimalPage，讓 lazy load 與 hasMore 判斷不用重寫。
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

    final animals = items
        .whereType<Map<String, dynamic>>()
        .map(AnimalApiMapper.fromJson)
        .toList(growable: false);

    // Supabase 接點 6:
    // 若使用 Supabase，可在查詢結果數量或 count 的基礎上決定 hasMore。
    return AnimalPage(items: animals, hasMore: animals.length >= params.top);
  }

  @override
  List<Shelter> getShelters() => const [];
}
