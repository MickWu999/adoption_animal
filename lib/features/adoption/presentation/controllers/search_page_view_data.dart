import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/models/app_models.dart';
import 'adoption_controller.dart';

part 'search_page_view_data.freezed.dart';
part 'search_page_view_data.g.dart';

@freezed
sealed class SearchPageViewData with _$SearchPageViewData {
  const SearchPageViewData._();

  const factory SearchPageViewData({
    required AnimalSearchParams searchFilters,
    required List<Animal> results,
    required List<String> activeFilterLabels,
    required bool shouldShowLoading,
    required bool shouldShowEmptyState,
    required bool shouldShowFilterBar,
    required bool shouldShowClearAction,
    required bool shouldShowLoadMoreIndicator,
    required bool shouldShowLoadMoreTerminator,
    required bool canLoadNextPage,
    required int listItemCount,
    required String resultsHeadline,
  }) = _SearchPageViewData;
}

@riverpod
SearchPageViewData searchPageViewData(Ref ref) {
  final state = ref.watch(adoptionControllerProvider);
  final results = state.filteredAnimals;
  final activeFilterLabels = state.activeFilterLabels;
  final hasActiveFilters = activeFilterLabels.isNotEmpty;

  // SearchPage 專屬的 UI 投影集中在這裡，
  // 讓 page 只負責 render，不直接拼湊畫面條件與文案。
  return SearchPageViewData(
    searchFilters: state.searchFilters,
    results: results,
    activeFilterLabels: activeFilterLabels,
    shouldShowLoading: state.isInitialLoading,
    shouldShowEmptyState: !state.isInitialLoading && results.isEmpty,
    shouldShowFilterBar: hasActiveFilters,
    shouldShowClearAction: hasActiveFilters,
    shouldShowLoadMoreIndicator: state.isLoadingMore,
    shouldShowLoadMoreTerminator: !state.isLoadingMore && !state.hasMoreAnimals,
    canLoadNextPage:
        !state.isInitialLoading && !state.isLoadingMore && state.hasMoreAnimals,
    listItemCount: results.length + 2,
    resultsHeadline: hasActiveFilters
        ? '已載入 ${results.length} 隻符合條件'
        : '全部毛孩 (${results.length})',
  );
}
