import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/responsive/responsive.dart';
import '../../../../core/theme/adoption_theme.dart';
import '../controllers/adoption_controller.dart';
import '../widgets/legacy_ui.dart';

class NearbyPage extends ConsumerWidget {
  const NearbyPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final shelters = ref.watch(
      adoptionControllerProvider.select((state) => state.shelters),
    );

    return SafeArea(
      child: Padding(
        padding: EdgeInsets.fromLTRB(
          context.w(20),
          context.h(16),
          context.w(20),
          context.h(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                '附近的收容所',
                style: TextStyle(
                  fontSize: context.sp(24),
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
            SizedBox(height: context.h(16)),
            Container(
              height: context.h(230),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(context.r(28)),
                image: const DecorationImage(
                  image: AssetImage('assets/images/shaltar/sheltar.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(context.r(28)),
                  color: AdoptionColors.mapOverlay,
                ),
                child: const Stack(
                  children: [
                    Positioned(top: 34, left: 56, child: MapPin()),
                    Positioned(top: 72, right: 64, child: MapPin()),
                    Positioned(
                      bottom: 50,
                      left: 140,
                      child: MapPin(active: true),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: context.h(16)),
            Expanded(
              child: ListView.separated(
                itemCount: shelters.length,
                separatorBuilder: (_, _) => SizedBox(height: context.h(12)),
                itemBuilder: (context, index) {
                  final shelter = shelters[index];
                  return GestureDetector(
                    onTap: () => context.push('/shelter/${shelter.id}'),
                    child: Container(
                      padding: EdgeInsets.all(context.w(12)),
                      decoration: BoxDecoration(
                        color: AdoptionColors.surface,
                        borderRadius: BorderRadius.circular(context.r(22)),
                      ),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(context.r(16)),
                            child: AnimalImage(
                              imagePath: shelter.imagePath,
                              width: context.w(82),
                              height: context.w(82),
                            ),
                          ),
                          SizedBox(width: context.w(14)),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  shelter.name,
                                  style: TextStyle(
                                    fontSize: context.sp(15),
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                                SizedBox(height: context.h(4)),
                                Text(
                                  '距離 ${shelter.distance}・${shelter.capacity}',
                                  style: TextStyle(
                                    fontSize: context.sp(13),
                                    color: AdoptionColors.textMuted,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          CircleAvatar(
                            radius: context.r(20),
                            backgroundColor: AdoptionColors.successSoft,
                            child: Icon(
                              Icons.call_rounded,
                              size: context.sp(18),
                              color: AdoptionColors.primary,
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
