import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/responsive/responsive.dart';
import '../../../../core/theme/adoption_theme.dart';
import '../controllers/adoption_controller.dart';
import '../widgets/home_sections.dart';
import '../widgets/legacy_ui.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(adoptionControllerProvider);
    final controller = ref.read(adoptionControllerProvider.notifier);

    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.fromLTRB(
                context.w(20),
                context.h(12),
                context.w(20),
                context.h(24),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.location_on_rounded,
                        color: AdoptionColors.primary,
                        size: context.sp(18),
                      ),
                      SizedBox(width: context.w(6)),
                      Text(
                        '台南市',
                        style: TextStyle(
                          fontSize: context.sp(16),
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
                  SizedBox(height: context.h(12)),
                  const HomeHeroBanner(),
                  SizedBox(height: context.h(20)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: state.homeCategories
                        .map((item) => QuickCategoryChip(item: item))
                        .toList(),
                  ),
                  SizedBox(height: context.h(10)),
                  SectionHeader(
                    title: '最新來的毛孩',
                    actionLabel: '查看更多',
                    onTap: () {
                      controller.selectTab(1);
                      context.go('/search');
                    },
                  ),
                  SizedBox(height: context.h(6)),
                  HomeLatestAnimalsSection(
                    animals: state.latestAnimals,
                    shouldShowAnimals: state.shouldShowHomeLatestAnimals,
                    onFavoriteTap: controller.toggleFavorite,
                  ),
                  SizedBox(height: context.h(24)),
                  SectionHeader(
                    title: '熱門藏養 TOP10',
                    actionLabel: '查看更多',
                    onTap: () {
                      controller.selectTab(2);
                      context.go('/favorites');
                    },
                  ),
                  SizedBox(height: context.h(14)),
                  HomeTopFavoritesSection(
                    animals: state.topFavoriteAnimals,
                    shouldShowAnimals: state.shouldShowHomeTopFavorites,
                    onBrowseSearch: () {
                      controller.selectTab(1);
                      context.go('/search');
                    },
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
