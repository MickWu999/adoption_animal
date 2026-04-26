import 'package:flutter/material.dart';

import '../../core/responsive/responsive.dart';
import '../../domain/models/app_models.dart';

void noop() {}

class RoundedSearchField extends StatelessWidget {
  const RoundedSearchField({
    super.key,
    required this.hintText,
    this.enabled = true,
    this.controller,
    this.onChanged,
    this.onSubmitted,
    this.suffixIcon,
    this.onTap,
  });

  final String hintText;
  final bool enabled;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final Widget? suffixIcon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: !enabled,
      child: TextField(
        controller: controller,
        enabled: enabled,
        onTap: onTap,
        onChanged: onChanged,
        onSubmitted: onSubmitted,
        decoration: InputDecoration(
          hintText: hintText,
          prefixIcon: const Icon(Icons.search_rounded),
          suffixIcon: suffixIcon,
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(context.r(22)),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}

class AnimalImage extends StatelessWidget {
  const AnimalImage({
    super.key,
    required this.imagePath,
    this.width,
    this.height,
  });

  final String imagePath;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    if (imagePath.trim().isEmpty) {
      return _fallbackImage();
    }

    final image = imagePath.startsWith('http')
        ? Image.network(
            imagePath,
            width: width,
            height: height,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return _fallbackImage();
            },
          )
        : Image.asset(
            imagePath,
            width: width,
            height: height,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return _fallbackImage();
            },
          );

    return image;
  }

  Widget _fallbackImage() {
    return Container(
      width: width,
      height: height,
      color: const Color(0xFFF4F0EA),
      alignment: Alignment.center,
      child: const Icon(Icons.pets_rounded, color: Color(0xFF9F9488)),
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
      padding: EdgeInsets.symmetric(horizontal: context.w(24)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            alignment: Alignment.topRight,
            children: [
              AnimalImage(
                imagePath: imagePath,
                width: context.w(136),
                height: context.w(136),
              ),
              CircleAvatar(
                radius: context.r(18),
                backgroundColor: Colors.white,
                child: Icon(icon, color: const Color(0xFFE35D4F)),
              ),
            ],
          ),
          SizedBox(height: context.h(18)),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: context.sp(22),
              fontWeight: FontWeight.w900,
            ),
          ),
          SizedBox(height: context.h(8)),
          Text(
            message,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.black54,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: context.h(20)),
          FilledButton(
            onPressed: onPressed,
            style: FilledButton.styleFrom(
              backgroundColor: const Color(0xFF4F8A3F),
              padding: EdgeInsets.symmetric(
                horizontal: context.w(28),
                vertical: context.h(14),
              ),
            ),
            child: Text(actionLabel),
          ),
        ],
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
    this.onFavoriteTap,
  });

  final Animal animal;
  final VoidCallback onTap;
  final double? width;
  final VoidCallback? onFavoriteTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Material(
        color: Colors.white,
        borderRadius: BorderRadius.circular(context.r(18)),
        elevation: 0.5,
        shadowColor: Colors.black.withValues(alpha: 0.08),
        child: InkWell(
          borderRadius: BorderRadius.circular(context.r(18)),
          onTap: onTap,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: 1.35,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(context.r(18)),
                      ),
                      child: AnimalImage(imagePath: animal.imagePath),
                    ),
                    Positioned(
                      top: context.h(8),
                      right: context.w(8),
                      child: GestureDetector(
                        onTap: onFavoriteTap,
                        child: CircleAvatar(
                          radius: context.r(14),
                          backgroundColor: Colors.white.withValues(alpha: 0.95),
                          child: Icon(
                            animal.isFavorite
                                ? Icons.favorite_rounded
                                : Icons.favorite_border_rounded,
                            size: context.sp(17),
                            color: animal.isFavorite
                                ? const Color(0xFFE35D4F)
                                : Colors.black54,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(
                  context.w(10),
                  context.h(10),
                  context.w(10),
                  context.h(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      animal.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: context.sp(16),
                        fontWeight: FontWeight.w900,
                        color: Color(0xFF2C2C2C),
                      ),
                    ),
                    SizedBox(height: context.h(4)),
                    Text(
                      '${animal.location}・${animal.shelterName}',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: context.sp(11),
                        color: Colors.black54,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: context.h(4)),
                    Text(
                      '${animal.ageLabel}・${animal.genderLabel}',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: context.sp(13),
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

class QuickCategoryChip extends StatelessWidget {
  const QuickCategoryChip({super.key, required this.item});

  final HomeCategory item;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: context.r(28),
          backgroundColor: item.background,
          child: Icon(item.icon, color: item.foreground),
        ),
        SizedBox(height: context.h(8)),
        Text(
          item.label,
          style: TextStyle(
            fontSize: context.sp(13),
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}

class SectionHeader extends StatelessWidget {
  const SectionHeader({
    super.key,
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
          style: TextStyle(
            fontSize: context.sp(20),
            fontWeight: FontWeight.w900,
          ),
        ),
        const Spacer(),
        TextButton(onPressed: onTap, child: Text(actionLabel)),
      ],
    );
  }
}

class FilterChipCard extends StatelessWidget {
  const FilterChipCard({
    super.key,
    required this.label,
    this.selected = false,
    this.onTap,
  });

  final String label;
  final bool selected;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final foreground = selected ? Colors.white : const Color(0xFF4B4B4B);

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(context.r(16)),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: context.w(14),
          vertical: context.h(10),
        ),
        decoration: BoxDecoration(
          color: selected ? const Color(0xFF4F8A3F) : Colors.white,
          borderRadius: BorderRadius.circular(context.r(16)),
          border: Border.all(
            color: selected ? const Color(0xFF4F8A3F) : const Color(0xFFE7E0D6),
          ),
        ),
        child: Text(
          label,
          style: TextStyle(color: foreground, fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}

class TagPill extends StatelessWidget {
  const TagPill({super.key, required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: context.w(10),
        vertical: context.h(5),
      ),
      decoration: BoxDecoration(
        color: const Color(0xFFF4F0EA),
        borderRadius: BorderRadius.circular(999),
      ),
      child: Text(
        label,
        style: TextStyle(fontSize: context.sp(12), fontWeight: FontWeight.w600),
      ),
    );
  }
}

class StatusChip extends StatelessWidget {
  const StatusChip({super.key, required this.text, required this.color});

  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: context.w(10),
        vertical: context.h(5),
      ),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(999),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: context.sp(12),
          fontWeight: FontWeight.w700,
          color: color,
        ),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
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
            borderRadius: BorderRadius.circular(context.r(18)),
            child: AnimalImage(
              imagePath: animal.imagePath,
              height: context.h(110),
              width: double.infinity,
            ),
          ),
          SizedBox(height: context.h(10)),
          Text(
            label,
            style: TextStyle(
              fontSize: context.sp(13),
              fontWeight: FontWeight.w800,
            ),
          ),
          SizedBox(height: context.h(4)),
          Text(
            count,
            style: TextStyle(fontSize: context.sp(12), color: Colors.black54),
          ),
        ],
      ),
    );
  }
}

class CircleIconButton extends StatelessWidget {
  const CircleIconButton({
    super.key,
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
      padding: EdgeInsets.only(left: context.w(8)),
      child: GestureDetector(
        onTap: onTap,
        child: CircleAvatar(
          radius: context.r(20),
          backgroundColor: Colors.white.withValues(alpha: 0.9),
          child: Icon(icon, color: color),
        ),
      ),
    );
  }
}

class BottomAction extends StatelessWidget {
  const BottomAction({
    super.key,
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
        radius: context.r(27),
        backgroundColor: Colors.white,
        child: Icon(icon, color: color),
      ),
    );
  }
}

class InfoTable extends StatelessWidget {
  const InfoTable({super.key, required this.rows});

  final List<List<String>> rows;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(context.w(18)),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(context.r(22)),
      ),
      child: Column(
        children: rows
            .map(
              (row) => Padding(
                padding: EdgeInsets.symmetric(vertical: context.h(9)),
                child: Row(
                  children: [
                    SizedBox(
                      width: context.w(88),
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

class TabText extends StatelessWidget {
  const TabText({super.key, required this.label, this.selected = false});

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
        SizedBox(height: context.h(10)),
        Container(
          width: context.w(28),
          height: context.h(3),
          decoration: BoxDecoration(
            color: selected ? const Color(0xFF4F8A3F) : Colors.transparent,
            borderRadius: BorderRadius.circular(999),
          ),
        ),
      ],
    );
  }
}

class MapPin extends StatelessWidget {
  const MapPin({super.key, this.active = false});

  final bool active;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: active ? context.r(20) : context.r(18),
      backgroundColor: active ? const Color(0xFF4F8A3F) : Colors.white,
      child: Icon(
        Icons.pets_rounded,
        color: active ? Colors.white : const Color(0xFF4F8A3F),
      ),
    );
  }
}

class IconInfoRow extends StatelessWidget {
  const IconInfoRow({super.key, required this.icon, required this.text});

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: const Color(0xFF4F8A3F)),
        SizedBox(width: context.w(10)),
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

class StatCard extends StatelessWidget {
  const StatCard({super.key, required this.value, required this.label});

  final String value;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: context.h(16)),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(context.r(18)),
      ),
      child: Column(
        children: [
          Text(
            value,
            style: TextStyle(
              fontSize: context.sp(24),
              fontWeight: FontWeight.w900,
            ),
          ),
          SizedBox(height: context.h(4)),
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

class ProfileMenuTile extends StatelessWidget {
  const ProfileMenuTile({super.key, required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: context.h(12)),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(context.r(20)),
      ),
      child: ListTile(
        title: Text(label, style: const TextStyle(fontWeight: FontWeight.w700)),
        trailing: const Icon(Icons.chevron_right_rounded),
      ),
    );
  }
}

class AnimalListTile extends StatelessWidget {
  const AnimalListTile({
    super.key,
    required this.animal,
    required this.onTap,
    this.trailing,
  });

  final Animal animal;
  final VoidCallback onTap;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(context.w(12)),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(context.r(20)),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(context.r(14)),
              child: AnimalImage(
                imagePath: animal.imagePath,
                width: context.w(78),
                height: context.w(78),
              ),
            ),
            SizedBox(width: context.w(12)),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    animal.name,
                    style: const TextStyle(fontWeight: FontWeight.w800),
                  ),
                  SizedBox(height: context.h(4)),
                  Text(
                    '${animal.location}・${animal.shelterName}',
                    style: const TextStyle(color: Colors.black54),
                  ),
                  SizedBox(height: context.h(8)),
                  Row(
                    children: [
                      TagPill(label: animal.ageLabel),
                      SizedBox(width: context.w(6)),
                      TagPill(label: animal.genderLabel),
                    ],
                  ),
                ],
              ),
            ),
            trailing ?? const Icon(Icons.chevron_right_rounded),
          ],
        ),
      ),
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
        SizedBox(
          width: context.w(56),
          height: context.w(56),
          child: CircularProgressIndicator(strokeWidth: 3),
        ),
        SizedBox(height: context.h(18)),
        Text(
          title,
          style: TextStyle(
            fontSize: context.sp(20),
            fontWeight: FontWeight.w900,
          ),
        ),
        SizedBox(height: context.h(8)),
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
        Icon(icon, size: context.sp(62), color: const Color(0xFF5A5A5A)),
        SizedBox(height: context.h(18)),
        Text(
          title,
          style: TextStyle(
            fontSize: context.sp(20),
            fontWeight: FontWeight.w900,
          ),
        ),
        SizedBox(height: context.h(8)),
        Text(message, style: const TextStyle(color: Colors.black54)),
        SizedBox(height: context.h(20)),
        FilledButton(onPressed: () {}, child: Text(actionLabel)),
        if (secondaryLabel != null) ...[
          SizedBox(height: context.h(10)),
          OutlinedButton(onPressed: () {}, child: Text(secondaryLabel!)),
        ],
      ],
    );
  }
}

class PreviewCard extends StatelessWidget {
  const PreviewCard({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: context.h(20)),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(context.r(28)),
      ),
      child: child,
    );
  }
}

class FilterSection extends StatelessWidget {
  const FilterSection({super.key, required this.title, required this.children});

  final String title;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: context.sp(14),
            fontWeight: FontWeight.w800,
          ),
        ),
        SizedBox(height: context.h(10)),
        Wrap(
          spacing: context.w(8),
          runSpacing: context.h(8),
          children: children,
        ),
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
      borderRadius: BorderRadius.circular(context.r(12)),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: context.w(14),
          vertical: context.h(9),
        ),
        decoration: BoxDecoration(
          color: selected ? const Color(0xFF4F8A3F) : Colors.white,
          borderRadius: BorderRadius.circular(context.r(12)),
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
