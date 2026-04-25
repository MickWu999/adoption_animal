import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

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
    SearchPage(animals: demoAnimals, onOpenResults: _openSearchResults),
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

  void _openSearchResults() {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (_) =>
            SearchResultsPage(animals: demoAnimals, onOpenAnimal: _openAnimal),
      ),
    );
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
                    title: '熱門收養 TOP10',
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

class SearchPage extends StatelessWidget {
  const SearchPage({
    super.key,
    required this.animals,
    required this.onOpenResults,
  });

  final List<Animal> animals;
  final VoidCallback onOpenResults;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: onOpenResults,
                    child: const RoundedSearchField(
                      hintText: '搜尋品種、地區或關鍵字',
                      enabled: false,
                    ),
                  ),
                ),
                TextButton(onPressed: onOpenResults, child: const Text('清除')),
              ],
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: filterChips
                  .map((label) => _FilterChip(label: label))
                  .toList(),
            ),
            const SizedBox(height: 24),
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
                      animal: animals[index],
                      label: categoryLabels[index],
                      count: categoryCounts[index],
                      onTap: onOpenResults,
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
                onTap: onOpenResults,
              ),
            ),
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
  });

  final List<Animal> animals;
  final ValueChanged<Animal> onOpenAnimal;

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
                    '台南市・狗狗',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
                  ),
                  const Spacer(),
                  TextButton(onPressed: () {}, child: const Text('篩選')),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                '共 ${animals.length} 隻結果',
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.black54,
                ),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: GridView.builder(
                  itemCount: animals.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({
    super.key,
    required this.animals,
    required this.onOpenAnimal,
  });

  final List<Animal> animals;
  final ValueChanged<Animal> onOpenAnimal;

  @override
  Widget build(BuildContext context) {
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
              children: const [
                _TabText(label: '全部', selected: true),
                _TabText(label: '狗狗'),
                _TabText(label: '貓咪'),
                _TabText(label: '已送養'),
              ],
            ),
            const SizedBox(height: 18),
            Expanded(
              child: ListView.separated(
                itemCount: animals.length,
                separatorBuilder: (_, _) => const SizedBox(height: 12),
                itemBuilder: (context, index) {
                  final animal = animals[index];
                  return GestureDetector(
                    onTap: () => onOpenAnimal(animal),
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
                              crossAxisAlignment: CrossAxisAlignment.start,
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
                                  style: const TextStyle(color: Colors.black54),
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
  });

  final String hintText;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: !enabled,
      child: TextField(
        enabled: enabled,
        decoration: InputDecoration(
          hintText: hintText,
          prefixIcon: const Icon(Icons.search_rounded),
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
  const _FilterChip({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE7E0D6)),
      ),
      child: Text(label, style: const TextStyle(fontWeight: FontWeight.w600)),
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
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(22),
        ),
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

class Animal {
  const Animal({
    required this.name,
    required this.imagePath,
    required this.location,
    required this.shelterName,
    required this.breed,
    required this.color,
    required this.size,
    required this.ageLabel,
    required this.genderLabel,
    required this.tags,
    this.isFavorite = false,
  });

  final String name;
  final String imagePath;
  final String location;
  final String shelterName;
  final String breed;
  final String color;
  final String size;
  final String ageLabel;
  final String genderLabel;
  final List<AnimalTag> tags;
  final bool isFavorite;
}

class AnimalTag {
  const AnimalTag(this.label, this.color);

  final String label;
  final Color color;
}

class Shelter {
  const Shelter({
    required this.name,
    required this.imagePath,
    required this.address,
    required this.phone,
    required this.distance,
    required this.capacity,
    required this.openingHours,
  });

  final String name;
  final String imagePath;
  final String address;
  final String phone;
  final String distance;
  final String capacity;
  final String openingHours;
}

class NoticeItem {
  const NoticeItem({
    required this.title,
    required this.message,
    required this.time,
    required this.icon,
    required this.color,
  });

  final String title;
  final String message;
  final String time;
  final IconData icon;
  final Color color;
}

class HomeCategory {
  const HomeCategory({
    required this.label,
    required this.icon,
    required this.background,
    required this.foreground,
  });

  final String label;
  final IconData icon;
  final Color background;
  final Color foreground;
}

const homeCategories = [
  HomeCategory(
    label: '狗狗',
    icon: Icons.pets_rounded,
    background: Color(0xFFFFE4C6),
    foreground: Color(0xFFB56B1B),
  ),
  HomeCategory(
    label: '貓咪',
    icon: Icons.cruelty_free_rounded,
    background: Color(0xFFFFE9B9),
    foreground: Color(0xFFC38A08),
  ),
  HomeCategory(
    label: '幼年',
    icon: Icons.face_4_rounded,
    background: Color(0xFFFFD7C7),
    foreground: Color(0xFFC26A4B),
  ),
  HomeCategory(
    label: '附近',
    icon: Icons.near_me_rounded,
    background: Color(0xFFE3F1CC),
    foreground: Color(0xFF4F8A3F),
  ),
  HomeCategory(
    label: '已絕育',
    icon: Icons.favorite_rounded,
    background: Color(0xFFDFF0DD),
    foreground: Color(0xFF4F8A3F),
  ),
];

const filterChips = ['地區', '狗貓', '年齡', '體型', '更多篩選'];
const categoryLabels = ['狗狗', '貓咪', '幼年動物'];
const categoryCounts = ['128 隻', '86 隻', '64 隻'];
const recentSearches = ['台南市狗狗', '黑色幼貓', '潤埤收容所'];
const profileMenus = ['認養偏好設定', '我的瀏覽紀錄', '通知設定', '幫助與客服', '關於我們', '設定'];

const demoAnimals = [
  Animal(
    name: '小花',
    imagePath: 'assets/images/dog/oscar-sutton-yihlaRCCvd4-unsplash.jpg',
    location: '台南市',
    shelterName: '灣裡站',
    breed: '米克斯',
    color: '黃白色',
    size: '中型',
    ageLabel: '幼年',
    genderLabel: '母',
    tags: [AnimalTag('開放認養中', Color(0xFF5E9B54))],
    isFavorite: true,
  ),
  Animal(
    name: '小黑',
    imagePath: 'assets/images/dog/richard-brutyo-Sg3XwuEpybU-unsplash.jpg',
    location: '台南市',
    shelterName: '灣裡站',
    breed: '米克斯',
    color: '黑色',
    size: '中型',
    ageLabel: '成犬',
    genderLabel: '公',
    tags: [
      AnimalTag('開放認養中', Color(0xFF5E9B54)),
      AnimalTag('已絕育', Color(0xFF4F8A3F)),
      AnimalTag('已施打疫苗', Color(0xFFE56B5B)),
    ],
    isFavorite: true,
  ),
  Animal(
    name: '米米',
    imagePath: 'assets/images/dog/alvan-nee-T-0EW-SEbsE-unsplash.jpg',
    location: '台南市',
    shelterName: '善化站',
    breed: '米克斯',
    color: '黃褐色',
    size: '小型',
    ageLabel: '幼年',
    genderLabel: '母',
    tags: [AnimalTag('開放認養中', Color(0xFF5E9B54))],
    isFavorite: true,
  ),
  Animal(
    name: '斑斑',
    imagePath: 'assets/images/cat/hang-niu-Tn8DLxwuDMA-unsplash.jpg',
    location: '台南市',
    shelterName: '新化站',
    breed: '虎斑貓',
    color: '虎斑色',
    size: '小型',
    ageLabel: '成貓',
    genderLabel: '母',
    tags: [AnimalTag('已絕育', Color(0xFF94B06E))],
  ),
  Animal(
    name: '奶茶',
    imagePath: 'assets/images/cat/amber-kipp-75715CVEJhI-unsplash.jpg',
    location: '台南市',
    shelterName: '學甲站',
    breed: '米克斯貓',
    color: '黑白色',
    size: '小型',
    ageLabel: '幼年',
    genderLabel: '母',
    tags: [AnimalTag('開放認養中', Color(0xFF5E9B54))],
    isFavorite: true,
  ),
  Animal(
    name: '旺財',
    imagePath: 'assets/images/dog/joe-caione-qO-PIF84Vxg-unsplash.jpg',
    location: '台南市',
    shelterName: '灣裡站',
    breed: '柯基',
    color: '黃白色',
    size: '中型',
    ageLabel: '幼年',
    genderLabel: '公',
    tags: [AnimalTag('開放認養中', Color(0xFF5E9B54))],
  ),
];

const demoShelters = [
  Shelter(
    name: '台南市動物之家灣裡站',
    imagePath: 'assets/images/shaltar/sheltar.jpg',
    address: '台南市南區萬年路 580 巷 92 號',
    phone: '06-2964439',
    distance: '2.3 km',
    capacity: '32 隻可認養',
    openingHours: '週二至週日 09:00 - 17:00',
  ),
  Shelter(
    name: '台南市動物之家善化站',
    imagePath: 'assets/images/shaltar/shaltar2.jpeg',
    address: '台南市善化區東昌里 201 號',
    phone: '06-5832399',
    distance: '5.1 km',
    capacity: '26 隻可認養',
    openingHours: '週二至週日 09:00 - 17:00',
  ),
  Shelter(
    name: '台南市動物之家新化站',
    imagePath: 'assets/images/shaltar/sheltar.jpg',
    address: '台南市新化區知義里 88 號',
    phone: '06-5941211',
    distance: '6.7 km',
    capacity: '18 隻可認養',
    openingHours: '週二至週日 09:00 - 17:00',
  ),
];

const demoNotifications = [
  NoticeItem(
    title: '新毛孩上架',
    message: '台南市新增 2 隻幼犬可認養，快來看看。',
    time: '2 分鐘前',
    icon: Icons.pets_rounded,
    color: Color(0xFFF2B544),
  ),
  NoticeItem(
    title: '收藏更新',
    message: '你收藏的「小黑」狀態更新為：已施打疫苗。',
    time: '1 小時前',
    icon: Icons.favorite_rounded,
    color: Color(0xFFE35D4F),
  ),
  NoticeItem(
    title: '認養成功',
    message: '你收藏的「奶茶」已被認養了，恭喜牠找到新家。',
    time: '昨天 18:30',
    icon: Icons.celebration_rounded,
    color: Color(0xFF4F8A3F),
  ),
  NoticeItem(
    title: '活動資訊',
    message: '本週六灣裡站將舉辦認養活動，歡迎到場互動。',
    time: '2 天前',
    icon: Icons.event_note_rounded,
    color: Color(0xFFF29D38),
  ),
];
