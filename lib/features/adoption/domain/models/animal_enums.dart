enum AnimalType { dog, cat, other }

enum FavoriteFilter { all, dogs, cats, adopted }

extension AnimalTypeX on AnimalType {
  String get label {
    switch (this) {
      case AnimalType.dog:
        return '狗狗';
      case AnimalType.cat:
        return '貓咪';
      case AnimalType.other:
        return '其他';
    }
  }
}

extension FavoriteFilterX on FavoriteFilter {
  String get label {
    switch (this) {
      case FavoriteFilter.all:
        return '全部';
      case FavoriteFilter.dogs:
        return '狗狗';
      case FavoriteFilter.cats:
        return '貓咪';
      case FavoriteFilter.adopted:
        return '已送養';
    }
  }
}
