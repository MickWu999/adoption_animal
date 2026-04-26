import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/mock_data.dart';
import '../controllers/adoption_controller.dart';
import '../widgets/legacy_ui.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(adoptionControllerProvider);

    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(20, 18, 20, 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 62,
                  height: 62,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage('assets/logo.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 14),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '毛小孩愛心人',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'love.pets@example.com',
                      style: TextStyle(color: Colors.black54),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 22),
            Row(
              children: [
                Expanded(
                  child: StatCard(
                    value: '${state.favoriteAnimals.length}',
                    label: '我的收藏',
                  ),
                ),
                const SizedBox(width: 10),
                const Expanded(
                  child: StatCard(value: '3', label: '瀏覽紀錄'),
                ),
                const SizedBox(width: 10),
                const Expanded(
                  child: StatCard(value: '2', label: '送養設定'),
                ),
              ],
            ),
            const SizedBox(height: 24),
            ...profileMenus.map((label) => ProfileMenuTile(label: label)),
          ],
        ),
      ),
    );
  }
}
