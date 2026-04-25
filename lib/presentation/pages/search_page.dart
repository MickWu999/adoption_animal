import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../data/mock_data.dart';
import '../../domain/models/app_models.dart';
import '../controllers/adoption_controller.dart';
import '../widgets/legacy_ui.dart';

class SearchPage extends ConsumerStatefulWidget {
  const SearchPage({super.key});

  @override
  ConsumerState<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends ConsumerState<SearchPage> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(
      text: ref.read(adoptionControllerProvider).searchQuery,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(adoptionControllerProvider);
    final controller = ref.read(adoptionControllerProvider.notifier);
    final hasQuery = state.searchQuery.trim().isNotEmpty;
    final results = state.filteredAnimals;

    if (_controller.text != state.searchQuery) {
      _controller.value = _controller.value.copyWith(
        text: state.searchQuery,
        selection: TextSelection.collapsed(offset: state.searchQuery.length),
      );
    }

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: RoundedSearchField(
                    hintText: '搜尋品種、地區或關鍵字',
                    controller: _controller,
                    onChanged: controller.updateSearchQuery,
                    onSubmitted: (_) => context.push('/search/results'),
                    suffixIcon: IconButton(
                      onPressed: () => context.push('/search/results'),
                      icon: const Icon(Icons.north_east_rounded),
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
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: state.activeFilterLabels
                    .map(
                      (label) => Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: FilterChipCard(
                          label: label,
                          selected: true,
                          onTap: () =>
                              _openFilterSheet(context, state.searchFilters),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
            const SizedBox(height: 18),
            if (hasQuery)
              Expanded(
                child: results.isEmpty
                    ? Center(
                        child: EmptyStatePanel(
                          imagePath:
                              'assets/images/others_animals/melissa-keizer-X-0FisCRIaA-unsplash.jpg',
                          title: '找不到符合條件的毛孩',
                          message: '試試調整關鍵字、篩選條件或附近範圍',
                          actionLabel: '清除篩選',
                          onPressed: controller.resetSearch,
                          icon: Icons.search_off_rounded,
                        ),
                      )
                    : ListView(
                        children: [
                          Row(
                            children: [
                              Text(
                                '搜尋結果 (${results.length})',
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              const Spacer(),
                              TextButton(
                                onPressed: () =>
                                    context.push('/search/results'),
                                child: const Text('查看全部'),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          ...results
                              .take(3)
                              .map(
                                (animal) => Padding(
                                  padding: const EdgeInsets.only(bottom: 12),
                                  child: AnimalListTile(
                                    animal: animal,
                                    onTap: () =>
                                        context.push('/animal/${animal.id}'),
                                  ),
                                ),
                              ),
                        ],
                      ),
              )
            else ...[
              const Text(
                '熱門搜尋',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
              ),
              const SizedBox(height: 14),
              const Wrap(
                spacing: 10,
                runSpacing: 10,
                children: [
                  TagPill(label: '幼犬'),
                  TagPill(label: '幼貓'),
                  TagPill(label: '黑色貓咪'),
                  TagPill(label: '米克斯'),
                  TagPill(label: '已絕育'),
                ],
              ),
              const SizedBox(height: 24),
              const Text(
                '推薦分類',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
              ),
              const SizedBox(height: 14),
              Row(
                children: List.generate(
                  3,
                  (index) => Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(right: index == 2 ? 0 : 12),
                      child: CategoryCard(
                        animal: state.animals[index],
                        label: categoryLabels[index],
                        count: categoryCounts[index],
                        onTap: () => context.push('/search/results'),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                '最近搜尋',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
              ),
              const SizedBox(height: 14),
              ...recentSearches.map(
                (item) => ListTile(
                  contentPadding: EdgeInsets.zero,
                  dense: true,
                  leading: const Icon(Icons.history_rounded, size: 18),
                  title: Text(item),
                  onTap: () => controller.updateSearchQuery(item),
                ),
              ),
            ],
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

class SearchResultsPage extends ConsumerWidget {
  const SearchResultsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(adoptionControllerProvider);
    final animals = state.filteredAnimals;

    return Scaffold(
      backgroundColor: const Color(0xFFF8F4ED),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () => context.pop(),
                    icon: const Icon(Icons.arrow_back_ios_new_rounded),
                  ),
                  const Text(
                    '搜尋結果',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () async {
                      final result = await showModalBottomSheet<SearchFilters>(
                        context: context,
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        builder: (_) => FilterBottomSheet(
                          initialFilters: state.searchFilters,
                        ),
                      );
                      if (context.mounted && result != null) {
                        ref
                            .read(adoptionControllerProvider.notifier)
                            .updateSearchFilters(result);
                      }
                    },
                    child: const Text('篩選'),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                state.searchQuery.isEmpty
                    ? '共 ${animals.length} 隻結果'
                    : '「${state.searchQuery}」共 ${animals.length} 隻結果',
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.black54,
                ),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: animals.isEmpty
                    ? Center(
                        child: EmptyStatePanel(
                          imagePath:
                              'assets/images/others_animals/melissa-keizer-X-0FisCRIaA-unsplash.jpg',
                          title: '搜尋無結果',
                          message: '沒有找到符合條件的毛孩，試試放寬篩選條件',
                          actionLabel: '重新搜尋',
                          onPressed: () => context.pop(),
                          icon: Icons.search_off_rounded,
                        ),
                      )
                    : GridView.builder(
                        itemCount: animals.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 14,
                              crossAxisSpacing: 14,
                              childAspectRatio: 0.66,
                            ),
                        itemBuilder: (context, index) {
                          final animal = animals[index];
                          return AnimalCard(
                            animal: animal,
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

class FilterBottomSheet extends StatefulWidget {
  const FilterBottomSheet({super.key, required this.initialFilters});

  final SearchFilters initialFilters;

  @override
  State<FilterBottomSheet> createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  late SearchFilters _filters = widget.initialFilters;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFFF7F4EE),
        borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
      ),
      padding: const EdgeInsets.fromLTRB(20, 14, 20, 24),
      child: SafeArea(
        top: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Spacer(),
                Container(
                  width: 48,
                  height: 4,
                  decoration: BoxDecoration(
                    color: const Color(0xFFD4CEC4),
                    borderRadius: BorderRadius.circular(999),
                  ),
                ),
                const Spacer(),
              ],
            ),
            const SizedBox(height: 18),
            Row(
              children: [
                const Text(
                  '篩選條件',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w900),
                ),
                const Spacer(),
                TextButton(
                  onPressed: () {
                    setState(() {
                      _filters = SearchFilters.defaults();
                    });
                  },
                  child: const Text('重設'),
                ),
              ],
            ),
            const SizedBox(height: 18),
            FilterSection(
              title: '地區（可多選）',
              children: taiwanAreas
                  .map(
                    (item) => SelectablePill(
                      label: item,
                      selected: _filters.areas.contains(item),
                      onTap: () => setState(() {
                        _filters = _filters.toggleArea(item);
                      }),
                    ),
                  )
                  .toList(),
            ),
            const SizedBox(height: 18),
            FilterSection(
              title: '種類',
              children: animalTypes
                  .map(
                    (item) => SelectablePill(
                      label: item,
                      selected: _filters.types.contains(item),
                      onTap: () => setState(() {
                        _filters = _filters.toggleType(item);
                      }),
                    ),
                  )
                  .toList(),
            ),
            const SizedBox(height: 18),
            FilterSection(
              title: '年齡',
              children: ageFilters
                  .map(
                    (item) => SelectablePill(
                      label: item,
                      selected: _filters.ages.contains(item),
                      onTap: () => setState(() {
                        _filters = _filters.toggleAge(item);
                      }),
                    ),
                  )
                  .toList(),
            ),
            const SizedBox(height: 18),
            FilterSection(
              title: '性別',
              children: genderFilters
                  .map(
                    (item) => SelectablePill(
                      label: item,
                      selected: _filters.genders.contains(item),
                      onTap: () => setState(() {
                        _filters = _filters.toggleGender(item);
                      }),
                    ),
                  )
                  .toList(),
            ),
            const SizedBox(height: 18),
            FilterSection(
              title: '體型',
              children: sizeFilters
                  .map(
                    (item) => SelectablePill(
                      label: item,
                      selected: _filters.sizes.contains(item),
                      onTap: () => setState(() {
                        _filters = _filters.toggleSize(item);
                      }),
                    ),
                  )
                  .toList(),
            ),
            const SizedBox(height: 18),
            FilterSection(
              title: '是否絕育',
              children: neuterFilters
                  .map(
                    (item) => SelectablePill(
                      label: item,
                      selected: _filters.neuter.contains(item),
                      onTap: () => setState(() {
                        _filters = _filters.toggleNeuter(item);
                      }),
                    ),
                  )
                  .toList(),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: () => Navigator.of(context).pop(_filters),
                style: FilledButton.styleFrom(
                  backgroundColor: const Color(0xFF4F8A3F),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: Text(
                  '查看結果 (${_filters.areas.length + _filters.types.length + _filters.ages.length + 120})',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
