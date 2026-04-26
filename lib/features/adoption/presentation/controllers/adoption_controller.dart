import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/mappers/animal_api_mapper.dart';
import '../../data/models/animal_api_query_params.dart';
import '../../data/repositories/mock_adoption_repository.dart';
import '../../domain/models/app_models.dart';
import 'adoption_state.dart';

part 'adoption_controller.g.dart';

@Riverpod(keepAlive: true)
AdoptionRepository adoptionRepository(Ref ref) {
  // Supabase 接點 1:
  // 之後可在這裡把 RemoteAdoptionRepository 換成 SupabaseAdoptionRepository，
  // UI 與 controller 會繼續走同一套 fetchAnimals / pagination 流程。
  return RemoteAdoptionRepository();
}

@riverpod
Animal? animal(Ref ref, String animalId) {
  final state = ref.watch(adoptionControllerProvider);
  return state.animalById(animalId);
}

@riverpod
Shelter? shelter(Ref ref, String shelterId) {
  final state = ref.watch(adoptionControllerProvider);
  return state.shelterById(shelterId);
}

@riverpod
Shelter? shelterForAnimal(Ref ref, String animalId) {
  final state = ref.watch(adoptionControllerProvider);
  return state.shelterForAnimal(animalId);
}

@riverpod
List<Animal> animalsForShelter(Ref ref, String shelterId) {
  final state = ref.watch(adoptionControllerProvider);
  return state.animalsForShelter(shelterId);
}

@Riverpod(keepAlive: true)
class AdoptionController extends _$AdoptionController {
  static const int _pageSize = 20;

  bool _didBootstrapAnimals = false;
  int _fetchToken = 0;

  @override
  AdoptionState build() {
    final repository = ref.read(adoptionRepositoryProvider);
    if (!_didBootstrapAnimals) {
      _didBootstrapAnimals = true;
      Future<void>(() async {
        await _refreshAnimals(repository, AnimalSearchParams.defaults());
      });
    }
    return AdoptionState.empty(
      homeCategories: repository.getHomeCategories(),
      notifications: repository.getNotifications(),
    );
  }

  void syncCurrentTab(int index) {
    if (state.currentTab == index) {
      return;
    }
    state = state.copyWith(currentTab: index);
  }

  void selectTab(int index) {
    state = state.copyWith(currentTab: index);
  }

  void updateSearchQuery(String value) {
    state = state.copyWith(searchQuery: value);
  }

  void updateSearchFilters(AnimalSearchParams filters) {
    state = state.copyWith(searchFilters: filters);
    unawaited(_refreshAnimals(ref.read(adoptionRepositoryProvider), filters));
  }

  void resetSearch() {
    state = state.copyWith(
      searchQuery: '',
      searchFilters: AnimalSearchParams.defaults(),
    );
    unawaited(
      _refreshAnimals(
        ref.read(adoptionRepositoryProvider),
        AnimalSearchParams.defaults(),
      ),
    );
  }

  void selectFavoriteFilter(FavoriteFilter filter) {
    state = state.copyWith(favoriteFilter: filter);
  }

  void toggleFavorite(String animalId) {
    final animals = [
      for (final animal in state.animals)
        if (animal.id == animalId)
          animal.copyWith(isFavorite: !animal.isFavorite)
        else
          animal,
    ];

    state = state.copyWith(animals: animals);
  }

  Future<void> loadNextPage() async {
    if (state.isInitialLoading ||
        state.isLoadingMore ||
        !state.hasMoreAnimals) {
      return;
    }

    final requestToken = _fetchToken;
    final repository = ref.read(adoptionRepositoryProvider);
    // Supabase 接點 2:
    // 這裡只負責組出分頁與篩選條件，實際要怎麼查資料表交給 repository。
    // 如果改成 Supabase，通常只需要保留 params 的概念，並在 repository 內轉成 query builder。
    final params = AnimalApiQueryParams.fromSearchParams(
      state.searchFilters,
      top: _pageSize,
      skip: state.animals.length,
    );

    state = state.copyWith(isLoadingMore: true);

    try {
      final page = await repository.fetchAnimals(params);
      if (requestToken != _fetchToken) {
        return;
      }

      final mergedAnimals = [...state.animals, ...page.items];
      state = state.copyWith(
        animals: mergedAnimals,
        shelters: AnimalApiMapper.sheltersFromAnimals(mergedAnimals),
        isLoadingMore: false,
        hasMoreAnimals: page.hasMore,
      );
    } catch (_) {
      if (requestToken != _fetchToken) {
        return;
      }
      state = state.copyWith(isLoadingMore: false);
    }
  }

  Future<void> _refreshAnimals(
    AdoptionRepository repository,
    AnimalSearchParams searchFilters,
  ) async {
    final requestToken = ++_fetchToken;
    // Supabase 接點 3:
    // 首次載入與套用篩選都會走這裡；若改成 Supabase，controller 不需要改查詢細節，
    // 只要 repository.fetchAnimals(params) 能回傳同樣的 AnimalPage 即可。
    final params = AnimalApiQueryParams.fromSearchParams(
      searchFilters,
      top: _pageSize,
    );

    state = state.copyWith(
      animals: const [],
      shelters: const [],
      isInitialLoading: true,
      isLoadingMore: false,
      hasMoreAnimals: true,
    );

    try {
      final page = await repository.fetchAnimals(params);
      if (requestToken != _fetchToken) {
        return;
      }
      state = state.copyWith(
        animals: page.items,
        shelters: AnimalApiMapper.sheltersFromAnimals(page.items),
        isInitialLoading: false,
        isLoadingMore: false,
        hasMoreAnimals: page.hasMore,
      );
    } catch (_) {
      if (requestToken != _fetchToken) {
        return;
      }
      state = state.copyWith(
        isInitialLoading: false,
        isLoadingMore: false,
        hasMoreAnimals: false,
      );
    }
  }
}
