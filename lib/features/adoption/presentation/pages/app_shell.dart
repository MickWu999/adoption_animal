import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/adoption_theme.dart';
import '../controllers/adoption_controller.dart';

class AppShell extends ConsumerWidget {
  const AppShell({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  static const _labels = ['首頁', '搜尋', '收藏', '附近', '我的'];
  static const _icons = [
    Icons.home_rounded,
    Icons.search_rounded,
    Icons.favorite_border_rounded,
    Icons.place_outlined,
    Icons.person_outline_rounded,
  ];
  static const _selectedIcons = [
    Icons.home_rounded,
    Icons.search_rounded,
    Icons.favorite_rounded,
    Icons.place_rounded,
    Icons.person_rounded,
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTab = ref.watch(
      adoptionControllerProvider.select((state) => state.currentTab),
    );

    if (currentTab != navigationShell.currentIndex) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ref
            .read(adoptionControllerProvider.notifier)
            .syncCurrentTab(navigationShell.currentIndex);
      });
    }

    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: NavigationBar(
        selectedIndex: currentTab,
        labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
        destinations: List.generate(
          _labels.length,
          (index) => NavigationDestination(
            icon: Icon(_icons[index]),
            selectedIcon: Icon(
              _selectedIcons[index],
              color: AdoptionColors.primary,
            ),
            label: _labels[index],
          ),
        ),
        onDestinationSelected: (index) {
          ref.read(adoptionControllerProvider.notifier).selectTab(index);
          navigationShell.goBranch(index);
        },
      ),
    );
  }
}
