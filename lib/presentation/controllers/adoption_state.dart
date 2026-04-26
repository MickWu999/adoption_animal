import '../../core/lookups/adoption_lookups.dart';
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

  factory AdoptionState.empty({
    required List<HomeCategory> homeCategories,
    required List<NoticeItem> notifications,
  }) {
    return AdoptionState(
      currentTab: 0,
      searchQuery: '',
      searchFilters: AnimalSearchParams.defaults(),
      favoriteFilter: FavoriteFilter.all,
      animals: const [],
      shelters: const [],
      notifications: notifications,
      homeCategories: homeCategories,
    );
  }

  final int currentTab;
  final String searchQuery;
  final AnimalSearchParams searchFilters;
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

    final filtered = animals.where((animal) {
      final matchesQuery =
          query.isEmpty ||
          animal.name.toLowerCase().contains(query) ||
          animal.animalId.toLowerCase().contains(query) ||
          animal.animalSubid.toLowerCase().contains(query) ||
          animal.location.toLowerCase().contains(query) ||
          animal.animalPlace.toLowerCase().contains(query) ||
          animal.animalFoundplace.toLowerCase().contains(query) ||
          countyLabelForCode(animal.animalAreaPkid).toLowerCase().contains(
            query,
          ) ||
          shelterLabelForCode(animal.animalShelterPkid).toLowerCase().contains(
            query,
          ) ||
          animal.animalKind.toLowerCase().contains(query) ||
          animal.animalVariety.toLowerCase().contains(query) ||
          animal.animalSex.toLowerCase().contains(query) ||
          animal.animalBodytype.toLowerCase().contains(query) ||
          animal.animalColour.toLowerCase().contains(query) ||
          animal.animalAge.toLowerCase().contains(query) ||
          animal.animalSterilization.toLowerCase().contains(query) ||
          animal.animalBacterin.toLowerCase().contains(query) ||
          animal.animalStatus.toLowerCase().contains(query) ||
          animal.shelterName.toLowerCase().contains(query);

      final matchesArea =
          searchFilters.animalAreaPkid == 0 ||
          animal.animalAreaPkid == searchFilters.animalAreaPkid;
      final matchesShelterPkid =
          searchFilters.animalShelterPkid == 0 ||
          animal.animalShelterPkid == searchFilters.animalShelterPkid;
      final matchesKind =
          searchFilters.animalKind.isEmpty ||
          animal.animalKind == searchFilters.animalKind;
      final matchesVariety =
          searchFilters.animalVariety.isEmpty ||
          animal.animalVariety.toLowerCase().contains(
            searchFilters.animalVariety.toLowerCase(),
          );
      final matchesSex =
          searchFilters.animalSex.isEmpty ||
          animal.animalSex == searchFilters.animalSex;
      final matchesBodytype =
          searchFilters.animalBodytype.isEmpty ||
          animal.animalBodytype == searchFilters.animalBodytype;
      final matchesColour =
          searchFilters.animalColour.isEmpty ||
          animal.animalColour.toLowerCase().contains(
            searchFilters.animalColour.toLowerCase(),
          );
      final matchesAge =
          searchFilters.animalAge.isEmpty ||
          animal.animalAge == searchFilters.animalAge;
      final matchesSterilization =
          searchFilters.animalSterilization.isEmpty ||
          animal.animalSterilization == searchFilters.animalSterilization;
      final matchesBacterin =
          searchFilters.animalBacterin.isEmpty ||
          animal.animalBacterin == searchFilters.animalBacterin;
      final matchesStatus =
          searchFilters.animalStatus.isEmpty ||
          animal.animalStatus == searchFilters.animalStatus;

      return matchesQuery &&
          matchesArea &&
          matchesShelterPkid &&
          matchesKind &&
          matchesVariety &&
          matchesSex &&
          matchesBodytype &&
          matchesColour &&
          matchesAge &&
          matchesSterilization &&
          matchesBacterin &&
          matchesStatus;
    }).toList();
    return filtered;
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
      if (searchFilters.animalAreaPkid != 0)
        '縣市 ${countyLabelForCode(searchFilters.animalAreaPkid)}',
      if (searchFilters.animalShelterPkid != 0)
        '收容所 ${shelterLabelForCode(searchFilters.animalShelterPkid)}',
      if (searchFilters.animalKind.isNotEmpty) '類型 ${searchFilters.animalKind}',
      if (searchFilters.animalVariety.isNotEmpty)
        '品種 ${searchFilters.animalVariety}',
      if (searchFilters.animalSex.isNotEmpty)
        '性別 ${_displaySex(searchFilters.animalSex)}',
      if (searchFilters.animalBodytype.isNotEmpty)
        '體型 ${_displayBodytype(searchFilters.animalBodytype)}',
      if (searchFilters.animalColour.isNotEmpty)
        '毛色 ${searchFilters.animalColour}',
      if (searchFilters.animalAge.isNotEmpty)
        '年齡 ${_displayAge(searchFilters.animalAge)}',
      if (searchFilters.animalSterilization.isNotEmpty)
        '絕育 ${_displayTFN(searchFilters.animalSterilization)}',
      if (searchFilters.animalBacterin.isNotEmpty)
        '疫苗 ${_displayTFN(searchFilters.animalBacterin)}',
      if (searchFilters.animalStatus.isNotEmpty)
        '狀態 ${_displayStatus(searchFilters.animalStatus)}',
    ];
  }

  Animal? animalById(String animalId) {
    return _firstWhereOrNull(animals, (item) => item.id == animalId);
  }

  Shelter? shelterById(String shelterId) =>
      _firstWhereOrNull(
        shelters,
        (shelter) =>
            shelter.id == shelterId ||
            shelter.shelterPkid.toString() == shelterId,
      ) ??
      _shelterFromAnimal(
        _firstWhereOrNull(
          animals,
          (animal) =>
              animal.shelterId == shelterId ||
              animal.animalShelterPkid.toString() == shelterId,
        ),
      );

  Shelter? shelterForAnimal(String animalId) {
    final animal = animalById(animalId);
    if (animal == null) {
      return null;
    }
    final shelter = shelterById(animal.shelterId) ??
        shelterByName(animal.shelterName) ??
        _shelterFromAnimal(animal);
    return shelter;
  }

  List<Animal> animalsForShelter(String shelterId) {
    return animals
        .where(
          (animal) =>
              animal.shelterId == shelterId ||
              animal.animalShelterPkid.toString() == shelterId,
        )
        .toList();
  }

  Shelter? shelterByName(String shelterName) {
    return _firstWhereOrNull(
      shelters,
      (shelter) =>
          shelter.name == shelterName ||
          _normalizeShelterName(shelter.name) ==
              _normalizeShelterName(shelterName),
    );
  }

  AdoptionState copyWith({
    int? currentTab,
    String? searchQuery,
    AnimalSearchParams? searchFilters,
    FavoriteFilter? favoriteFilter,
    List<Animal>? animals,
    List<Shelter>? shelters,
  }) {
    return AdoptionState(
      currentTab: currentTab ?? this.currentTab,
      searchQuery: searchQuery ?? this.searchQuery,
      searchFilters: searchFilters ?? this.searchFilters,
      favoriteFilter: favoriteFilter ?? this.favoriteFilter,
      animals: animals ?? this.animals,
      shelters: shelters ?? this.shelters,
      notifications: notifications,
      homeCategories: homeCategories,
    );
  }
}

String _displaySex(String value) {
  switch (value) {
    case 'M':
      return '公';
    case 'F':
      return '母';
    case 'N':
      return '不詳';
  }
  return value;
}

String _displayBodytype(String value) {
  switch (value) {
    case 'SMALL':
      return '小型';
    case 'MEDIUM':
      return '中型';
    case 'BIG':
      return '大型';
  }
  return value;
}

String _displayAge(String value) {
  switch (value) {
    case 'CHILD':
      return '幼年';
    case 'ADULT':
      return '成年';
  }
  return value;
}

String _displayTFN(String value) {
  switch (value) {
    case 'T':
      return '是';
    case 'F':
      return '否';
    case 'N':
      return '未知';
  }
  return value;
}

String _displayStatus(String value) {
  switch (value) {
    case 'OPEN':
      return '開放認養';
    case 'ADOPTED':
      return '已送養';
    case 'OTHER':
      return '其他';
    case 'DEAD':
      return '死亡';
  }
  return value;
}

T? _firstWhereOrNull<T>(Iterable<T> items, bool Function(T item) test) {
  for (final item in items) {
    if (test(item)) {
      return item;
    }
  }
  return null;
}

Shelter? _shelterFromAnimal(Animal? animal) {
  if (animal == null) {
    return null;
  }

  final shelterPkid = int.tryParse(animal.shelterId) ?? animal.animalShelterPkid;
  return Shelter(
    id: shelterPkid == 0 ? animal.shelterId : shelterPkid.toString(),
    shelterPkid: shelterPkid,
    name: animal.shelterName.isNotEmpty
        ? animal.shelterName
        : countyLabelForCode(animal.animalAreaPkid),
    imagePath: 'assets/images/shaltar/sheltar.jpg',
    address: animal.shelterAddress,
    phone: animal.shelterTel,
    distance: '',
    capacity: '',
    openingHours: '',
  );
}

String _normalizeShelterName(String value) {
  return value.replaceAll('臺', '台').trim();
}
