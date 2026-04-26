import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'animal_tag.freezed.dart';

@freezed
sealed class AnimalTag with _$AnimalTag {
  const factory AnimalTag(String label, Color color) = _AnimalTag;
}
