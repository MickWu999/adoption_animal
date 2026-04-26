import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_category.freezed.dart';

@freezed
sealed class HomeCategory with _$HomeCategory {
  const factory HomeCategory({
    required String label,
    required IconData icon,
    required Color background,
    required Color foreground,
  }) = _HomeCategory;
}
