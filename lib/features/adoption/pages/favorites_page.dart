import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/responsive/responsive.dart';
import '../../../../core/theme/adoption_theme.dart';
import '../controllers/adoption_controller.dart';
import '../models/app_models.dart';
import '../widgets/legacy_ui.dart';

class FavoritesPage extends ConsumerWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(adoptionControllerProvider);
    final controller = ref.read(adoptionControllerProvider.notifier);

    return SafeArea(
      child: Padding(
        padding: EdgeInsets.fromLTRB(
          context.w(20),
          context.h(16),
          context.w(20),
          0,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '我的收藏',
                  style: TextStyle(
                    fontSize: context.sp(24),
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
            SizedBox(height: context.h(14)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: state.availableFavoriteFilters
                  .map(
                    (filter) => GestureDetector(
                      onTap: () => controller.selectFavoriteFilter(filter),
                      child: TabText(
                        label: filter.label,
                        selected: state.favoriteFilter == filter,
                      ),
                    ),
                  )
                  .toList(),
            ),
            SizedBox(height: context.h(18)),
            Expanded(
              child: state.shouldShowFavoritesEmptyState
                  ? Center(
                      child: EmptyStatePanel(
                        imagePath:
                            'assets/images/dog/alvan-nee-T-0EW-SEbsE-unsplash.jpg',
                        title: state.favoritesEmptyStateTitle,
                        message: state.favoritesEmptyStateMessage,
                        actionLabel: state.favoritesEmptyStateActionLabel,
                        onPressed: () {
                          controller.selectTab(1);
                          context.go('/search');
                        },
                        icon: Icons.favorite_border_rounded,
                      ),
                    )
                  : ListView.separated(
                      itemCount: state.visibleFavoriteAnimals.length,
                      separatorBuilder: (_, _) =>
                          SizedBox(height: context.h(12)),
                      itemBuilder: (context, index) {
                        final animal = state.visibleFavoriteAnimals[index];
                        return GestureDetector(
                          onTap: () => context.push('/animal/${animal.id}'),
                          child: Container(
                            padding: EdgeInsets.all(context.w(12)),
                            decoration: BoxDecoration(
                              color: AdoptionColors.surface,
                              borderRadius: BorderRadius.circular(
                                context.r(22),
                              ),
                            ),
                            child: Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(
                                    context.r(16),
                                  ),
                                  child: AnimalImage(
                                    imagePath: animal.imagePath,
                                    width: context.w(88),
                                    height: context.w(88),
                                  ),
                                ),
                                SizedBox(width: context.w(14)),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        animal.name,
                                        style: TextStyle(
                                          fontSize: context.sp(18),
                                          fontWeight: FontWeight.w800,
                                        ),
                                      ),
                                      SizedBox(height: context.h(4)),
                                      Text(
                                        '${animal.location}・${animal.shelterName}',
                                        style: TextStyle(
                                          fontSize: context.sp(13),
                                          color: AdoptionColors.textMuted,
                                        ),
                                      ),
                                      SizedBox(height: context.h(8)),
                                      Wrap(
                                        spacing: context.w(6),
                                        runSpacing: context.h(6),
                                        children: animal.tags
                                            .map(
                                              (tag) => StatusChip(
                                                text: tag.label,
                                                color: tag.color,
                                              ),
                                            )
                                            .toList(),
                                      ),
                                    ],
                                  ),
                                ),
                                IconButton(
                                  onPressed: () =>
                                      controller.toggleFavorite(animal.id),
                                  icon: const Icon(
                                    Icons.favorite_rounded,
                                    color: AdoptionColors.danger,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
