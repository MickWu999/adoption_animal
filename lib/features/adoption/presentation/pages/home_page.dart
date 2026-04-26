import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/responsive/responsive.dart';
import '../../../../core/theme/adoption_theme.dart';
import '../controllers/adoption_controller.dart';
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
                  Container(
                    height: context.h(126),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(context.r(26)),
                      image: const DecorationImage(
                        image: AssetImage('assets/logo.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(context.r(26)),
                        gradient: LinearGradient(
                          colors: [
                            Colors.black.withValues(alpha: 0.45),
                            Colors.black.withValues(alpha: 0.1),
                          ],
                        ),
                      ),
                      padding: EdgeInsets.all(context.w(22)),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '領養代替購買',
                                  style: TextStyle(
                                    color: AdoptionColors.surface,
                                    fontSize: context.sp(28),
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                                SizedBox(height: context.h(8)),
                                Text(
                                  '給牠一個溫暖的家',
                                  style: TextStyle(
                                    color: AdoptionColors.surface,
                                    fontSize: context.sp(18),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: context.w(48),
                            height: context.w(48),
                            decoration: BoxDecoration(
                              color: AdoptionColors.surface.withValues(
                                alpha: 0.16,
                              ),
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.favorite_border_rounded,
                              color: AdoptionColors.surface,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
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
                  if (state.shouldShowHomeLatestAnimals)
                    SizedBox(
                      height: context.h(225),
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: state.latestAnimals.length,
                        separatorBuilder: (_, _) =>
                            SizedBox(width: context.w(14)),
                        itemBuilder: (context, index) {
                          final animal = state.latestAnimals[index];
                          return AnimalCard(
                            animal: animal,
                            width: context.w(170),
                            onTap: () => context.push('/animal/${animal.id}'),
                            onFavoriteTap: () =>
                                controller.toggleFavorite(animal.id),
                          );
                        },
                      ),
                    )
                  else
                    const EmptyStatePanel(
                      imagePath:
                          'assets/images/others_animals/melissa-keizer-X-0FisCRIaA-unsplash.jpg',
                      title: '目前沒有最新毛孩',
                      message: '稍後再回來看看新的認養資訊',
                      actionLabel: '重新查看',
                      onPressed: noop,
                      icon: Icons.pets_outlined,
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
                  if (state.shouldShowHomeTopFavorites)
                    ...state.topFavoriteAnimals.map(
                      (animal) => Padding(
                        padding: EdgeInsets.only(bottom: context.h(12)),
                        child: ListTile(
                          tileColor: AdoptionColors.surface,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(context.r(20)),
                          ),
                          leading: SizedBox(
                            width: context.w(40),
                            height: context.w(40),
                            child: ClipOval(
                              child: AnimalImage(
                                imagePath: animal.imagePath,
                                width: context.w(40),
                                height: context.w(40),
                              ),
                            ),
                          ),
                          title: Text(
                            animal.name,
                            style: TextStyle(
                              fontSize: context.sp(15),
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          subtitle: Text(
                            '${animal.location}・${animal.genderLabel}',
                            style: TextStyle(fontSize: context.sp(13)),
                          ),
                          trailing: const Icon(Icons.chevron_right_rounded),
                          onTap: () => context.push('/animal/${animal.id}'),
                        ),
                      ),
                    )
                  else
                    EmptyStatePanel(
                      imagePath:
                          'assets/images/dog/alvan-nee-T-0EW-SEbsE-unsplash.jpg',
                      title: '還沒有熱門收藏',
                      message: '把喜歡的毛孩加入收藏，這裡就會顯示推薦名單',
                      actionLabel: '去尋找毛孩',
                      onPressed: () {
                        controller.selectTab(1);
                        context.go('/search');
                      },
                      icon: Icons.favorite_border_rounded,
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
