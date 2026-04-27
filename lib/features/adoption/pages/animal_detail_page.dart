import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/responsive/responsive.dart';
import '../../../../core/theme/adoption_theme.dart';
import '../controllers/adoption_controller.dart';
import '../widgets/action_button.dart';
import '../widgets/legacy_ui.dart';

class AnimalDetailPage extends ConsumerWidget {
  const AnimalDetailPage({super.key, required this.animalId});

  final String animalId;

  void _showShareFeedback(BuildContext context, String animalName) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text('準備分享 $animalName')));
  }

  void _showCallFeedback(BuildContext context, String phone) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text('準備撥打 $phone')));
  }

  void _showNavigationFeedback(BuildContext context, String shelterName) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text('準備導航到 $shelterName')));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final animal = ref.watch(animalProvider(animalId));
    final shelter = ref.watch(shelterForAnimalProvider(animalId));
    final controller = ref.read(adoptionControllerProvider.notifier);

    if (animal == null || shelter == null) {
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
      bottomNavigationBar: SafeArea(
        minimum: EdgeInsets.fromLTRB(
          context.w(20),
          context.h(8),
          context.w(20),
          context.h(16),
        ),
        child: _BottomAction(
          isFavorite: animal.isFavorite,
          onShare: () => _showShareFeedback(context, animal.name),
          onFavorite: () => controller.toggleFavorite(animal.id),
        ),
      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Stack(
                children: [
                  SizedBox(
                    height: context.h(360),
                    width: double.infinity,
                    child: AnimalImage(imagePath: animal.imagePath),
                  ),
                  Positioned(
                    top: context.h(8),
                    left: context.w(8),
                    child: IconButton(
                      onPressed: () => context.pop(),
                      icon: const Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Positioned(
                    top: context.h(8),
                    right: context.w(8),
                    child: PopupMenuButton<_AnimalDetailAction>(
                      icon: const Icon(
                        Icons.more_horiz_rounded,
                        color: Colors.white,
                      ),
                      color: AdoptionColors.surface,
                      surfaceTintColor: Colors.transparent,
                      onSelected: (value) {
                        switch (value) {
                          case _AnimalDetailAction.report:
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('已開啟回報狀況')),
                            );
                        }
                      },
                      itemBuilder: (context) => const [
                        PopupMenuItem(
                          value: _AnimalDetailAction.report,
                          child: Text('回報狀況'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                decoration: const BoxDecoration(
                  color: AdoptionColors.background,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
                ),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(
                    context.w(20),
                    context.h(20),
                    context.w(20),
                    context.h(28),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              animal.name,
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: context.sp(30),
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Wrap(
                        spacing: context.w(6),
                        runSpacing: context.h(6),
                        children: animal.tags
                            .map(
                              (tag) =>
                                  StatusChip(text: tag.label, color: tag.color),
                            )
                            .toList(),
                      ),
                      SizedBox(height: context.h(8)),
                      Text(
                        '${animal.location}・${animal.ageLabel}・${animal.genderLabel}',
                        style: TextStyle(
                          color: AdoptionColors.textMuted,
                          fontWeight: FontWeight.w600,
                          fontSize: context.sp(14),
                        ),
                      ),
                      SizedBox(height: context.h(22)),
                      Text(
                        '基本資料',
                        style: TextStyle(
                          fontSize: context.sp(18),
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      SizedBox(height: context.h(14)),
                      InfoTable(
                        rows: [
                          ['品種', animal.breed],
                          ['毛色', animal.color],
                          ['體型', animal.size],
                          ['年齡', animal.ageLabel],
                          ['拾獲地點', animal.location],
                          ['id', animal.id],
                        ],
                      ),
                      SizedBox(height: context.h(22)),
                      Row(
                        children: [
                          Text(
                            '收容所資訊',
                            style: TextStyle(
                              fontSize: context.sp(18),
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          const Spacer(),
                          CircleActionButton(
                            icon: Icons.call_rounded,
                            onTap: () =>
                                _showCallFeedback(context, shelter.phone),
                          ),
                          SizedBox(width: context.w(10)),
                          CircleActionButton(
                            icon: Icons.near_me_rounded,
                            onTap: () =>
                                _showNavigationFeedback(context, shelter.name),
                          ),
                        ],
                      ),
                      SizedBox(height: context.h(14)),
                      GestureDetector(
                        onTap: () => context.push('/shelter/${shelter.id}'),
                        child: Container(
                          padding: EdgeInsets.all(context.w(18)),
                          decoration: BoxDecoration(
                            color: AdoptionColors.surface,
                            borderRadius: BorderRadius.circular(context.r(22)),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      shelter.name,
                                      style: TextStyle(
                                        fontSize: context.sp(18),
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),
                                    SizedBox(height: context.h(8)),
                                    Text(
                                      shelter.address,
                                      style: TextStyle(
                                        color: AdoptionColors.textMuted,
                                        fontSize: context.sp(14),
                                      ),
                                    ),
                                    SizedBox(height: context.h(4)),
                                    Text(
                                      shelter.phone,
                                      style: TextStyle(
                                        color: AdoptionColors.textMuted,
                                        fontSize: context.sp(14),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
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
      ),
    );
  }
}

enum _AnimalDetailAction { report }

class _BottomAction extends StatelessWidget {
  const _BottomAction({
    required this.isFavorite,
    required this.onShare,
    required this.onFavorite,
  });

  final bool isFavorite;
  final VoidCallback onShare;
  final VoidCallback onFavorite;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            height: context.h(54),
            child: FilledButton.icon(
              onPressed: onShare,
              style: FilledButton.styleFrom(
                backgroundColor: AdoptionColors.primary,
                foregroundColor: Colors.white,
                elevation: 0,
                textStyle: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: context.sp(15),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(context.r(18)),
                ),
              ),
              icon: const Icon(Icons.ios_share_rounded, size: 20),
              label: const Text('分享'),
            ),
          ),
        ),
        SizedBox(width: context.w(12)),
        Expanded(
          child: SizedBox(
            height: context.h(54),
            child: FilledButton.icon(
              onPressed: onFavorite,
              style: FilledButton.styleFrom(
                backgroundColor: isFavorite
                    ? AdoptionColors.danger
                    : AdoptionColors.danger.withValues(alpha: 0.11),
                foregroundColor: isFavorite
                    ? Colors.white
                    : AdoptionColors.danger,
                elevation: 0,
                textStyle: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: context.sp(15),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(context.r(18)),
                ),
              ),
              icon: Icon(
                isFavorite
                    ? Icons.favorite_rounded
                    : Icons.favorite_border_rounded,
                size: 20,
              ),
              label: Text(isFavorite ? '已收藏' : '收藏'),
            ),
          ),
        ),
      ],
    );
  }
}
