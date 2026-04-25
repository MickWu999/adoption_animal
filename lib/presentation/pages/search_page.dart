import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../domain/models/app_models.dart';
import '../controllers/adoption_controller.dart';
import '../widgets/legacy_ui.dart';
import '../widgets/search_filter_sheet.dart';

class SearchPage extends ConsumerStatefulWidget {
  const SearchPage({super.key});

  @override
  ConsumerState<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends ConsumerState<SearchPage> {
  @override
  Widget build(BuildContext context) {
    final state = ref.watch(adoptionControllerProvider);
    final controller = ref.read(adoptionControllerProvider.notifier);
    final results = state.filteredAnimals;
    final hasActiveFilters = state.activeFilterLabels.isNotEmpty;

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Expanded(
                  child: Text(
                    '尋找毛孩',
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w900,
                      letterSpacing: -0.5,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () =>
                      _openFilterSheet(context, state.searchFilters),
                  icon: const Icon(Icons.tune_rounded),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute<void>(
                        builder: (_) => const StatesPreviewPage(),
                      ),
                    );
                  },
                  icon: const Icon(Icons.layers_outlined),
                ),
              ],
            ),
            const SizedBox(height: 16),
            if (hasActiveFilters)
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: FilterChipCard(
                        label: '篩選',
                        selected: true,
                        onTap: () =>
                            _openFilterSheet(context, state.searchFilters),
                      ),
                    ),
                    ...state.activeFilterLabels.map(
                      (label) => Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: FilterChipCard(
                          label: label,
                          selected: true,
                          onTap: () =>
                              _openFilterSheet(context, state.searchFilters),
                        ),
                      ),
                    ),
                    FilterChipCard(
                      label: '清除',
                      selected: false,
                      onTap: controller.resetSearch,
                    ),
                  ],
                ),
              ),
            const SizedBox(height: 18),
            Expanded(
              child: results.isEmpty
                  ? Center(
                      child: EmptyStatePanel(
                        imagePath:
                            'assets/images/others_animals/melissa-keizer-X-0FisCRIaA-unsplash.jpg',
                        title: '找不到符合條件的毛孩',
                        message: '試試調整篩選條件或放寬範圍',
                        actionLabel: '清除篩選',
                        onPressed: controller.resetSearch,
                        icon: Icons.search_off_rounded,
                      ),
                    )
                  : ListView(
                      padding: const EdgeInsets.only(bottom: 24),
                      children: [
                        Row(
                          children: [
                            Text(
                              hasActiveFilters
                                  ? '共 ${results.length} 隻符合條件'
                                  : '全部毛孩 (${results.length})',
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            const Spacer(),
                            if (hasActiveFilters)
                              TextButton(
                                onPressed: controller.resetSearch,
                                child: const Text('清除'),
                              ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        ...results.map(
                          (animal) => Padding(
                            padding: const EdgeInsets.only(bottom: 16),
                            child: AnimalCard(
                              animal: animal,
                              onTap: () => context.push('/animal/${animal.id}'),
                              onFavoriteTap: () => ref
                                  .read(adoptionControllerProvider.notifier)
                                  .toggleFavorite(animal.id),
                            ),
                          ),
                        ),
                      ],
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _openFilterSheet(
    BuildContext context,
    SearchFilters initialFilters,
  ) async {
    final result = await showModalBottomSheet<SearchFilters>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => FilterBottomSheet(initialFilters: initialFilters),
    );
    if (!mounted || result == null) {
      return;
    }
    ref.read(adoptionControllerProvider.notifier).updateSearchFilters(result);
  }
}

class StatesPreviewPage extends StatelessWidget {
  const StatesPreviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F4ED),
      appBar: AppBar(
        title: const Text('狀態預覽'),
        backgroundColor: Colors.transparent,
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 24),
        children: const [
          Text(
            '空狀態',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
          ),
          SizedBox(height: 14),
          PreviewCard(
            child: EmptyStatePanel(
              imagePath: 'assets/images/dog/alvan-nee-T-0EW-SEbsE-unsplash.jpg',
              title: '還沒有收藏任何毛孩',
              message: '快去尋找喜歡的毛孩，加入收藏吧',
              actionLabel: '去尋找毛孩',
              onPressed: noop,
              icon: Icons.favorite_border_rounded,
            ),
          ),
          SizedBox(height: 12),
          PreviewCard(
            child: EmptyStatePanel(
              imagePath:
                  'assets/images/others_animals/melissa-keizer-X-0FisCRIaA-unsplash.jpg',
              title: '找不到符合條件的毛孩',
              message: '試試調整關鍵字、篩選條件或附近範圍',
              actionLabel: '清除篩選',
              onPressed: noop,
              icon: Icons.search_off_rounded,
            ),
          ),
          SizedBox(height: 12),
          PreviewCard(
            child: EmptyStatePanel(
              imagePath: 'assets/images/shaltar/sheltar.jpg',
              title: '附近沒有收容所',
              message: '請嘗試打開定位或放寬搜尋範圍',
              actionLabel: '重新定位',
              onPressed: noop,
              icon: Icons.location_off_rounded,
            ),
          ),
          SizedBox(height: 20),
          Text(
            '載入 / 錯誤',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
          ),
          SizedBox(height: 14),
          PreviewCard(
            child: LoadingStatePanel(title: '資料載入中...', message: '請稍候片刻'),
          ),
          SizedBox(height: 12),
          PreviewCard(
            child: ErrorStatePanel(
              icon: Icons.broken_image_outlined,
              title: '圖片載入失敗',
              message: '點擊重新載入',
              actionLabel: '重新載入',
            ),
          ),
          SizedBox(height: 12),
          PreviewCard(
            child: ErrorStatePanel(
              icon: Icons.wifi_off_rounded,
              title: '網路連線異常',
              message: '請檢查網路設定後再試一次',
              actionLabel: '重試',
              secondaryLabel: '回首頁',
            ),
          ),
        ],
      ),
    );
  }
}
