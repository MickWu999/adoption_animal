import 'dart:convert';

import 'package:dio/dio.dart';

import '../models/animal_api_response.dart';
import '../models/animal_api_query_params.dart';
import '../models/app_models.dart';
import 'animal_api_mapper.dart';
import 'mock_adoption_repository.dart';

class RemoteAdoptionRepository extends MockAdoptionRepository {
  RemoteAdoptionRepository({Dio? dio})
    : _dio =
          dio ??
          Dio(
            BaseOptions(
              baseUrl: 'https://data.moa.gov.tw/Service/OpenData',
              connectTimeout: const Duration(seconds: 12),
              receiveTimeout: const Duration(seconds: 20),
            ),
          );

  final Dio _dio;

  @override
  Future<AnimalPage> fetchAnimals(AnimalApiQueryParams params) async {
    final response = await _dio.get(
      '/TransService.aspx',
      queryParameters: {
        'UnitId': 'QcbUEzN6E6DL',
        ...params.toQueryParameters(),
      },
    );

    final raw = response.data;
    final payload = raw is String ? jsonDecode(raw) : raw;
    final items = payload is List
        ? payload
        : payload is Map<String, dynamic>
        ? (payload['Data'] ??
                  payload['data'] ??
                  payload['result'] ??
                  const <dynamic>[])
              as List<dynamic>
        : const <dynamic>[];

    final animals = items
        .whereType<Map<String, dynamic>>()
        .map(AnimalApiResponse.fromJson)
        .map(AnimalApiMapper.fromResponse)
        .toList(growable: false);

    return AnimalPage(items: animals, hasMore: animals.length >= params.top);
  }
}
