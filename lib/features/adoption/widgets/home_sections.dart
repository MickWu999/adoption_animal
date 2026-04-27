import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/responsive/responsive.dart';
import '../../../../core/theme/adoption_theme.dart';
import '../models/app_models.dart';
import '../widgets/legacy_ui.dart';

class HomeHeroBanner extends StatelessWidget {
  const HomeHeroBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
                color: AdoptionColors.surface.withValues(alpha: 0.16),
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
    );
  }
}

class HomeLatestAnimalsSection extends StatelessWidget {
  const HomeLatestAnimalsSection({
    super.key,
    required this.animals,
    required this.shouldShowAnimals,
    required this.onFavoriteTap,
  });

  final List<Animal> animals;
  final bool shouldShowAnimals;
  final ValueChanged<String> onFavoriteTap;

  @override
  Widget build(BuildContext context) {
    if (!shouldShowAnimals) {
      return const EmptyStatePanel(
        imagePath:
            'assets/images/others_animals/melissa-keizer-X-0FisCRIaA-unsplash.jpg',
        title: '目前沒有最新毛孩',
        message: '稍後再回來看看新的認養資訊',
        actionLabel: '重新查看',
        onPressed: noop,
        icon: Icons.pets_outlined,
      );
    }

    return SizedBox(
      height: context.h(225),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: animals.length,
        separatorBuilder: (_, _) => SizedBox(width: context.w(14)),
        itemBuilder: (context, index) {
          final animal = animals[index];
          return AnimalCard(
            animal: animal,
            width: context.w(170),
            onTap: () => context.push('/animal/${animal.id}'),
            onFavoriteTap: () => onFavoriteTap(animal.id),
          );
        },
      ),
    );
  }
}

class HomeTopFavoritesSection extends StatelessWidget {
  const HomeTopFavoritesSection({
    super.key,
    required this.animals,
    required this.shouldShowAnimals,
    required this.onBrowseSearch,
  });

  final List<Animal> animals;
  final bool shouldShowAnimals;
  final VoidCallback onBrowseSearch;

  @override
  Widget build(BuildContext context) {
    if (!shouldShowAnimals) {
      return EmptyStatePanel(
        imagePath: 'assets/images/dog/alvan-nee-T-0EW-SEbsE-unsplash.jpg',
        title: '還沒有熱門收藏',
        message: '把喜歡的毛孩加入收藏，這裡就會顯示推薦名單',
        actionLabel: '去尋找毛孩',
        onPressed: onBrowseSearch,
        icon: Icons.favorite_border_rounded,
      );
    }

    return Column(
      children: animals
          .map(
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
                  child: AdoptionImageFrame(
                    imagePath: animal.imagePath,
                    width: context.w(40),
                    height: context.w(40),
                    borderRadius: BorderRadius.circular(context.r(999)),
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
          .toList(),
    );
  }
}
