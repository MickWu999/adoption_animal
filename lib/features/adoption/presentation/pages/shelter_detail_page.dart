import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/responsive/responsive.dart';
import '../controllers/adoption_controller.dart';
import '../widgets/legacy_ui.dart';

class ShelterDetailPage extends ConsumerWidget {
  const ShelterDetailPage({super.key, required this.shelterId});

  final String shelterId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final shelter = ref.watch(shelterProvider(shelterId));
    final animals = ref.watch(animalsForShelterProvider(shelterId));

    if (shelter == null) {
      return Scaffold(
        body: Center(
          child: EmptyStatePanel(
            imagePath: 'assets/images/shaltar/sheltar.jpg',
            title: '找不到收容所資料',
            message: '請返回上一頁重新選擇收容所',
            actionLabel: '返回',
            onPressed: () => context.pop(),
            icon: Icons.location_off_rounded,
          ),
        ),
      );
    }

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(
            context.w(20),
            context.h(16),
            context.w(20),
            context.h(24),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () => context.pop(),
                    icon: const Icon(Icons.arrow_back_ios_new_rounded),
                  ),
                  Expanded(
                    child: Text(
                      shelter.name,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: context.sp(20),
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                  const Icon(Icons.favorite_rounded, color: Color(0xFFE35D4F)),
                ],
              ),
              SizedBox(height: context.h(10)),
              ClipRRect(
                borderRadius: BorderRadius.circular(context.r(28)),
                child: AnimalImage(
                  imagePath: shelter.imagePath,
                  height: context.h(220),
                  width: double.infinity,
                ),
              ),
              SizedBox(height: context.h(16)),
              IconInfoRow(icon: Icons.place_outlined, text: shelter.address),
              SizedBox(height: context.h(10)),
              IconInfoRow(icon: Icons.phone_outlined, text: shelter.phone),
              SizedBox(height: context.h(10)),
              IconInfoRow(
                icon: Icons.schedule_rounded,
                text: shelter.openingHours,
              ),
              SizedBox(height: context.h(18)),
              Row(
                children: [
                  Expanded(
                    child: StatCard(value: '32', label: '狗狗'),
                  ),
                  SizedBox(width: context.w(10)),
                  Expanded(
                    child: StatCard(value: '18', label: '貓咪'),
                  ),
                  SizedBox(width: context.w(10)),
                  Expanded(
                    child: StatCard(value: '50', label: '總數'),
                  ),
                ],
              ),
              SizedBox(height: context.h(24)),
              Text(
                '可認養的毛孩',
                style: TextStyle(
                  fontSize: context.sp(18),
                  fontWeight: FontWeight.w800,
                ),
              ),
              SizedBox(height: context.h(14)),
              SizedBox(
                height: context.h(300),
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: animals.length,
                  separatorBuilder: (_, _) => SizedBox(width: context.w(12)),
                  itemBuilder: (context, index) {
                    final animal = animals[index];
                    return AnimalCard(
                      animal: animal,
                      width: MediaQuery.of(context).size.width - context.w(40),
                      onTap: () => context.push('/animal/${animal.id}'),
                      onFavoriteTap: () => ref
                          .read(adoptionControllerProvider.notifier)
                          .toggleFavorite(animal.id),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
