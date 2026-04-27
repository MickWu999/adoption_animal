import 'package:freezed_annotation/freezed_annotation.dart';

import 'animal.dart';

part 'animal_page.freezed.dart';

@freezed
sealed class AnimalPage with _$AnimalPage {
  const factory AnimalPage({
    required List<Animal> items,
    required bool hasMore,
  }) = _AnimalPage;
}
