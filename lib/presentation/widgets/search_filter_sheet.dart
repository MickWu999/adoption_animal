import 'package:flutter/material.dart';

import '../../core/lookups/adoption_lookups.dart';
import '../../core/theme/adoption_theme.dart';
import '../../domain/models/app_models.dart';

class FilterBottomSheet extends StatefulWidget {
  const FilterBottomSheet({super.key, required this.initialFilters});

  final AnimalSearchParams initialFilters;

  @override
  State<FilterBottomSheet> createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  late AnimalSearchParams _filters = widget.initialFilters;
  bool _showAdvanced = false;

  int get _animalAreaPkid => _filters.animalAreaPkid;
  int get _animalShelterPkid => _filters.animalShelterPkid;
  String get _animalKind =>
      _filters.animalKind.isEmpty ? '不限' : _filters.animalKind;
  String get _animalAge =>
      _filters.animalAge.isEmpty ? '不限' : _filters.animalAge;
  String get _animalStatus =>
      _filters.animalStatus.isEmpty ? '不限' : _filters.animalStatus;
  String get _animalSex =>
      _filters.animalSex.isEmpty ? '不限' : _filters.animalSex;
  String get _animalBodytype =>
      _filters.animalBodytype.isEmpty ? '不限' : _filters.animalBodytype;
  String get _animalSterilization => _filters.animalSterilization.isEmpty
      ? '不限'
      : _filters.animalSterilization;
  String get _animalBacterin =>
      _filters.animalBacterin.isEmpty ? '不限' : _filters.animalBacterin;

  int get _activeCount {
    var count = 0;
    if (_filters.animalAreaPkid != 0) count += 1;
    if (_filters.animalShelterPkid != 0) count += 1;
    if (_filters.animalKind.isNotEmpty) count += 1;
    if (_filters.animalVariety.isNotEmpty) count += 1;
    if (_filters.animalSex.isNotEmpty) count += 1;
    if (_filters.animalBodytype.isNotEmpty) count += 1;
    if (_filters.animalColour.isNotEmpty) count += 1;
    if (_filters.animalAge.isNotEmpty) count += 1;
    if (_filters.animalSterilization.isNotEmpty) count += 1;
    if (_filters.animalBacterin.isNotEmpty) count += 1;
    if (_filters.animalStatus.isNotEmpty) count += 1;
    return count;
  }

  void _apply(AnimalSearchParams next) {
    setState(() {
      _filters = next;
    });
  }

  void _reset() {
    setState(() {
      _filters = AnimalSearchParams.defaults();
      _showAdvanced = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final sheetHeight = MediaQuery.sizeOf(context).height * 0.88;

    return SizedBox(
      height: sheetHeight,
      child: Container(
        decoration: const BoxDecoration(
          color: AdoptionColors.surfaceSoft,
          borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
        ),
        padding: const EdgeInsets.fromLTRB(20, 14, 20, 16),
        child: SafeArea(
          top: false,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 48,
                  height: 4,
                  decoration: BoxDecoration(
                    color: AdoptionColors.dragHandle,
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
                  const SizedBox(width: 10),
                  _SelectionBadge(count: _activeCount),
                  const Spacer(),
                  TextButton.icon(
                    onPressed: _reset,
                    icon: const Icon(Icons.refresh_rounded, size: 18),
                    label: const Text('重設'),
                    style: TextButton.styleFrom(
                      foregroundColor: AdoptionColors.primary,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 10,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                  ),
                ],
              ),
              const Text(
                '基礎查詢先縮小範圍，進階查詢可更精準對應 API 欄位。',
                style: TextStyle(
                  color: AdoptionColors.textMuted,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 18),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const _SectionLabel(
                        title: '基礎查詢',
                        subtitle: '先從最常用的條件開始',
                      ),
                      const SizedBox(height: 10),
                      _DropdownFilterTile<int>(
                        label: '縣市',
                        value: _animalAreaPkid,
                        options: [
                          const _ChoiceOption<int>('不限', 0),
                          ...countyOptions.map(
                            (option) =>
                                _ChoiceOption<int>(option.label, option.code),
                          ),
                        ],
                        onChanged: (value) => _apply(
                          _filters.copyWith(
                            animalAreaPkid: value,
                            animalShelterPkid: 0,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      _DropdownFilterTile<int>(
                        label: '收容所',
                        value: _animalShelterPkid,
                        options: [
                          const _ChoiceOption<int>('不限', 0),
                          ...shelterOptions
                              .where(
                                (option) =>
                                    _filters.animalAreaPkid == 0 ||
                                    option.countyCode ==
                                        _filters.animalAreaPkid,
                              )
                              .map(
                                (option) => _ChoiceOption<int>(
                                  option.label,
                                  option.code,
                                ),
                              ),
                        ],
                        onChanged: (value) =>
                            _apply(_filters.copyWith(animalShelterPkid: value)),
                      ),
                      const SizedBox(height: 10),
                      _DropdownFilterTile<String>(
                        label: '動物類型',
                        value: _animalKind,
                        options: const <_ChoiceOption<String>>[
                          _ChoiceOption<String>('不限', '不限'),
                          _ChoiceOption<String>('狗', '狗'),
                          _ChoiceOption<String>('貓', '貓'),
                          _ChoiceOption<String>('其他', '其他'),
                        ],
                        onChanged: (value) => _apply(
                          _filters.copyWith(
                            animalKind: value == '不限' ? '' : value,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      _DropdownFilterTile<String>(
                        label: '年齡',
                        value: _animalAge,
                        options: const <_ChoiceOption<String>>[
                          _ChoiceOption<String>('不限', '不限'),
                          _ChoiceOption<String>('幼年', 'CHILD'),
                          _ChoiceOption<String>('成年', 'ADULT'),
                        ],
                        onChanged: (value) => _apply(
                          _filters.copyWith(
                            animalAge: value == '不限' ? '' : value,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      _DropdownFilterTile<String>(
                        label: '狀態',
                        value: _animalStatus,
                        options: const <_ChoiceOption<String>>[
                          _ChoiceOption<String>('不限', '不限'),
                          _ChoiceOption<String>('開放認養', 'OPEN'),
                          _ChoiceOption<String>('已送養', 'ADOPTED'),
                          _ChoiceOption<String>('其他', 'OTHER'),
                          _ChoiceOption<String>('死亡', 'DEAD'),
                        ],
                        onChanged: (value) => _apply(
                          _filters.copyWith(
                            animalStatus: value == '不限' ? '' : value,
                          ),
                        ),
                      ),
                      const SizedBox(height: 18),
                      Row(
                        children: [
                          const _SectionLabel(
                            title: '進階查詢',
                            subtitle: '需要更細的條件時再展開',
                          ),
                          const Spacer(),
                          TextButton(
                            onPressed: () {
                              setState(() {
                                _showAdvanced = !_showAdvanced;
                              });
                            },
                            child: Text(_showAdvanced ? '收合' : '展開'),
                          ),
                        ],
                      ),
                      AnimatedCrossFade(
                        firstChild: const SizedBox.shrink(),
                        secondChild: Column(
                          children: [
                            _TextFilterField(
                              label: '品種',
                              hintText: '例如 米克斯 / 柯基',
                              initialValue: _filters.animalVariety,
                              onChanged: (value) => _apply(
                                _filters.copyWith(animalVariety: value.trim()),
                              ),
                            ),
                            const SizedBox(height: 10),
                            _DropdownFilterTile<String>(
                              label: '性別',
                              value: _animalSex,
                              options: const <_ChoiceOption<String>>[
                                _ChoiceOption<String>('不限', '不限'),
                                _ChoiceOption<String>('公', 'M'),
                                _ChoiceOption<String>('母', 'F'),
                                _ChoiceOption<String>('不詳', 'N'),
                              ],
                              onChanged: (value) => _apply(
                                _filters.copyWith(
                                  animalSex: value == '不限' ? '' : value,
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            _DropdownFilterTile<String>(
                              label: '體型',
                              value: _animalBodytype,
                              options: const <_ChoiceOption<String>>[
                                _ChoiceOption<String>('不限', '不限'),
                                _ChoiceOption<String>('小型', 'SMALL'),
                                _ChoiceOption<String>('中型', 'MEDIUM'),
                                _ChoiceOption<String>('大型', 'BIG'),
                              ],
                              onChanged: (value) => _apply(
                                _filters.copyWith(
                                  animalBodytype: value == '不限' ? '' : value,
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            _TextFilterField(
                              label: '毛色',
                              hintText: '例如 黑色 / 黃白色',
                              initialValue: _filters.animalColour,
                              onChanged: (value) => _apply(
                                _filters.copyWith(animalColour: value.trim()),
                              ),
                            ),
                            const SizedBox(height: 10),
                            _DropdownFilterTile<String>(
                              label: '是否絕育',
                              value: _animalSterilization,
                              options: const <_ChoiceOption<String>>[
                                _ChoiceOption<String>('不限', '不限'),
                                _ChoiceOption<String>('是', 'T'),
                                _ChoiceOption<String>('否', 'F'),
                                _ChoiceOption<String>('未知', 'N'),
                              ],
                              onChanged: (value) => _apply(
                                _filters.copyWith(
                                  animalSterilization: value == '不限'
                                      ? ''
                                      : value,
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            _DropdownFilterTile<String>(
                              label: '疫苗',
                              value: _animalBacterin,
                              options: const <_ChoiceOption<String>>[
                                _ChoiceOption<String>('不限', '不限'),
                                _ChoiceOption<String>('是', 'T'),
                                _ChoiceOption<String>('否', 'F'),
                                _ChoiceOption<String>('未知', 'N'),
                              ],
                              onChanged: (value) => _apply(
                                _filters.copyWith(
                                  animalBacterin: value == '不限' ? '' : value,
                                ),
                              ),
                            ),
                          ],
                        ),
                        crossFadeState: _showAdvanced
                            ? CrossFadeState.showSecond
                            : CrossFadeState.showFirst,
                        duration: const Duration(milliseconds: 220),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              _ActionBar(onApply: () => Navigator.of(context).pop(_filters)),
            ],
          ),
        ),
      ),
    );
  }
}

class _SectionLabel extends StatelessWidget {
  const _SectionLabel({required this.title, required this.subtitle});

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w900),
        ),
        const SizedBox(height: 4),
        Text(
          subtitle,
          style: const TextStyle(
            color: AdoptionColors.textMuted,
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}

class _SelectionBadge extends StatelessWidget {
  const _SelectionBadge({required this.count});

  final int count;

  @override
  Widget build(BuildContext context) {
    final hasSelection = count > 0;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: hasSelection
            ? AdoptionColors.primarySoft
            : AdoptionColors.chipBg,
        borderRadius: BorderRadius.circular(999),
      ),
      child: Text(
        hasSelection ? '已選 $count 項' : '尚未選條件',
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w800,
          color: hasSelection
              ? AdoptionColors.primaryStrong
              : AdoptionColors.textSecondary,
        ),
      ),
    );
  }
}

class _ActionBar extends StatelessWidget {
  const _ActionBar({required this.onApply});

  final VoidCallback onApply;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: FilledButton(
        onPressed: onApply,
        style: FilledButton.styleFrom(
          backgroundColor: AdoptionColors.primary,
          minimumSize: const Size.fromHeight(52),
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: const Text('套用篩選'),
      ),
    );
  }
}

class _ChoiceOption<T> {
  const _ChoiceOption(this.label, this.value);

  final String label;
  final T value;
}

class _DropdownFilterTile<T> extends StatelessWidget {
  const _DropdownFilterTile({
    required this.label,
    required this.value,
    required this.options,
    required this.onChanged,
  });

  final String label;
  final T value;
  final List<_ChoiceOption<T>> options;
  final ValueChanged<T> onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      decoration: BoxDecoration(
        color: AdoptionColors.surface,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: AdoptionColors.border),
      ),
      child: Row(
        children: [
          Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.w800,
              color: AdoptionColors.textStrong,
            ),
          ),
          const Spacer(),
          SizedBox(
            width: 152,
            child: DropdownButtonHideUnderline(
              child: DropdownButton<T>(
                value: value,
                isExpanded: true,
                alignment: Alignment.centerRight,
                borderRadius: BorderRadius.circular(18),
                icon: const Icon(Icons.keyboard_arrow_down_rounded),
                items: options
                    .map(
                      (option) => DropdownMenuItem<T>(
                        value: option.value,
                        child: Text(option.label),
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

class _TextFilterField extends StatefulWidget {
  const _TextFilterField({
    required this.label,
    required this.hintText,
    required this.initialValue,
    required this.onChanged,
  });

  final String label;
  final String hintText;
  final String initialValue;
  final ValueChanged<String> onChanged;

  @override
  State<_TextFilterField> createState() => _TextFilterFieldState();
}

class _TextFilterFieldState extends State<_TextFilterField> {
  late final TextEditingController _controller = TextEditingController(
    text: widget.initialValue,
  );

  @override
  void didUpdateWidget(covariant _TextFilterField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.initialValue != widget.initialValue &&
        _controller.text != widget.initialValue) {
      _controller.text = widget.initialValue;
      _controller.selection = TextSelection.collapsed(
        offset: widget.initialValue.length,
      );
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      onChanged: widget.onChanged,
      decoration: InputDecoration(
        labelText: widget.label,
        hintText: widget.hintText,
        filled: true,
        fillColor: AdoptionColors.surface,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: const BorderSide(color: AdoptionColors.border),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: const BorderSide(color: AdoptionColors.border),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: const BorderSide(
            color: AdoptionColors.primary,
            width: 1.2,
          ),
        ),
      ),
    );
  }
}
