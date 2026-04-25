import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/repositories/mock_adoption_repository.dart';
import '../../domain/models/app_models.dart';
import 'adoption_state.dart';

final adoptionRepositoryProvider = Provider<AdoptionRepository>((ref) {
  return const MockAdoptionRepository();
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
  @override
  AdoptionState build() {
    final repository = ref.read(adoptionRepositoryProvider);
    return AdoptionState.initial(repository);
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

  void updateSearchFilters(SearchFilters filters) {
    state = state.copyWith(searchFilters: filters);
  }

  void resetSearch() {
    state = state.copyWith(
      searchQuery: '',
      searchFilters: SearchFilters.defaults(),
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
}
