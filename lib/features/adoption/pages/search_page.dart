import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/responsive/responsive.dart';
import '../../../../core/theme/adoption_theme.dart';
import '../controllers/adoption_controller.dart';
import '../models/app_models.dart';
import '../widgets/legacy_ui.dart';
import '../widgets/search_filter_sheet.dart';
import '../widgets/search_sections.dart';

class SearchPage extends ConsumerStatefulWidget {
  const SearchPage({super.key});

  @override
  ConsumerState<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends ConsumerState<SearchPage> {
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()..addListener(_handleScroll);
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_handleScroll)
      ..dispose();
    super.dispose();
  }

  void _handleScroll() {
    if (!_scrollController.hasClients) {
      return;
    }

    final state = ref.read(adoptionControllerProvider);
    if (!state.canLoadNextSearchPage) {
      return;
    }

    final position = _scrollController.position;
    if (position.pixels < position.maxScrollExtent - 240) {
      return;
    }

    ref.read(adoptionControllerProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(adoptionControllerProvider);
    final controller = ref.read(adoptionControllerProvider.notifier);
    final results = state.searchResults;

    return SafeArea(
      child: Padding(
        padding: EdgeInsets.fromLTRB(
          context.w(20),
          context.h(16),
          context.w(20),
          0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    '尋找毛孩',
                    style: TextStyle(
                      fontSize: context.sp(26),
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
            SizedBox(height: context.h(16)),
            if (state.shouldShowSearchFilterBar)
              SearchFilterBar(
                labels: state.activeFilterLabels,
                searchFilters: state.searchFilters,
                onOpenFilters: (filters) => _openFilterSheet(context, filters),
                onReset: controller.resetSearch,
              ),
            SizedBox(height: context.h(18)),
            Expanded(
              child: state.shouldShowSearchLoading
                  ? const Center(child: CircularProgressIndicator())
                  : state.shouldShowSearchEmptyState
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
                  : SearchResultsList(
                      scrollController: _scrollController,
                      results: results,
                      // resultsHeadline: state.searchResultsHeadline,
                      shouldShowClearAction: state.shouldShowSearchClearAction,
                      shouldShowLoadMoreIndicator:
                          state.shouldShowSearchLoadMoreIndicator,
                      shouldShowLoadMoreTerminator:
                          state.shouldShowSearchLoadMoreTerminator,
                      onReset: controller.resetSearch,
                      onToggleFavorite: controller.toggleFavorite,
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _openFilterSheet(
    BuildContext context,
    AnimalSearchParams initialFilters,
  ) async {
    final result = await showModalBottomSheet<AnimalSearchParams>(
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
      backgroundColor: AdoptionColors.background,
      appBar: AppBar(
        title: const Text('狀態預覽'),
        backgroundColor: Colors.transparent,
      ),
      body: ListView(
        padding: EdgeInsets.fromLTRB(
          context.w(20),
          context.h(8),
          context.w(20),
          context.h(24),
        ),
        children: [
          Text(
            '空狀態',
            style: TextStyle(
              fontSize: context.sp(20),
              fontWeight: FontWeight.w900,
            ),
          ),
          SizedBox(height: context.h(14)),
          const PreviewCard(
            child: EmptyStatePanel(
              imagePath: 'assets/images/dog/alvan-nee-T-0EW-SEbsE-unsplash.jpg',
              title: '還沒有收藏任何毛孩',
              message: '快去尋找喜歡的毛孩，加入收藏吧',
              actionLabel: '去尋找毛孩',
              onPressed: noop,
              icon: Icons.favorite_border_rounded,
            ),
          ),
          SizedBox(height: context.h(12)),
          const PreviewCard(
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
          SizedBox(height: context.h(12)),
          const PreviewCard(
            child: EmptyStatePanel(
              imagePath: 'assets/images/shaltar/sheltar.jpg',
              title: '附近沒有收容所',
              message: '請嘗試打開定位或放寬搜尋範圍',
              actionLabel: '重新定位',
              onPressed: noop,
              icon: Icons.location_off_rounded,
            ),
          ),
          SizedBox(height: context.h(20)),
          Text(
            '載入 / 錯誤',
            style: TextStyle(
              fontSize: context.sp(20),
              fontWeight: FontWeight.w900,
            ),
          ),
          SizedBox(height: context.h(14)),
          const PreviewCard(
            child: LoadingStatePanel(title: '資料載入中...', message: '請稍候片刻'),
          ),
          SizedBox(height: context.h(12)),
          const PreviewCard(
            child: ErrorStatePanel(
              icon: Icons.broken_image_outlined,
              title: '圖片載入失敗',
              message: '點擊重新載入',
              actionLabel: '重新載入',
            ),
          ),
          SizedBox(height: context.h(12)),
          const PreviewCard(
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
