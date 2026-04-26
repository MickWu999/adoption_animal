import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/lookups/adoption_lookups.dart';
import '../../domain/models/app_models.dart';
import 'load_phase.dart';

part 'adoption_state.freezed.dart';

@freezed
sealed class AdoptionState with _$AdoptionState {
  const AdoptionState._();

  const factory AdoptionState({
    required int currentTab,
    required String searchQuery,
    required AnimalSearchParams searchFilters,
    required FavoriteFilter favoriteFilter,
    required List<Animal> animals,
    required List<Shelter> shelters,
    required List<NoticeItem> notifications,
    required List<HomeCategory> homeCategories,
    required LoadPhase initialLoadPhase,
    required LoadPhase paginationLoadPhase,
    required bool hasMoreAnimals,
  }) = _AdoptionState;

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
      initialLoadPhase: LoadPhase.loading,
      paginationLoadPhase: LoadPhase.idle,
      hasMoreAnimals: true,
    );
  }

  bool get isInitialLoading => initialLoadPhase == LoadPhase.loading;

  bool get isLoadingMore => paginationLoadPhase == LoadPhase.loading;

  List<Animal> get latestAnimals => animals.take(6).toList();

  List<Animal> get favoriteAnimals =>
      animals.where((animal) => animal.isFavorite).toList();

  List<Animal> get topFavoriteAnimals => favoriteAnimals.take(3).toList();

  bool get shouldShowHomeLatestAnimals => latestAnimals.isNotEmpty;

  bool get shouldShowHomeTopFavorites => topFavoriteAnimals.isNotEmpty;

  List<Animal> get searchResults => filteredAnimals;

  bool get hasActiveSearchFilters => activeFilterLabels.isNotEmpty;

  bool get shouldShowSearchLoading => isInitialLoading;

  bool get shouldShowSearchEmptyState =>
      initialLoadPhase == LoadPhase.empty ||
      (initialLoadPhase == LoadPhase.success && searchResults.isEmpty);

  bool get shouldShowSearchFilterBar => hasActiveSearchFilters;

  bool get shouldShowSearchClearAction => hasActiveSearchFilters;

  bool get shouldShowSearchLoadMoreIndicator => isLoadingMore;

  bool get shouldShowSearchLoadMoreTerminator =>
      !isLoadingMore && !hasMoreAnimals;

  bool get hasSearchLoadError => initialLoadPhase == LoadPhase.error;

  bool get canLoadNextSearchPage =>
      !isInitialLoading && !isLoadingMore && hasMoreAnimals;

  int get searchListItemCount => searchResults.length + 2;

  String get searchResultsHeadline => hasActiveSearchFilters
      ? '已載入 ${searchResults.length} 隻符合條件'
      : '全部毛孩 (${searchResults.length})';

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
          countyLabelForCode(
            animal.animalAreaPkid,
          ).toLowerCase().contains(query) ||
          shelterLabelForCode(
            animal.animalShelterPkid,
          ).toLowerCase().contains(query) ||
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

      return matchesQuery;
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

  List<FavoriteFilter> get availableFavoriteFilters => FavoriteFilter.values;

  bool get shouldShowFavoritesEmptyState => visibleFavoriteAnimals.isEmpty;

  bool get shouldShowFavoritesList => visibleFavoriteAnimals.isNotEmpty;

  String get favoritesEmptyStateTitle => '還沒有收藏任何毛孩';

  String get favoritesEmptyStateMessage => '快去尋找喜歡的毛孩，加入收藏吧';

  String get favoritesEmptyStateActionLabel => '去尋找毛孩';

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
    final shelter =
        shelterById(animal.shelterId) ??
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

  final shelterPkid =
      int.tryParse(animal.shelterId) ?? animal.animalShelterPkid;
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
