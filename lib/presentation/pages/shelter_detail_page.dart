import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

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
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
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
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                  const Icon(Icons.favorite_rounded, color: Color(0xFFE35D4F)),
                ],
              ),
              const SizedBox(height: 10),
              ClipRRect(
                borderRadius: BorderRadius.circular(28),
                child: Image.asset(
                  shelter.imagePath,
                  height: 220,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 16),
              IconInfoRow(icon: Icons.place_outlined, text: shelter.address),
              const SizedBox(height: 10),
              IconInfoRow(icon: Icons.phone_outlined, text: shelter.phone),
              const SizedBox(height: 10),
              IconInfoRow(
                icon: Icons.schedule_rounded,
                text: shelter.openingHours,
              ),
              const SizedBox(height: 18),
              const Row(
                children: [
                  Expanded(
                    child: StatCard(value: '32', label: '狗狗'),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: StatCard(value: '18', label: '貓咪'),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: StatCard(value: '50', label: '總數'),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              const Text(
                '可認養的毛孩',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
              ),
              const SizedBox(height: 14),
              SizedBox(
                height: 300,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: animals.length,
                  separatorBuilder: (_, _) => const SizedBox(width: 12),
                  itemBuilder: (context, index) {
                    final animal = animals[index];
                    return AnimalCard(
                      animal: animal,
                      width: MediaQuery.of(context).size.width - 40,
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
