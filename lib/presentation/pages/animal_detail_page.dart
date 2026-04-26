import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../controllers/adoption_controller.dart';
import '../widgets/legacy_ui.dart';

class AnimalDetailPage extends ConsumerWidget {
  const AnimalDetailPage({super.key, required this.animalId});

  final String animalId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    debugPrint('[AnimalDetailPage] route animalId=$animalId');
    final animal = ref.watch(animalProvider(animalId));
    final shelter = ref.watch(shelterForAnimalProvider(animalId));
    final controller = ref.read(adoptionControllerProvider.notifier);

    if (animal == null || shelter == null) {
      debugPrint(
        '[AnimalDetailPage] missing data animal=${animal?.id} shelter=${shelter?.id}',
      );
      return Scaffold(
        body: Center(
          child: EmptyStatePanel(
            imagePath: 'assets/images/shaltar/sheltar.jpg',
            title: '找不到毛孩資料',
            message: '這隻毛孩可能已經下架，請返回列表重新查看',
            actionLabel: '返回',
            onPressed: () => context.pop(),
            icon: Icons.pets_outlined,
          ),
        ),
      );
    }

    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverAppBar(
                expandedHeight: 380,
                pinned: true,
                backgroundColor: Colors.transparent,
                leading: CircleIconButton(
                  icon: Icons.arrow_back_ios_new_rounded,
                  onTap: () => context.pop(),
                ),
                actions: [
                  const CircleIconButton(icon: Icons.ios_share_outlined),
                  const SizedBox(width: 8),
                  CircleIconButton(
                    icon: Icons.favorite_rounded,
                    color: const Color(0xFFE35D4F),
                    onTap: () => controller.toggleFavorite(animal.id),
                  ),
                  const SizedBox(width: 12),
                ],
                flexibleSpace: FlexibleSpaceBar(
                  background: Stack(
                    fit: StackFit.expand,
                    children: [
                      AnimalImage(imagePath: animal.imagePath),
                      DecoratedBox(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.black.withValues(alpha: 0.1),
                              Colors.black.withValues(alpha: 0.2),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  transform: Matrix4.translationValues(0, -18, 0),
                  decoration: const BoxDecoration(
                    color: Color(0xFFF8F4ED),
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(28),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 120),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              animal.name,
                              style: const TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            const SizedBox(width: 10),
                            ...animal.tags.map(
                              (tag) => Padding(
                                padding: const EdgeInsets.only(right: 6),
                                child: StatusChip(
                                  text: tag.label,
                                  color: tag.color,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Text(
                          '${animal.location}・${animal.ageLabel}・${animal.genderLabel}',
                          style: const TextStyle(
                            color: Colors.black54,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 22),
                        const Text(
                          '基本資料',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        const SizedBox(height: 14),
                        InfoTable(
                          rows: [
                            ['品種', animal.breed],
                            ['毛色', animal.color],
                            ['體型', animal.size],
                            ['年齡', animal.ageLabel],
                            ['拾獲地點', animal.location],
                          ],
                        ),
                        const SizedBox(height: 22),
                        const Text(
                          '收容所資訊',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        const SizedBox(height: 14),
                        GestureDetector(
                          onTap: () => context.push('/shelter/${shelter.id}'),
                          child: Container(
                            padding: const EdgeInsets.all(18),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(22),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        shelter.name,
                                        style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w800,
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      Text(
                                        shelter.address,
                                        style: const TextStyle(
                                          color: Colors.black54,
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        shelter.phone,
                                        style: const TextStyle(
                                          color: Colors.black54,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const Icon(Icons.chevron_right_rounded),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            left: 20,
            right: 20,
            bottom: 20,
            child: Row(
              children: [
                Expanded(
                  child: FilledButton(
                    onPressed: () => context.push('/shelter/${shelter.id}'),
                    style: FilledButton.styleFrom(
                      backgroundColor: const Color(0xFF5E9B54),
                      padding: const EdgeInsets.symmetric(vertical: 18),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                    ),
                    child: const Text('聯絡收容所'),
                  ),
                ),
                const SizedBox(width: 12),
                const BottomAction(icon: Icons.ios_share_outlined, onTap: noop),
                const SizedBox(width: 12),
                BottomAction(
                  icon: Icons.favorite_rounded,
                  color: const Color(0xFFE35D4F),
                  onTap: () => controller.toggleFavorite(animal.id),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
