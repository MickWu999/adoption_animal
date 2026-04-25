import 'package:flutter/material.dart';

import 'data/mock_data.dart';
import 'models/app_models.dart';

void main() {
  runApp(const MyApp());
}

void _noop() {}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const baseColor = Color(0xFF4F8A3F);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '浪愛回家',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFF8F4ED),
        colorScheme: ColorScheme.fromSeed(
          seedColor: baseColor,
          brightness: Brightness.light,
          primary: baseColor,
          secondary: const Color(0xFFF2C14E),
          surface: Colors.white,
        ),
        fontFamily: 'PingFang TC',
      ),
      home: const AdoptionApp(),
    );
  }
}

class AdoptionApp extends StatefulWidget {
  const AdoptionApp({super.key});

  @override
  State<AdoptionApp> createState() => _AdoptionAppState();
}

class _AdoptionAppState extends State<AdoptionApp> {
  int _currentIndex = 0;

  late final List<Widget> _pages = [
    HomePage(
      animals: demoAnimals,
      onOpenNotifications: _openNotifications,
      onOpenAnimal: _openAnimal,
    ),
    SearchPage(animals: demoAnimals, onOpenAnimal: _openAnimal),
    FavoritesPage(
      animals: demoAnimals.where((animal) => animal.isFavorite).toList(),
      onOpenAnimal: _openAnimal,
    ),
    NearbyPage(shelters: demoShelters, onOpenShelter: _openShelter),
    const ProfilePage(),
  ];

  void _openNotifications() {
    Navigator.of(
      context,
    ).push(MaterialPageRoute<void>(builder: (_) => const NotificationsPage()));
  }

  void _openAnimal(Animal animal) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (_) => AnimalDetailPage(
          animal: animal,
          shelter: demoShelters.firstWhere(
            (item) => item.name == animal.shelterName,
            orElse: () => demoShelters.first,
          ),
          onOpenShelter: _openShelter,
        ),
      ),
    );
  }

  void _openShelter(Shelter shelter) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (_) => ShelterDetailPage(
          shelter: shelter,
          animals: demoAnimals
              .where((animal) => animal.shelterName == shelter.name)
              .toList(),
          onOpenAnimal: _openAnimal,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    const labels = ['首頁', '搜尋', '收藏', '附近', '我的'];
    const icons = [
      Icons.home_rounded,
      Icons.search_rounded,
      Icons.favorite_border_rounded,
      Icons.place_outlined,
      Icons.person_outline_rounded,
    ];
    const selectedIcons = [
      Icons.home_rounded,
      Icons.search_rounded,
      Icons.favorite_rounded,
      Icons.place_rounded,
      Icons.person_rounded,
    ];

    return Scaffold(
      body: IndexedStack(index: _currentIndex, children: _pages),
      bottomNavigationBar: NavigationBar(
        height: 74,
        backgroundColor: Colors.white,
        indicatorColor: const Color(0xFFE7F3E2),
        selectedIndex: _currentIndex,
        labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
        onDestinationSelected: (value) {
          setState(() {
            _currentIndex = value;
          });
        },
        destinations: List.generate(
          labels.length,
          (index) => NavigationDestination(
            icon: Icon(icons[index]),
            selectedIcon: Icon(
              selectedIcons[index],
              color: const Color(0xFF4F8A3F),
            ),
            label: labels[index],
          ),
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
    required this.animals,
    required this.onOpenNotifications,
    required this.onOpenAnimal,
  });

  final List<Animal> animals;
  final VoidCallback onOpenNotifications;
  final ValueChanged<Animal> onOpenAnimal;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 12, 20, 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on_rounded,
                        color: Color(0xFF4F8A3F),
                        size: 18,
                      ),
                      const SizedBox(width: 6),
                      const Text(
                        '台南市',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const Icon(Icons.keyboard_arrow_down_rounded),
                      const Spacer(),
                      IconButton(
                        onPressed: onOpenNotifications,
                        icon: const Icon(Icons.notifications_none_rounded),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Container(
                    height: 126,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(26),
                      image: const DecorationImage(
                        image: AssetImage('assets/images/dog/login_dog.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(26),
                        gradient: LinearGradient(
                          colors: [
                            Colors.black.withValues(alpha: 0.45),
                            Colors.black.withValues(alpha: 0.1),
                          ],
                        ),
                      ),
                      padding: const EdgeInsets.all(22),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text(
                                  '領養代替購買',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 28,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  '給牠一個溫暖的家',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: 48,
                            height: 48,
                            decoration: BoxDecoration(
                              color: Colors.white.withValues(alpha: 0.16),
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.favorite_border_rounded,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 18),
                  const RoundedSearchField(hintText: '搜尋品種、地區或收容所'),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(
                      homeCategories.length,
                      (index) =>
                          _QuickCategoryChip(item: homeCategories[index]),
                    ),
                  ),
                  const SizedBox(height: 10),
                  _SectionHeader(
                    title: '最新來的毛孩',
                    actionLabel: '查看更多',
                    onTap: () {},
                  ),
                  const SizedBox(height: 6),
                  SizedBox(
                    height: 205,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: animals.length,
                      separatorBuilder: (_, _) => const SizedBox(width: 14),
                      itemBuilder: (context, index) {
                        return AnimalCard(
                          animal: animals[index],
                          width: 112,
                          onTap: () => onOpenAnimal(animals[index]),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 24),
                  _SectionHeader(
                    title: '熱門藏養 TOP10',
                    actionLabel: '查看更多',
                    onTap: () {},
                  ),
                  const SizedBox(height: 14),
                  ...animals
                      .take(3)
                      .map(
                        (animal) => Padding(
                          padding: const EdgeInsets.only(bottom: 12),
                          child: ListTile(
                            tileColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            leading: CircleAvatar(
                              backgroundImage: AssetImage(animal.imagePath),
                            ),
                            title: Text(
                              animal.name,
                              style: const TextStyle(
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            subtitle: Text(
                              '${animal.location}・${animal.genderLabel}',
                            ),
                            trailing: const Icon(Icons.chevron_right_rounded),
                            onTap: () => onOpenAnimal(animal),
                          ),
                        ),
                      ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SearchPage extends StatefulWidget {
  const SearchPage({
    super.key,
    required this.animals,
    required this.onOpenAnimal,
  });

  final List<Animal> animals;
  final ValueChanged<Animal> onOpenAnimal;

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _controller = TextEditingController();
  SearchFilters _filters = SearchFilters.defaults();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  List<Animal> get _filteredAnimals {
    final query = _controller.text.trim().toLowerCase();
    return widget.animals.where((animal) {
      final isCat = animal.breed.contains('貓');
      final matchesQuery =
          query.isEmpty ||
          animal.name.toLowerCase().contains(query) ||
          animal.location.toLowerCase().contains(query) ||
          animal.breed.toLowerCase().contains(query) ||
          animal.shelterName.toLowerCase().contains(query);
      final matchesType =
          (isCat && _filters.types.contains('貓咪')) ||
          (!isCat && _filters.types.contains('狗狗'));
      final matchesAge =
          (_filters.ages.contains('幼年') && animal.ageLabel.contains('幼')) ||
          (_filters.ages.contains('成犬 / 成貓') &&
              animal.ageLabel.contains('成')) ||
          (_filters.ages.contains('老年') && animal.ageLabel.contains('老'));
      return matchesQuery && matchesType && matchesAge;
    }).toList();
  }

  Future<void> _openFilterSheet() async {
    final result = await showModalBottomSheet<SearchFilters>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => FilterBottomSheet(initialFilters: _filters),
    );
    if (result != null) {
      setState(() {
        _filters = result;
      });
    }
  }

  void _openResults() {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (_) => SearchResultsPage(
          animals: _filteredAnimals,
          onOpenAnimal: widget.onOpenAnimal,
          query: _controller.text.trim(),
          filters: _filters,
        ),
      ),
    );
  }

  List<String> get _activeFilterLabels {
    return [
      ..._filters.areas,
      ..._filters.types,
      ..._filters.ages,
      ..._filters.genders.where((item) => item != '不限'),
      ..._filters.sizes.where((item) => item != '不限'),
      ..._filters.neuter.where((item) => item != '不限'),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final hasQuery = _controller.text.trim().isNotEmpty;
    final results = _filteredAnimals;

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
                    onChanged: (_) => setState(() {}),
                    onSubmitted: (_) => _openResults(),
                    suffixIcon: IconButton(
                      onPressed: _openResults,
                      icon: const Icon(Icons.north_east_rounded),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: _openFilterSheet,
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
                children: [
                  ..._activeFilterLabels.map(
                    (label) => Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: _FilterChip(
                        label: label,
                        selected: true,
                        onTap: _openFilterSheet,
                      ),
                    ),
                  ),
                ],
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
                          onPressed: () {
                            setState(() {
                              _controller.clear();
                              _filters = SearchFilters.defaults();
                            });
                          },
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
                                onPressed: _openResults,
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
                                  child: _AnimalListTile(
                                    animal: animal,
                                    onTap: () => widget.onOpenAnimal(animal),
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
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: const [
                  _TagPill(label: '幼犬'),
                  _TagPill(label: '幼貓'),
                  _TagPill(label: '黑色貓咪'),
                  _TagPill(label: '米克斯'),
                  _TagPill(label: '已絕育'),
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
                      child: _CategoryCard(
                        animal: widget.animals[index],
                        label: categoryLabels[index],
                        count: categoryCounts[index],
                        onTap: _openResults,
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
                  onTap: () {
                    setState(() {
                      _controller.text = item;
                    });
                  },
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class SearchResultsPage extends StatelessWidget {
  const SearchResultsPage({
    super.key,
    required this.animals,
    required this.onOpenAnimal,
    this.query = '',
    this.filters,
  });

  final List<Animal> animals;
  final ValueChanged<Animal> onOpenAnimal;
  final String query;
  final SearchFilters? filters;

  @override
  Widget build(BuildContext context) {
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
                    onPressed: () => Navigator.of(context).pop(),
                    icon: const Icon(Icons.arrow_back_ios_new_rounded),
                  ),
                  const Text(
                    '搜尋結果',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () async {
                      await showModalBottomSheet<SearchFilters>(
                        context: context,
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        builder: (_) => FilterBottomSheet(
                          initialFilters: filters ?? SearchFilters.defaults(),
                        ),
                      );
                    },
                    child: const Text('篩選'),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                query.isEmpty
                    ? '共 ${animals.length} 隻結果'
                    : '「$query」共 ${animals.length} 隻結果',
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
                          onPressed: () => Navigator.of(context).pop(),
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
                          return AnimalCard(
                            animal: animals[index],
                            onTap: () => onOpenAnimal(animals[index]),
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

class AnimalDetailPage extends StatelessWidget {
  const AnimalDetailPage({
    super.key,
    required this.animal,
    required this.shelter,
    required this.onOpenShelter,
  });

  final Animal animal;
  final Shelter shelter;
  final ValueChanged<Shelter> onOpenShelter;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverAppBar(
                expandedHeight: 380,
                pinned: true,
                backgroundColor: Colors.transparent,
                leading: _CircleIconButton(
                  icon: Icons.arrow_back_ios_new_rounded,
                  onTap: () => Navigator.of(context).pop(),
                ),
                actions: const [
                  _CircleIconButton(icon: Icons.ios_share_outlined),
                  SizedBox(width: 8),
                  _CircleIconButton(
                    icon: Icons.favorite_rounded,
                    color: Color(0xFFE35D4F),
                  ),
                  SizedBox(width: 12),
                ],
                flexibleSpace: FlexibleSpaceBar(
                  background: Stack(
                    fit: StackFit.expand,
                    children: [
                      Image.asset(animal.imagePath, fit: BoxFit.cover),
                      DecoratedBox(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.black.withValues(alpha: 0.1),
                              Colors.black.withValues(alpha: 0.2),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  transform: Matrix4.translationValues(0, -18, 0),
                  decoration: const BoxDecoration(
                    color: Color(0xFFF8F4ED),
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(28),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 120),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              animal.name,
                              style: const TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            const SizedBox(width: 10),
                            ...animal.tags.map(
                              (tag) => Padding(
                                padding: const EdgeInsets.only(right: 6),
                                child: _StatusChip(
                                  text: tag.label,
                                  color: tag.color,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Text(
                          '${animal.location}・${animal.ageLabel}・${animal.genderLabel}',
                          style: const TextStyle(
                            color: Colors.black54,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 22),
                        const Text(
                          '基本資料',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        const SizedBox(height: 14),
                        _InfoTable(
                          rows: [
                            ['品種', animal.breed],
                            ['毛色', animal.color],
                            ['體型', animal.size],
                            ['年齡', animal.ageLabel],
                            ['拾獲地點', animal.location],
                          ],
                        ),
                        const SizedBox(height: 22),
                        const Text(
                          '收容所資訊',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        const SizedBox(height: 14),
                        GestureDetector(
                          onTap: () => onOpenShelter(shelter),
                          child: Container(
                            padding: const EdgeInsets.all(18),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(22),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        shelter.name,
                                        style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w800,
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      Text(
                                        shelter.address,
                                        style: const TextStyle(
                                          color: Colors.black54,
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        shelter.phone,
                                        style: const TextStyle(
                                          color: Colors.black54,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const Icon(Icons.chevron_right_rounded),
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
          Positioned(
            left: 20,
            right: 20,
            bottom: 20,
            child: Row(
              children: [
                Expanded(
                  child: FilledButton(
                    onPressed: () {},
                    style: FilledButton.styleFrom(
                      backgroundColor: const Color(0xFF5E9B54),
                      padding: const EdgeInsets.symmetric(vertical: 18),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                    ),
                    child: const Text('聯絡收容所'),
                  ),
                ),
                const SizedBox(width: 12),
                _BottomAction(icon: Icons.ios_share_outlined, onTap: () {}),
                const SizedBox(width: 12),
                _BottomAction(
                  icon: Icons.favorite_rounded,
                  color: const Color(0xFFE35D4F),
                  onTap: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({
    super.key,
    required this.animals,
    required this.onOpenAnimal,
  });

  final List<Animal> animals;
  final ValueChanged<Animal> onOpenAnimal;

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  int _selectedTab = 0;

  List<Animal> get _visibleAnimals {
    if (_selectedTab == 1) {
      return widget.animals
          .where((animal) => !animal.breed.contains('貓'))
          .toList();
    }
    if (_selectedTab == 2) {
      return widget.animals
          .where((animal) => animal.breed.contains('貓'))
          .toList();
    }
    if (_selectedTab == 3) {
      return const [];
    }
    return widget.animals;
  }

  @override
  Widget build(BuildContext context) {
    final animals = _visibleAnimals;

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  '我的收藏',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900),
                ),
              ],
            ),
            const SizedBox(height: 14),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(
                favoriteTabs.length,
                (index) => GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedTab = index;
                    });
                  },
                  child: _TabText(
                    label: favoriteTabs[index],
                    selected: _selectedTab == index,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 18),
            Expanded(
              child: animals.isEmpty
                  ? Center(
                      child: EmptyStatePanel(
                        imagePath:
                            'assets/images/dog/alvan-nee-T-0EW-SEbsE-unsplash.jpg',
                        title: '還沒有收藏任何毛孩',
                        message: '快去尋找喜歡的毛孩，加入收藏吧',
                        actionLabel: '去尋找毛孩',
                        onPressed: () {
                          Navigator.of(context).maybePop();
                        },
                        icon: Icons.favorite_border_rounded,
                      ),
                    )
                  : ListView.separated(
                      itemCount: animals.length,
                      separatorBuilder: (_, _) => const SizedBox(height: 12),
                      itemBuilder: (context, index) {
                        final animal = animals[index];
                        return GestureDetector(
                          onTap: () => widget.onOpenAnimal(animal),
                          child: Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(22),
                            ),
                            child: Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(16),
                                  child: Image.asset(
                                    animal.imagePath,
                                    width: 88,
                                    height: 88,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const SizedBox(width: 14),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        animal.name,
                                        style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w800,
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        '${animal.location}・${animal.shelterName}',
                                        style: const TextStyle(
                                          color: Colors.black54,
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      Wrap(
                                        spacing: 6,
                                        runSpacing: 6,
                                        children: animal.tags
                                            .map(
                                              (tag) => _StatusChip(
                                                text: tag.label,
                                                color: tag.color,
                                              ),
                                            )
                                            .toList(),
                                      ),
                                    ],
                                  ),
                                ),
                                const Icon(
                                  Icons.favorite_rounded,
                                  color: Color(0xFFE35D4F),
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

class NearbyPage extends StatelessWidget {
  const NearbyPage({
    super.key,
    required this.shelters,
    required this.onOpenShelter,
  });

  final List<Shelter> shelters;
  final ValueChanged<Shelter> onOpenShelter;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Text(
                '附近的收容所',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900),
              ),
            ),
            const SizedBox(height: 16),
            Container(
              height: 230,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(28),
                image: const DecorationImage(
                  image: AssetImage('assets/images/shaltar/sheltar.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(28),
                  color: Colors.white.withValues(alpha: 0.22),
                ),
                child: Stack(
                  children: const [
                    Positioned(top: 34, left: 56, child: _MapPin()),
                    Positioned(top: 72, right: 64, child: _MapPin()),
                    Positioned(
                      bottom: 50,
                      left: 140,
                      child: _MapPin(active: true),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.separated(
                itemCount: shelters.length,
                separatorBuilder: (_, _) => const SizedBox(height: 12),
                itemBuilder: (context, index) {
                  final shelter = shelters[index];
                  return GestureDetector(
                    onTap: () => onOpenShelter(shelter),
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(22),
                      ),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: Image.asset(
                              shelter.imagePath,
                              width: 82,
                              height: 82,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(width: 14),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  shelter.name,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  '距離 ${shelter.distance}・${shelter.capacity}',
                                  style: const TextStyle(color: Colors.black54),
                                ),
                              ],
                            ),
                          ),
                          const CircleAvatar(
                            backgroundColor: Color(0xFFE8F3E4),
                            child: Icon(
                              Icons.call_rounded,
                              color: Color(0xFF4F8A3F),
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

class ShelterDetailPage extends StatelessWidget {
  const ShelterDetailPage({
    super.key,
    required this.shelter,
    required this.animals,
    required this.onOpenAnimal,
  });

  final Shelter shelter;
  final List<Animal> animals;
  final ValueChanged<Animal> onOpenAnimal;

  @override
  Widget build(BuildContext context) {
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
                    onPressed: () => Navigator.of(context).pop(),
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
              _IconInfoRow(icon: Icons.place_outlined, text: shelter.address),
              const SizedBox(height: 10),
              _IconInfoRow(icon: Icons.phone_outlined, text: shelter.phone),
              const SizedBox(height: 10),
              _IconInfoRow(
                icon: Icons.schedule_rounded,
                text: shelter.openingHours,
              ),
              const SizedBox(height: 18),
              Row(
                children: [
                  Expanded(
                    child: _StatCard(value: '32', label: '狗狗'),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: _StatCard(value: '18', label: '貓咪'),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: _StatCard(value: '50', label: '總數'),
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
                      onTap: () => onOpenAnimal(animal),
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

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
          child: Column(
            children: [
              const Center(
                child: Text(
                  '通知',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900),
                ),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: ListView.separated(
                  itemCount: demoNotifications.length,
                  separatorBuilder: (_, _) => const Divider(height: 1),
                  itemBuilder: (context, index) {
                    final item = demoNotifications[index];
                    return ListTile(
                      contentPadding: const EdgeInsets.symmetric(vertical: 10),
                      leading: CircleAvatar(
                        backgroundColor: item.color.withValues(alpha: 0.15),
                        child: Icon(item.icon, color: item.color),
                      ),
                      title: Text(
                        item.title,
                        style: const TextStyle(fontWeight: FontWeight.w700),
                      ),
                      subtitle: Padding(
                        padding: const EdgeInsets.only(top: 6),
                        child: Text('${item.message}\n${item.time}'),
                      ),
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

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
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
              children: const [
                Expanded(
                  child: _StatCard(value: '12', label: '我的收藏'),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: _StatCard(value: '3', label: '瀏覽紀錄'),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: _StatCard(value: '2', label: '送養設定'),
                ),
              ],
            ),
            const SizedBox(height: 24),
            ...profileMenus.map((label) => _ProfileMenuTile(label: label)),
          ],
        ),
      ),
    );
  }
}

class RoundedSearchField extends StatelessWidget {
  const RoundedSearchField({
    super.key,
    required this.hintText,
    this.enabled = true,
    this.controller,
    this.onChanged,
    this.onSubmitted,
    this.suffixIcon,
  });

  final String hintText;
  final bool enabled;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: !enabled,
      child: TextField(
        controller: controller,
        enabled: enabled,
        onChanged: onChanged,
        onSubmitted: onSubmitted,
        decoration: InputDecoration(
          hintText: hintText,
          prefixIcon: const Icon(Icons.search_rounded),
          suffixIcon: suffixIcon,
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(22),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}

class EmptyStatePanel extends StatelessWidget {
  const EmptyStatePanel({
    super.key,
    required this.imagePath,
    required this.title,
    required this.message,
    required this.actionLabel,
    required this.onPressed,
    required this.icon,
  });

  final String imagePath;
  final String title;
  final String message;
  final String actionLabel;
  final VoidCallback onPressed;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            alignment: Alignment.topRight,
            children: [
              Image.asset(
                imagePath,
                width: 136,
                height: 136,
                fit: BoxFit.cover,
              ),
              CircleAvatar(
                radius: 18,
                backgroundColor: Colors.white,
                child: Icon(icon, color: const Color(0xFFE35D4F)),
              ),
            ],
          ),
          const SizedBox(height: 18),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w900),
          ),
          const SizedBox(height: 8),
          Text(
            message,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.black54,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 20),
          FilledButton(
            onPressed: onPressed,
            style: FilledButton.styleFrom(
              backgroundColor: const Color(0xFF4F8A3F),
              padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 14),
            ),
            child: Text(actionLabel),
          ),
        ],
      ),
    );
  }
}

class _AnimalListTile extends StatelessWidget {
  const _AnimalListTile({required this.animal, required this.onTap});

  final Animal animal;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: Image.asset(
                animal.imagePath,
                width: 78,
                height: 78,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    animal.name,
                    style: const TextStyle(fontWeight: FontWeight.w800),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${animal.location}・${animal.shelterName}',
                    style: const TextStyle(color: Colors.black54),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      _TagPill(label: animal.ageLabel),
                      const SizedBox(width: 6),
                      _TagPill(label: animal.genderLabel),
                    ],
                  ),
                ],
              ),
            ),
            const Icon(Icons.chevron_right_rounded),
          ],
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
        children: [
          const Text(
            '空狀態',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
          ),
          const SizedBox(height: 14),
          const _PreviewCard(
            child: EmptyStatePanel(
              imagePath: 'assets/images/dog/alvan-nee-T-0EW-SEbsE-unsplash.jpg',
              title: '還沒有收藏任何毛孩',
              message: '快去尋找喜歡的毛孩，加入收藏吧',
              actionLabel: '去尋找毛孩',
              onPressed: _noop,
              icon: Icons.favorite_border_rounded,
            ),
          ),
          const SizedBox(height: 12),
          const _PreviewCard(
            child: EmptyStatePanel(
              imagePath:
                  'assets/images/others_animals/melissa-keizer-X-0FisCRIaA-unsplash.jpg',
              title: '找不到符合條件的毛孩',
              message: '試試調整關鍵字、篩選條件或附近範圍',
              actionLabel: '清除篩選',
              onPressed: _noop,
              icon: Icons.search_off_rounded,
            ),
          ),
          const SizedBox(height: 12),
          const _PreviewCard(
            child: EmptyStatePanel(
              imagePath: 'assets/images/shaltar/sheltar.jpg',
              title: '附近沒有收容所',
              message: '請嘗試打開定位或放寬搜尋範圍',
              actionLabel: '重新定位',
              onPressed: _noop,
              icon: Icons.location_off_rounded,
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            '載入 / 錯誤',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
          ),
          const SizedBox(height: 14),
          const _PreviewCard(
            child: LoadingStatePanel(title: '資料載入中...', message: '請稍候片刻'),
          ),
          const SizedBox(height: 12),
          const _PreviewCard(
            child: ErrorStatePanel(
              icon: Icons.broken_image_outlined,
              title: '圖片載入失敗',
              message: '點擊重新載入',
              actionLabel: '重新載入',
            ),
          ),
          const SizedBox(height: 12),
          const _PreviewCard(
            child: ErrorStatePanel(
              icon: Icons.wifi_off_rounded,
              title: '網路連線異常',
              message: '請檢查網路設定後再試一次',
              actionLabel: '重試',
              secondaryLabel: '回首頁',
            ),
          ),
          const SizedBox(height: 20),
          FilledButton(
            onPressed: () {
              showModalBottomSheet<SearchFilters>(
                context: context,
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
                builder: (_) =>
                    FilterBottomSheet(initialFilters: SearchFilters.defaults()),
              );
            },
            child: const Text('開啟篩選 Bottom Sheet'),
          ),
        ],
      ),
    );
  }
}

class _PreviewCard extends StatelessWidget {
  const _PreviewCard({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(28),
      ),
      child: child,
    );
  }
}

class LoadingStatePanel extends StatelessWidget {
  const LoadingStatePanel({
    super.key,
    required this.title,
    required this.message,
  });

  final String title;
  final String message;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(
          width: 56,
          height: 56,
          child: CircularProgressIndicator(strokeWidth: 3),
        ),
        const SizedBox(height: 18),
        Text(
          title,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
        ),
        const SizedBox(height: 8),
        Text(message, style: const TextStyle(color: Colors.black54)),
      ],
    );
  }
}

class ErrorStatePanel extends StatelessWidget {
  const ErrorStatePanel({
    super.key,
    required this.icon,
    required this.title,
    required this.message,
    required this.actionLabel,
    this.secondaryLabel,
  });

  final IconData icon;
  final String title;
  final String message;
  final String actionLabel;
  final String? secondaryLabel;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 62, color: const Color(0xFF5A5A5A)),
        const SizedBox(height: 18),
        Text(
          title,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
        ),
        const SizedBox(height: 8),
        Text(message, style: const TextStyle(color: Colors.black54)),
        const SizedBox(height: 20),
        FilledButton(onPressed: () {}, child: Text(actionLabel)),
        if (secondaryLabel != null) ...[
          const SizedBox(height: 10),
          OutlinedButton(onPressed: () {}, child: Text(secondaryLabel!)),
        ],
      ],
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
            _FilterSection(
              title: '地區（可多選）',
              children: taiwanAreas.map((item) {
                final selected = _filters.areas.contains(item);
                return SelectablePill(
                  label: item,
                  selected: selected,
                  onTap: () {
                    setState(() {
                      _filters = _filters.toggleArea(item);
                    });
                  },
                );
              }).toList(),
            ),
            const SizedBox(height: 18),
            _FilterSection(
              title: '種類',
              children: animalTypes.map((item) {
                return SelectablePill(
                  label: item,
                  selected: _filters.types.contains(item),
                  onTap: () {
                    setState(() {
                      _filters = _filters.toggleType(item);
                    });
                  },
                );
              }).toList(),
            ),
            const SizedBox(height: 18),
            _FilterSection(
              title: '年齡',
              children: ageFilters.map((item) {
                return SelectablePill(
                  label: item,
                  selected: _filters.ages.contains(item),
                  onTap: () {
                    setState(() {
                      _filters = _filters.toggleAge(item);
                    });
                  },
                );
              }).toList(),
            ),
            const SizedBox(height: 18),
            _FilterSection(
              title: '性別',
              children: genderFilters.map((item) {
                return SelectablePill(
                  label: item,
                  selected: _filters.genders.contains(item),
                  onTap: () {
                    setState(() {
                      _filters = _filters.toggleGender(item);
                    });
                  },
                );
              }).toList(),
            ),
            const SizedBox(height: 18),
            _FilterSection(
              title: '體型',
              children: sizeFilters.map((item) {
                return SelectablePill(
                  label: item,
                  selected: _filters.sizes.contains(item),
                  onTap: () {
                    setState(() {
                      _filters = _filters.toggleSize(item);
                    });
                  },
                );
              }).toList(),
            ),
            const SizedBox(height: 18),
            _FilterSection(
              title: '是否絕育',
              children: neuterFilters.map((item) {
                return SelectablePill(
                  label: item,
                  selected: _filters.neuter.contains(item),
                  onTap: () {
                    setState(() {
                      _filters = _filters.toggleNeuter(item);
                    });
                  },
                );
              }).toList(),
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
                child: const Text('查看結果 (128)'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _FilterSection extends StatelessWidget {
  const _FilterSection({required this.title, required this.children});

  final String title;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: const TextStyle(fontWeight: FontWeight.w800)),
        const SizedBox(height: 10),
        Wrap(spacing: 8, runSpacing: 8, children: children),
      ],
    );
  }
}

class SelectablePill extends StatelessWidget {
  const SelectablePill({
    super.key,
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 9),
        decoration: BoxDecoration(
          color: selected ? const Color(0xFF4F8A3F) : Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: selected ? const Color(0xFF4F8A3F) : const Color(0xFFD9D3C8),
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: selected ? Colors.white : const Color(0xFF4B4B4B),
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}

class AnimalCard extends StatelessWidget {
  const AnimalCard({
    super.key,
    required this.animal,
    required this.onTap,
    this.width,
  });

  final Animal animal;
  final VoidCallback onTap;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Material(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        elevation: 0.5,
        shadowColor: Colors.black.withValues(alpha: 0.08),
        child: InkWell(
          borderRadius: BorderRadius.circular(18),
          onTap: onTap,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(18),
                      ),
                      child: Image.asset(
                        animal.imagePath,
                        width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      top: 8,
                      right: 8,
                      child: CircleAvatar(
                        radius: 14,
                        backgroundColor: Colors.white.withValues(alpha: 0.95),
                        child: Icon(
                          animal.isFavorite
                              ? Icons.favorite_rounded
                              : Icons.favorite_border_rounded,
                          size: 17,
                          color: animal.isFavorite
                              ? const Color(0xFFE35D4F)
                              : Colors.black54,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      animal.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w900,
                        color: Color(0xFF2C2C2C),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '${animal.location}・${animal.shelterName}',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 11,
                        color: Colors.black54,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '${animal.ageLabel}・${animal.genderLabel}',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF5B5B5B),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _QuickCategoryChip extends StatelessWidget {
  const _QuickCategoryChip({required this.item});

  final HomeCategory item;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 28,
          backgroundColor: item.background,
          child: Icon(item.icon, color: item.foreground),
        ),
        const SizedBox(height: 8),
        Text(item.label, style: const TextStyle(fontWeight: FontWeight.w600)),
      ],
    );
  }
}

class _SectionHeader extends StatelessWidget {
  const _SectionHeader({
    required this.title,
    required this.actionLabel,
    required this.onTap,
  });

  final String title;
  final String actionLabel;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
        ),
        const Spacer(),
        TextButton(onPressed: onTap, child: Text(actionLabel)),
      ],
    );
  }
}

class _FilterChip extends StatelessWidget {
  const _FilterChip({required this.label, this.selected = false, this.onTap});

  final String label;
  final bool selected;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final foreground = selected ? Colors.white : const Color(0xFF4B4B4B);

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        decoration: BoxDecoration(
          color: selected ? const Color(0xFF4F8A3F) : Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: selected ? const Color(0xFF4F8A3F) : const Color(0xFFE7E0D6),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              label,
              style: TextStyle(color: foreground, fontWeight: FontWeight.w700),
            ),
          ],
        ),
      ),
    );
  }
}

class _TagPill extends StatelessWidget {
  const _TagPill({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: const Color(0xFFF4F0EA),
        borderRadius: BorderRadius.circular(999),
      ),
      child: Text(
        label,
        style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
      ),
    );
  }
}

class _StatusChip extends StatelessWidget {
  const _StatusChip({required this.text, required this.color});

  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(999),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w700,
          color: color,
        ),
      ),
    );
  }
}

class _CategoryCard extends StatelessWidget {
  const _CategoryCard({
    required this.animal,
    required this.label,
    required this.count,
    required this.onTap,
  });

  final Animal animal;
  final String label;
  final String count;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(18),
            child: Image.asset(
              animal.imagePath,
              height: 110,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 10),
          Text(label, style: const TextStyle(fontWeight: FontWeight.w800)),
          const SizedBox(height: 4),
          Text(count, style: const TextStyle(color: Colors.black54)),
        ],
      ),
    );
  }
}

class _CircleIconButton extends StatelessWidget {
  const _CircleIconButton({
    required this.icon,
    this.color = Colors.black87,
    this.onTap,
  });

  final IconData icon;
  final Color color;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8),
      child: GestureDetector(
        onTap: onTap,
        child: CircleAvatar(
          backgroundColor: Colors.white.withValues(alpha: 0.9),
          child: Icon(icon, color: color),
        ),
      ),
    );
  }
}

class _BottomAction extends StatelessWidget {
  const _BottomAction({
    required this.icon,
    required this.onTap,
    this.color = const Color(0xFF4F8A3F),
  });

  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        radius: 27,
        backgroundColor: Colors.white,
        child: Icon(icon, color: color),
      ),
    );
  }
}

class _InfoTable extends StatelessWidget {
  const _InfoTable({required this.rows});

  final List<List<String>> rows;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
      ),
      child: Column(
        children: rows
            .map(
              (row) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 9),
                child: Row(
                  children: [
                    SizedBox(
                      width: 88,
                      child: Text(
                        row[0],
                        style: const TextStyle(color: Colors.black54),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        row[1],
                        style: const TextStyle(fontWeight: FontWeight.w700),
                      ),
                    ),
                  ],
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}

class _TabText extends StatelessWidget {
  const _TabText({required this.label, this.selected = false});

  final String label;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          label,
          style: TextStyle(
            fontWeight: FontWeight.w800,
            color: selected ? const Color(0xFF4F8A3F) : Colors.black54,
          ),
        ),
        const SizedBox(height: 10),
        Container(
          width: 28,
          height: 3,
          decoration: BoxDecoration(
            color: selected ? const Color(0xFF4F8A3F) : Colors.transparent,
            borderRadius: BorderRadius.circular(999),
          ),
        ),
      ],
    );
  }
}

class _MapPin extends StatelessWidget {
  const _MapPin({this.active = false});

  final bool active;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: active ? 20 : 18,
      backgroundColor: active ? const Color(0xFF4F8A3F) : Colors.white,
      child: Icon(
        Icons.pets_rounded,
        color: active ? Colors.white : const Color(0xFF4F8A3F),
      ),
    );
  }
}

class _IconInfoRow extends StatelessWidget {
  const _IconInfoRow({required this.icon, required this.text});

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: const Color(0xFF4F8A3F)),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
        ),
      ],
    );
  }
}

class _StatCard extends StatelessWidget {
  const _StatCard({required this.value, required this.label});

  final String value;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        children: [
          Text(
            value,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w900),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: const TextStyle(
              color: Colors.black54,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

class _ProfileMenuTile extends StatelessWidget {
  const _ProfileMenuTile({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: ListTile(
        title: Text(label, style: const TextStyle(fontWeight: FontWeight.w700)),
        trailing: const Icon(Icons.chevron_right_rounded),
      ),
    );
  }
}
