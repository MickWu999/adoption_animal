import '../../data/repositories/mock_adoption_repository.dart';
import '../../domain/models/app_models.dart';

class AdoptionState {
  const AdoptionState({
    required this.currentTab,
    required this.searchQuery,
    required this.searchFilters,
    required this.favoriteFilter,
    required this.animals,
    required this.shelters,
    required this.notifications,
    required this.homeCategories,
  });

  factory AdoptionState.initial(AdoptionRepository repository) {
    return AdoptionState(
      currentTab: 0,
      searchQuery: '',
      searchFilters: SearchFilters.defaults(),
      favoriteFilter: FavoriteFilter.all,
      animals: repository.getAnimals(),
      shelters: repository.getShelters(),
      notifications: repository.getNotifications(),
      homeCategories: repository.getHomeCategories(),
    );
  }

  final int currentTab;
  final String searchQuery;
  final SearchFilters searchFilters;
  final FavoriteFilter favoriteFilter;
  final List<Animal> animals;
  final List<Shelter> shelters;
  final List<NoticeItem> notifications;
  final List<HomeCategory> homeCategories;

  List<Animal> get latestAnimals => animals.take(6).toList();

  List<Animal> get favoriteAnimals =>
      animals.where((animal) => animal.isFavorite).toList();

  List<Animal> get filteredAnimals {
    final query = searchQuery.trim().toLowerCase();

    return animals.where((animal) {
      final matchesQuery =
          query.isEmpty ||
          animal.name.toLowerCase().contains(query) ||
          animal.location.toLowerCase().contains(query) ||
          animal.breed.toLowerCase().contains(query) ||
          animal.shelterName.toLowerCase().contains(query);

      final matchesArea =
          searchFilters.areas.isEmpty ||
          searchFilters.areas.contains(animal.location);
      final matchesType =
          searchFilters.types.isEmpty ||
          searchFilters.types.contains(animal.type.label);
      final matchesAge =
          searchFilters.ages.isEmpty ||
          (searchFilters.ages.contains('幼年') &&
              animal.ageLabel.contains('幼')) ||
          (searchFilters.ages.contains('成犬 / 成貓') &&
              animal.ageLabel.contains('成')) ||
          (searchFilters.ages.contains('老年') && animal.ageLabel.contains('老'));
      final matchesGender =
          searchFilters.genders.contains('不限') ||
          searchFilters.genders.contains(animal.genderLabel);
      final matchesSize =
          searchFilters.sizes.contains('不限') ||
          searchFilters.sizes.contains(animal.size);
      final matchesNeuter =
          searchFilters.neuter.contains('不限') ||
          (searchFilters.neuter.contains('已絕育') && animal.isNeutered) ||
          (searchFilters.neuter.contains('未絕育') && !animal.isNeutered);

      return matchesQuery &&
          matchesArea &&
          matchesType &&
          matchesAge &&
          matchesGender &&
          matchesSize &&
          matchesNeuter;
    }).toList();
  }

  List<Animal> get visibleFavoriteAnimals {
    final favorites = favoriteAnimals;

    switch (favoriteFilter) {
      case FavoriteFilter.all:
        return favorites;
      case FavoriteFilter.dogs:
        return favorites
            .where((animal) => animal.type == AnimalType.dog)
            .toList();
      case FavoriteFilter.cats:
        return favorites
            .where((animal) => animal.type == AnimalType.cat)
            .toList();
      case FavoriteFilter.adopted:
        return favorites.where((animal) => animal.isAdopted).toList();
    }
  }

  List<String> get activeFilterLabels {
    return [
      if (searchFilters.areas.isNotEmpty) ...searchFilters.areas,
      if (searchFilters.types.isNotEmpty) ...searchFilters.types,
      if (searchFilters.ages.isNotEmpty) ...searchFilters.ages,
      ...searchFilters.genders.where((item) => item != '不限'),
      ...searchFilters.sizes.where((item) => item != '不限'),
      ...searchFilters.neuter.where((item) => item != '不限'),
    ];
  }

  Animal? animalById(String animalId) =>
      _firstWhereOrNull(animals, (animal) => animal.id == animalId);

  Shelter? shelterById(String shelterId) =>
      _firstWhereOrNull(shelters, (shelter) => shelter.id == shelterId);

  Shelter? shelterForAnimal(String animalId) {
    final animal = animalById(animalId);
    if (animal == null) {
      return null;
    }
    return shelterById(animal.shelterId);
  }

  List<Animal> animalsForShelter(String shelterId) {
    return animals.where((animal) => animal.shelterId == shelterId).toList();
  }

  AdoptionState copyWith({
    int? currentTab,
    String? searchQuery,
    SearchFilters? searchFilters,
    FavoriteFilter? favoriteFilter,
    List<Animal>? animals,
  }) {
    return AdoptionState(
      currentTab: currentTab ?? this.currentTab,
      searchQuery: searchQuery ?? this.searchQuery,
      searchFilters: searchFilters ?? this.searchFilters,
      favoriteFilter: favoriteFilter ?? this.favoriteFilter,
      animals: animals ?? this.animals,
      shelters: shelters,
      notifications: notifications,
      homeCategories: homeCategories,
    );
  }
}

T? _firstWhereOrNull<T>(Iterable<T> items, bool Function(T item) test) {
  for (final item in items) {
    if (test(item)) {
      return item;
    }
  }
  return null;
}
