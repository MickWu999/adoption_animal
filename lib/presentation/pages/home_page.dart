import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../controllers/adoption_controller.dart';
import '../widgets/legacy_ui.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(adoptionControllerProvider);
    final latestAnimals = state.latestAnimals;
    final favoriteAnimals = state.favoriteAnimals.take(3).toList();

    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 12, 20, 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on_rounded,
                        color: Color(0xFF4F8A3F),
                        size: 18,
                      ),
                      const SizedBox(width: 6),
                      const Text(
                        '台南市',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const Icon(Icons.keyboard_arrow_down_rounded),
                      const Spacer(),
                      IconButton(
                        onPressed: () => context.push('/notifications'),
                        icon: const Icon(Icons.notifications_none_rounded),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Container(
                    height: 126,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(26),
                      image: const DecorationImage(
                        image: AssetImage('assets/images/dog/login_dog.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(26),
                        gradient: LinearGradient(
                          colors: [
                            Colors.black.withValues(alpha: 0.45),
                            Colors.black.withValues(alpha: 0.1),
                          ],
                        ),
                      ),
                      padding: const EdgeInsets.all(22),
                      child: Row(
                        children: [
                          const Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '領養代替購買',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 28,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  '給牠一個溫暖的家',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: 48,
                            height: 48,
                            decoration: BoxDecoration(
                              color: Colors.white.withValues(alpha: 0.16),
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.favorite_border_rounded,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 18),
                  RoundedSearchField(
                    hintText: '搜尋品種、地區或收容所',
                    enabled: false,
                    onTap: () {
                      ref
                          .read(adoptionControllerProvider.notifier)
                          .selectTab(1);
                      context.go('/search');
                    },
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: state.homeCategories
                        .map((item) => QuickCategoryChip(item: item))
                        .toList(),
                  ),
                  const SizedBox(height: 10),
                  SectionHeader(
                    title: '最新來的毛孩',
                    actionLabel: '查看更多',
                    onTap: () {
                      ref
                          .read(adoptionControllerProvider.notifier)
                          .selectTab(1);
                      context.go('/search');
                    },
                  ),
                  const SizedBox(height: 6),
                  SizedBox(
                    height: 205,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: latestAnimals.length,
                      separatorBuilder: (_, _) => const SizedBox(width: 14),
                      itemBuilder: (context, index) {
                        final animal = latestAnimals[index];
                        return AnimalCard(
                          animal: animal,
                          width: 112,
                          onTap: () => context.push('/animal/${animal.id}'),
                          onFavoriteTap: () => ref
                              .read(adoptionControllerProvider.notifier)
                              .toggleFavorite(animal.id),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 24),
                  SectionHeader(
                    title: '熱門藏養 TOP10',
                    actionLabel: '查看更多',
                    onTap: () {},
                  ),
                  const SizedBox(height: 14),
                  ...favoriteAnimals.map(
                    (animal) => Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: ListTile(
                        tileColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        leading: CircleAvatar(
                          backgroundImage: AssetImage(animal.imagePath),
                        ),
                        title: Text(
                          animal.name,
                          style: const TextStyle(fontWeight: FontWeight.w700),
                        ),
                        subtitle: Text(
                          '${animal.location}・${animal.genderLabel}',
                        ),
                        trailing: const Icon(Icons.chevron_right_rounded),
                        onTap: () => context.push('/animal/${animal.id}'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
