import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../core/theme/adoption_theme.dart';
import '../models/app_models.dart';
import 'adoption_repository.dart';
import 'supabase_adoption_mapper.dart';

class SupabaseAdoptionRepository implements AdoptionRepository {
  SupabaseAdoptionRepository({required SupabaseClient client}) : _client = client;

  final SupabaseClient _client;
  final Map<String, Shelter> _cachedSheltersById = <String, Shelter>{};

  static const _animalSelect = '''
id,
animal_id,
animal_subid,
animal_area_pkid,
animal_shelter_pkid,
animal_place,
animal_kind,
animal_variety,
animal_sex,
animal_bodytype,
animal_colour,
animal_age,
animal_sterilization,
animal_bacterin,
animal_foundplace,
animal_status,
animal_opendate,
animal_title,
album_file,
shelter_id,
shelter_name_snapshot,
shelter_address_snapshot,
shelter_tel_snapshot,
availability_status,
favorite_count,
shelter:shelters (
  id,
  name,
  address,
  phone,
  opening_time,
  image_url
)
''';

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
  }) async {
    if (skip == 0) {
      _cachedSheltersById.clear();
    }

    dynamic query = _client.from('animals').select(_animalSelect);

    query = _applySearchFilters(query, searchParams);

    final rows = await query
        .order('animal_opendate', ascending: false)
        .order('created_at', ascending: false)
        .range(skip, skip + top - 1);
    final items = List<Map<String, dynamic>>.from(rows);

    final animals = items
        .map(SupabaseAdoptionMapper.animalFromRow)
        .toList(growable: false);

    for (final row in items) {
      final shelter = SupabaseAdoptionMapper.shelterFromAnimalRow(row);
      if (shelter != null) {
        _cachedSheltersById[shelter.id] = shelter;
      }
    }

    return AnimalPage(items: animals, hasMore: items.length >= top);
  }

  @override
  List<Shelter> buildShelters(List<Animal> animals) {
    final sheltersById = <String, Shelter>{..._cachedSheltersById};
    for (final shelter in SupabaseAdoptionMapper.mergedSheltersFromAnimals(animals)) {
      sheltersById.putIfAbsent(shelter.id, () => shelter);
    }
    return sheltersById.values.toList(growable: false);
  }

  @override
  List<Shelter> getShelters() => _cachedSheltersById.values.toList(growable: false);

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

  dynamic _applySearchFilters(
    dynamic query,
    AnimalSearchParams filters,
  ) {
    var builder = query;

    if (filters.animalAreaPkid != 0) {
      builder = builder.eq('animal_area_pkid', filters.animalAreaPkid);
    }
    if (filters.animalShelterPkid != 0) {
      builder = builder.eq('animal_shelter_pkid', filters.animalShelterPkid);
    }
    if (filters.animalKind.isNotEmpty) {
      builder = builder.eq('animal_kind', filters.animalKind);
    }
    if (filters.animalVariety.isNotEmpty) {
      builder = builder.ilike('animal_variety', '%${filters.animalVariety}%');
    }
    if (filters.animalSex.isNotEmpty) {
      builder = builder.eq('animal_sex', filters.animalSex);
    }
    if (filters.animalBodytype.isNotEmpty) {
      builder = builder.eq('animal_bodytype', filters.animalBodytype);
    }
    if (filters.animalColour.isNotEmpty) {
      builder = builder.ilike('animal_colour', '%${filters.animalColour}%');
    }
    if (filters.animalAge.isNotEmpty) {
      builder = builder.eq('animal_age', filters.animalAge);
    }
    if (filters.animalSterilization.isNotEmpty) {
      builder = builder.eq('animal_sterilization', filters.animalSterilization);
    }
    if (filters.animalBacterin.isNotEmpty) {
      builder = builder.eq('animal_bacterin', filters.animalBacterin);
    }
    if (filters.animalStatus.isNotEmpty) {
      builder = builder.eq('animal_status', filters.animalStatus);
    }

    return builder;
  }
}
