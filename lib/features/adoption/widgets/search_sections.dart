import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/responsive/responsive.dart';
import '../models/app_models.dart';
import '../widgets/legacy_ui.dart';

class SearchFilterBar extends StatelessWidget {
  const SearchFilterBar({
    super.key,
    required this.labels,
    required this.searchFilters,
    required this.onOpenFilters,
    required this.onReset,
  });

  final List<String> labels;
  final AnimalSearchParams searchFilters;
  final ValueChanged<AnimalSearchParams> onOpenFilters;
  final VoidCallback onReset;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(right: context.w(10)),
            child: FilterChipCard(
              label: '篩選',
              selected: true,
              onTap: () => onOpenFilters(searchFilters),
            ),
          ),
          ...labels.map(
            (label) => Padding(
              padding: EdgeInsets.only(right: context.w(10)),
              child: FilterChipCard(
                label: label,
                selected: true,
                onTap: () => onOpenFilters(searchFilters),
              ),
            ),
          ),
          FilterChipCard(label: '清除', selected: false, onTap: onReset),
        ],
      ),
    );
  }
}

class SearchResultsList extends StatelessWidget {
  const SearchResultsList({
    super.key,
    required this.scrollController,
    required this.results,
    // required this.resultsHeadline,
    required this.shouldShowClearAction,
    required this.shouldShowLoadMoreIndicator,
    required this.shouldShowLoadMoreTerminator,
    required this.onReset,
    required this.onToggleFavorite,
  });

  final ScrollController scrollController;
  final List<Animal> results;
  //  final String resultsHeadline;
  final bool shouldShowClearAction;
  final bool shouldShowLoadMoreIndicator;
  final bool shouldShowLoadMoreTerminator;
  final VoidCallback onReset;
  final ValueChanged<String> onToggleFavorite;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: scrollController,
      padding: EdgeInsets.only(bottom: context.h(24)),
      itemCount: results.length + 2,
      itemBuilder: (context, index) {
        if (index == 0) {
          return Padding(
            padding: EdgeInsets.only(bottom: context.h(12)),
            child: Row(
              children: [
                // Text(
                //   resultsHeadline,
                //   style: const TextStyle(
                //     fontSize: 18,
                //     fontWeight: FontWeight.w800,
                //   ),
                // ),
                const Spacer(),
                if (shouldShowClearAction)
                  TextButton(onPressed: onReset, child: const Text('清除')),
              ],
            ),
          );
        }

        if (index == results.length + 1) {
          if (shouldShowLoadMoreIndicator) {
            return const Padding(
              padding: EdgeInsets.symmetric(vertical: 12),
              child: Center(child: CircularProgressIndicator()),
            );
          }

          if (shouldShowLoadMoreTerminator) {
            return SizedBox(height: context.h(8));
          }

          return const SizedBox.shrink();
        }

        final animal = results[index - 1];
        return Padding(
          padding: EdgeInsets.only(bottom: context.h(16)),
          child: AnimalCard(
            animal: animal,
            onTap: () => context.push('/animal/${animal.id}'),
            onFavoriteTap: () => onToggleFavorite(animal.id),
          ),
        );
      },
    );
  }
}
