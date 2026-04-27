import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/responsive/responsive.dart';
import '../../../../core/theme/adoption_theme.dart';
import '../controllers/adoption_controller.dart';
import '../widgets/legacy_ui.dart';

const _profileMenus = ['認養偏好設定', '我的瀏覽紀錄', '通知設定', '幫助與客服', '關於我們', '設定'];

class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(adoptionControllerProvider);

    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(
          context.w(20),
          context.h(18),
          context.w(20),
          context.h(24),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: context.w(62),
                  height: context.w(62),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage('assets/logo.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(width: context.w(14)),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '毛小孩愛心人',
                      style: TextStyle(
                        fontSize: context.sp(24),
                        fontWeight: FontWeight.w900,
                        color: AdoptionColors.textPrimary,
                      ),
                    ),
                    SizedBox(height: context.h(4)),
                    Text(
                      'love.pets@example.com',
                      style: const TextStyle(color: AdoptionColors.textMuted),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: context.h(22)),
            Row(
              children: [
                Expanded(
                  child: StatCard(
                    value: '${state.favoriteAnimals.length}',
                    label: '我的收藏',
                  ),
                ),
                SizedBox(width: context.w(10)),
                const Expanded(
                  child: StatCard(value: '3', label: '瀏覽紀錄'),
                ),
                SizedBox(width: context.w(10)),
                const Expanded(
                  child: StatCard(value: '2', label: '送養設定'),
                ),
              ],
            ),
            SizedBox(height: context.h(24)),
            ..._profileMenus.map((label) => ProfileMenuTile(label: label)),
          ],
        ),
      ),
    );
  }
}
