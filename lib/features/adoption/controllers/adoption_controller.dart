import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/app_models.dart';
import '../repositories/adoption_repository.dart';
import '../repositories/remote_adoption_repository.dart';
import 'adoption_state.dart';
import 'load_phase.dart';

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

    state = state.copyWith(paginationLoadPhase: LoadPhase.loading);

    try {
      final page = await repository.fetchAnimals(
        state.searchFilters,
        top: _pageSize,
        skip: state.animals.length,
      );
      if (requestToken != _fetchToken) {
        return;
      }

      final mergedAnimals = [...state.animals, ...page.items];
      state = state.copyWith(
        animals: mergedAnimals,
        shelters: repository.buildShelters(mergedAnimals),
        paginationLoadPhase: LoadPhase.success,
        hasMoreAnimals: page.hasMore,
      );
    } catch (_) {
      if (requestToken != _fetchToken) {
        return;
      }
      state = state.copyWith(paginationLoadPhase: LoadPhase.error);
    }
  }

  Future<void> _refreshAnimals(
    AdoptionRepository repository,
    AnimalSearchParams searchFilters,
  ) async {
    final requestToken = ++_fetchToken;

    state = state.copyWith(
      animals: const [],
      shelters: const [],
      initialLoadPhase: LoadPhase.loading,
      paginationLoadPhase: LoadPhase.idle,
      hasMoreAnimals: true,
    );

    try {
      final page = await repository.fetchAnimals(searchFilters, top: _pageSize);
      if (requestToken != _fetchToken) {
        return;
      }
      state = state.copyWith(
        animals: page.items,
        shelters: repository.buildShelters(page.items),
        initialLoadPhase: page.items.isEmpty
            ? LoadPhase.empty
            : LoadPhase.success,
        paginationLoadPhase: LoadPhase.idle,
        hasMoreAnimals: page.hasMore,
      );
    } catch (_) {
      if (requestToken != _fetchToken) {
        return;
      }
      state = state.copyWith(
        initialLoadPhase: LoadPhase.error,
        paginationLoadPhase: LoadPhase.idle,
        hasMoreAnimals: false,
      );
    }
  }
}
