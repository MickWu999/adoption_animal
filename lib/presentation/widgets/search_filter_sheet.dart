import 'package:flutter/material.dart';

import '../../data/mock_data.dart';
import '../../domain/models/app_models.dart';

class FilterBottomSheet extends StatefulWidget {
  const FilterBottomSheet({super.key, required this.initialFilters});

  final SearchFilters initialFilters;

  @override
  State<FilterBottomSheet> createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  late SearchFilters _filters = widget.initialFilters;

  String get _selectedType =>
      _filters.types.isEmpty ? '不限' : _filters.types.first;
  String get _selectedArea =>
      _filters.areas.isEmpty ? '不限' : _filters.areas.first;
  String get _selectedAge => _filters.ages.isEmpty ? '不限' : _filters.ages.first;
  String get _selectedGender =>
      _filters.genders.where((item) => item != '不限').isEmpty
      ? '不限'
      : _filters.genders.where((item) => item != '不限').first;
  String get _selectedSize =>
      _filters.sizes.where((item) => item != '不限').isEmpty
      ? '不限'
      : _filters.sizes.where((item) => item != '不限').first;
  String get _selectedNeuter =>
      _filters.neuter.where((item) => item != '不限').isEmpty
      ? '不限'
      : _filters.neuter.where((item) => item != '不限').first;

  void _apply(SearchFilters next) {
    setState(() {
      _filters = next;
    });
  }

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
            Center(
              child: Container(
                width: 48,
                height: 4,
                decoration: BoxDecoration(
                  color: const Color(0xFFD4CEC4),
                  borderRadius: BorderRadius.circular(999),
                ),
              ),
            ),
            const SizedBox(height: 18),
            Row(
              children: [
                const Text(
                  '篩選毛孩',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w900),
                ),
                const Spacer(),
                TextButton(
                  onPressed: () => _apply(SearchFilters.defaults()),
                  child: const Text('重設'),
                ),
              ],
            ),
            const SizedBox(height: 4),
            const Text(
              '沒有設定條件時會顯示全部毛孩。',
              style: TextStyle(
                color: Colors.black54,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 22),
            const Text('動物類型', style: TextStyle(fontWeight: FontWeight.w800)),
            const SizedBox(height: 10),
            _SegmentedFilter(
              options: const ['不限', '狗狗', '貓咪', '其他'],
              value: _selectedType,
              onChanged: (value) => _apply(_filters.selectType(value)),
            ),
            const SizedBox(height: 18),
            _FilterMenuTile(
              label: '地區',
              value: _selectedArea,
              options: const ['不限', ...taiwanAreas],
              onChanged: (value) => _apply(_filters.selectArea(value)),
            ),
            const SizedBox(height: 10),
            _FilterMenuTile(
              label: '年齡',
              value: _selectedAge,
              options: const ['不限', ...ageFilters],
              onChanged: (value) => _apply(_filters.selectAge(value)),
            ),
            const SizedBox(height: 10),
            _FilterMenuTile(
              label: '性別',
              value: _selectedGender,
              options: genderFilters,
              onChanged: (value) => _apply(_filters.selectGender(value)),
            ),
            const SizedBox(height: 10),
            _FilterMenuTile(
              label: '體型',
              value: _selectedSize,
              options: sizeFilters,
              onChanged: (value) => _apply(_filters.selectSize(value)),
            ),
            const SizedBox(height: 10),
            _FilterMenuTile(
              label: '是否絕育',
              value: _selectedNeuter,
              options: neuterFilters,
              onChanged: (value) => _apply(_filters.selectNeuter(value)),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: () => Navigator.of(context).pop(_filters),
                style: FilledButton.styleFrom(
                  backgroundColor: const Color(0xFF4F8A3F),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                ),
                child: const Text('套用篩選'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SegmentedFilter extends StatelessWidget {
  const _SegmentedFilter({
    required this.options,
    required this.value,
    required this.onChanged,
  });

  final List<String> options;
  final String value;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: const Color(0xFFE1DACE)),
      ),
      child: Row(
        children: options.map((option) {
          final selected = option == value;
          return Expanded(
            child: InkWell(
              onTap: () => onChanged(option),
              borderRadius: BorderRadius.circular(14),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 180),
                padding: const EdgeInsets.symmetric(vertical: 11),
                decoration: BoxDecoration(
                  color: selected
                      ? const Color(0xFF4F8A3F)
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Text(
                  option,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: selected ? Colors.white : const Color(0xFF4B4B4B),
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

class _FilterMenuTile extends StatelessWidget {
  const _FilterMenuTile({
    required this.label,
    required this.value,
    required this.options,
    required this.onChanged,
  });

  final String label;
  final String value;
  final List<String> options;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: const Color(0xFFE1DACE)),
      ),
      child: Row(
        children: [
          Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.w800,
              color: Color(0xFF3D3D3D),
            ),
          ),
          const Spacer(),
          SizedBox(
            width: 128,
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: value,
                isExpanded: true,
                alignment: Alignment.centerRight,
                borderRadius: BorderRadius.circular(18),
                icon: const Icon(Icons.keyboard_arrow_down_rounded),
                items: options
                    .map(
                      (option) => DropdownMenuItem<String>(
                        value: option,
                        child: Text(option),
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  if (value != null) {
                    onChanged(value);
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
