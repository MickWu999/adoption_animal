import 'package:flutter/material.dart';

class Animal {
  const Animal({
    required this.name,
    required this.imagePath,
    required this.location,
    required this.shelterName,
    required this.breed,
    required this.color,
    required this.size,
    required this.ageLabel,
    required this.genderLabel,
    required this.tags,
    this.isFavorite = false,
  });

  final String name;
  final String imagePath;
  final String location;
  final String shelterName;
  final String breed;
  final String color;
  final String size;
  final String ageLabel;
  final String genderLabel;
  final List<AnimalTag> tags;
  final bool isFavorite;
}

class AnimalTag {
  const AnimalTag(this.label, this.color);

  final String label;
  final Color color;
}

class Shelter {
  const Shelter({
    required this.name,
    required this.imagePath,
    required this.address,
    required this.phone,
    required this.distance,
    required this.capacity,
    required this.openingHours,
  });

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
    required this.title,
    required this.message,
    required this.time,
    required this.icon,
    required this.color,
  });

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
    areas: {'台南市'},
    types: {'狗狗', '貓咪'},
    ages: {'幼年', '成犬 / 成貓', '老年'},
    genders: {'不限', '公', '母'},
    sizes: {'不限', '小型', '中型', '大型'},
    neuter: {'不限', '已絕育', '未絕育'},
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
      copyWith(genders: _toggle(genders, value));
  SearchFilters toggleSize(String value) =>
      copyWith(sizes: _toggle(sizes, value));
  SearchFilters toggleNeuter(String value) =>
      copyWith(neuter: _toggle(neuter, value));

  static Set<String> _toggle(Set<String> source, String value) {
    final next = Set<String>.from(source);
    if (next.contains(value)) {
      next.remove(value);
    } else {
      next.add(value);
    }
    return next.isEmpty ? {value} : next;
  }
}
