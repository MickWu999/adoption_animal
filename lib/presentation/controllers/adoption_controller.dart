import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/repositories/mock_adoption_repository.dart';
import '../../domain/models/app_models.dart';
import 'adoption_state.dart';

final adoptionRepositoryProvider = Provider<AdoptionRepository>((ref) {
  return RemoteAdoptionRepository();
});

final adoptionControllerProvider =
    NotifierProvider<AdoptionController, AdoptionState>(AdoptionController.new);

final animalProvider = Provider.family<Animal?, String>((ref, animalId) {
  final state = ref.watch(adoptionControllerProvider);
  return state.animalById(animalId);
});

final shelterProvider = Provider.family<Shelter?, String>((ref, shelterId) {
  final state = ref.watch(adoptionControllerProvider);
  return state.shelterById(shelterId);
});

final shelterForAnimalProvider = Provider.family<Shelter?, String>((
  ref,
  animalId,
) {
  final state = ref.watch(adoptionControllerProvider);
  return state.shelterForAnimal(animalId);
});

final animalsForShelterProvider = Provider.family<List<Animal>, String>((
  ref,
  shelterId,
) {
  final state = ref.watch(adoptionControllerProvider);
  return state.animalsForShelter(shelterId);
});

class AdoptionController extends Notifier<AdoptionState> {
  bool _didBootstrapAnimals = false;
  int _fetchToken = 0;

  @override
  AdoptionState build() {
    final repository = ref.read(adoptionRepositoryProvider);
    if (!_didBootstrapAnimals) {
      _didBootstrapAnimals = true;
      unawaited(_refreshAnimals(repository, AnimalSearchParams.defaults()));
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

  Future<void> _refreshAnimals(
    AdoptionRepository repository,
    AnimalSearchParams searchFilters,
  ) async {
    final requestToken = ++_fetchToken;
    final params = AnimalApiQueryParams.fromSearchParams(searchFilters);

    try {
      final animals = await repository.fetchAnimals(params);
      if (requestToken != _fetchToken) {
        return;
      }
      state = state.copyWith(
        animals: animals,
        shelters: _buildSheltersFromAnimals(animals),
      );
    } catch (_) {
      if (requestToken != _fetchToken) {
        return;
      }
    }
  }

  List<Shelter> _buildSheltersFromAnimals(List<Animal> animals) {
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
        imagePath: animal.imagePath,
        address: animal.shelterAddress,
        phone: animal.shelterTel,
        distance: '',
        capacity: '',
        openingHours: '',
      );
    }
    return sheltersById.values.toList(growable: false);
  }
}
