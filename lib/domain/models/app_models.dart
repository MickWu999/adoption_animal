import 'package:flutter/material.dart';

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

class AnimalTag {
  const AnimalTag(this.label, this.color);

  final String label;
  final Color color;
}

class Animal {
  const Animal({
    required this.id,
    required this.name,
    required this.imagePath,
    required this.location,
    required this.shelterId,
    required this.shelterName,
    required this.breed,
    required this.color,
    required this.size,
    required this.ageLabel,
    required this.genderLabel,
    required this.type,
    required this.tags,
    this.isFavorite = false,
    this.isAdopted = false,
    this.isNeutered = false,
  });

  final String id;
  final String name;
  final String imagePath;
  final String location;
  final String shelterId;
  final String shelterName;
  final String breed;
  final String color;
  final String size;
  final String ageLabel;
  final String genderLabel;
  final AnimalType type;
  final List<AnimalTag> tags;
  final bool isFavorite;
  final bool isAdopted;
  final bool isNeutered;

  Animal copyWith({bool? isFavorite, bool? isAdopted}) {
    return Animal(
      id: id,
      name: name,
      imagePath: imagePath,
      location: location,
      shelterId: shelterId,
      shelterName: shelterName,
      breed: breed,
      color: color,
      size: size,
      ageLabel: ageLabel,
      genderLabel: genderLabel,
      type: type,
      tags: tags,
      isFavorite: isFavorite ?? this.isFavorite,
      isAdopted: isAdopted ?? this.isAdopted,
      isNeutered: isNeutered,
    );
  }
}

class Shelter {
  const Shelter({
    required this.id,
    required this.name,
    required this.imagePath,
    required this.address,
    required this.phone,
    required this.distance,
    required this.capacity,
    required this.openingHours,
  });

  final String id;
  final String name;
  final String imagePath;
  final String address;
  final String phone;
  final String distance;
  final String capacity;
  final String openingHours;
}

class NoticeItem {
  const NoticeItem({
    required this.id,
    required this.title,
    required this.message,
    required this.time,
    required this.icon,
    required this.color,
  });

  final String id;
  final String title;
  final String message;
  final String time;
  final IconData icon;
  final Color color;
}

class HomeCategory {
  const HomeCategory({
    required this.label,
    required this.icon,
    required this.background,
    required this.foreground,
  });

  final String label;
  final IconData icon;
  final Color background;
  final Color foreground;
}

class SearchFilters {
  const SearchFilters({
    required this.areas,
    required this.types,
    required this.ages,
    required this.genders,
    required this.sizes,
    required this.neuter,
  });

  factory SearchFilters.defaults() => const SearchFilters(
    areas: {},
    types: {},
    ages: {},
    genders: {'不限'},
    sizes: {'不限'},
    neuter: {'不限'},
  );

  final Set<String> areas;
  final Set<String> types;
  final Set<String> ages;
  final Set<String> genders;
  final Set<String> sizes;
  final Set<String> neuter;

  SearchFilters copyWith({
    Set<String>? areas,
    Set<String>? types,
    Set<String>? ages,
    Set<String>? genders,
    Set<String>? sizes,
    Set<String>? neuter,
  }) {
    return SearchFilters(
      areas: areas ?? this.areas,
      types: types ?? this.types,
      ages: ages ?? this.ages,
      genders: genders ?? this.genders,
      sizes: sizes ?? this.sizes,
      neuter: neuter ?? this.neuter,
    );
  }

  SearchFilters toggleArea(String value) =>
      copyWith(areas: _toggle(areas, value));
  SearchFilters toggleType(String value) =>
      copyWith(types: _toggle(types, value));
  SearchFilters toggleAge(String value) => copyWith(ages: _toggle(ages, value));
  SearchFilters toggleGender(String value) =>
      copyWith(genders: _toggleSingleSelect(genders, value));
  SearchFilters toggleSize(String value) =>
      copyWith(sizes: _toggleSingleSelect(sizes, value));
  SearchFilters toggleNeuter(String value) =>
      copyWith(neuter: _toggleSingleSelect(neuter, value));

  SearchFilters selectArea(String value) =>
      value == '不限' ? copyWith(areas: {}) : copyWith(areas: {value});
  SearchFilters selectType(String value) =>
      value == '不限' ? copyWith(types: {}) : copyWith(types: {value});
  SearchFilters selectAge(String value) =>
      value == '不限' ? copyWith(ages: {}) : copyWith(ages: {value});
  SearchFilters selectGender(String value) =>
      value == '不限' ? copyWith(genders: {'不限'}) : copyWith(genders: {value});
  SearchFilters selectSize(String value) =>
      value == '不限' ? copyWith(sizes: {'不限'}) : copyWith(sizes: {value});
  SearchFilters selectNeuter(String value) =>
      value == '不限' ? copyWith(neuter: {'不限'}) : copyWith(neuter: {value});

  static Set<String> _toggle(Set<String> source, String value) {
    final next = Set<String>.from(source);
    if (next.contains(value)) {
      next.remove(value);
    } else {
      next.add(value);
    }
    return next.isEmpty ? {value} : next;
  }

  static Set<String> _toggleSingleSelect(Set<String> source, String value) {
    if (source.length == 1 && source.contains(value)) {
      return source;
    }
    return {value};
  }
}
