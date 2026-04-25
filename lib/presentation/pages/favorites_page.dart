import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../domain/models/app_models.dart';
import '../controllers/adoption_controller.dart';
import '../widgets/legacy_ui.dart';

class FavoritesPage extends ConsumerWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(adoptionControllerProvider);
    final controller = ref.read(adoptionControllerProvider.notifier);
    final animals = state.visibleFavoriteAnimals;

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  '我的收藏',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900),
                ),
              ],
            ),
            const SizedBox(height: 14),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: FavoriteFilter.values
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
            const SizedBox(height: 18),
            Expanded(
              child: animals.isEmpty
                  ? Center(
                      child: EmptyStatePanel(
                        imagePath:
                            'assets/images/dog/alvan-nee-T-0EW-SEbsE-unsplash.jpg',
                        title: '還沒有收藏任何毛孩',
                        message: '快去尋找喜歡的毛孩，加入收藏吧',
                        actionLabel: '去尋找毛孩',
                        onPressed: () {
                          controller.selectTab(1);
                          context.go('/search');
                        },
                        icon: Icons.favorite_border_rounded,
                      ),
                    )
                  : ListView.separated(
                      itemCount: animals.length,
                      separatorBuilder: (_, _) => const SizedBox(height: 12),
                      itemBuilder: (context, index) {
                        final animal = animals[index];
                        return GestureDetector(
                          onTap: () => context.push('/animal/${animal.id}'),
                          child: Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(22),
                            ),
                            child: Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(16),
                                  child: Image.asset(
                                    animal.imagePath,
                                    width: 88,
                                    height: 88,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const SizedBox(width: 14),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        animal.name,
                                        style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w800,
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        '${animal.location}・${animal.shelterName}',
                                        style: const TextStyle(
                                          color: Colors.black54,
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      Wrap(
                                        spacing: 6,
                                        runSpacing: 6,
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
                                    color: Color(0xFFE35D4F),
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
