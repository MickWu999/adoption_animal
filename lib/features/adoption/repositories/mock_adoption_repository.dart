import 'package:flutter/material.dart';

import '../../../../core/theme/adoption_theme.dart';
import '../models/app_models.dart';
import 'adoption_repository.dart';

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
        background: Color(0xFFF1E4D7),
        foreground: AdoptionColors.primary,
      ),
      HomeCategory(
        label: '已絕育',
        icon: Icons.favorite_rounded,
        background: Color(0xFFF0E2D5),
        foreground: AdoptionColors.primaryStrong,
      ),
    ];
  }

  @override
  List<Animal> getAnimals() => const [];

  @override
  Future<AnimalPage> fetchAnimals(
    AnimalSearchParams searchParams, {
    int top = 1000,
    int skip = 0,
  }) async =>
      const AnimalPage(items: [], hasMore: false);

  @override
  List<Shelter> buildShelters(List<Animal> animals) => const [];

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
        color: AdoptionColors.danger,
      ),
      NoticeItem(
        id: 'n3',
        title: '認養成功',
        message: '你追蹤的「小雪」已找到新家。',
        time: '昨天 18:30',
        icon: Icons.celebration_rounded,
        color: AdoptionColors.primary,
      ),
    ];
  }
}
