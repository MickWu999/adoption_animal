import 'package:freezed_annotation/freezed_annotation.dart';

part 'shelter.freezed.dart';

@freezed
sealed class Shelter with _$Shelter {
  const factory Shelter({
    required String id,
    required int shelterPkid,
    required String name,
    required String imagePath,
    required String address,
    required String phone,
    required String distance,
    required String capacity,
    required String openingHours,
  }) = _Shelter;
}
