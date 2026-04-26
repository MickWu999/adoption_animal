import 'package:flutter/material.dart';

import '../../../../core/responsive/responsive.dart';
import '../../domain/models/app_models.dart';
import 'legacy_ui.dart';

class AnimalCard extends StatelessWidget {
  const AnimalCard({
    super.key,
    required this.animal,
    required this.onTap,
    required this.onFavoriteTap,
    this.width = 168,
  });

  final Animal animal;
  final VoidCallback onTap;
  final VoidCallback onFavoriteTap;
  final double width;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(context.r(24)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Stack(
                children: [
                  Positioned.fill(
                    child: ClipRRect(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(context.r(24)),
                      ),
                      child: AnimalImage(imagePath: animal.imagePath),
                    ),
                  ),
                  Positioned(
                    top: context.h(10),
                    right: context.w(10),
                    child: CircleAvatar(
                      backgroundColor: Colors.white.withValues(alpha: 0.9),
                      child: IconButton(
                        onPressed: onFavoriteTap,
                        icon: Icon(
                          animal.isFavorite
                              ? Icons.favorite_rounded
                              : Icons.favorite_border_rounded,
                          color: const Color(0xFFE35D4F),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(
                context.w(14),
                context.h(12),
                context.w(14),
                context.h(14),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    animal.name,
                    style: TextStyle(
                      fontSize: context.sp(17),
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  SizedBox(height: context.h(4)),
                  Text(
                    '${animal.location}・${animal.breed}',
                    style: TextStyle(
                      fontSize: context.sp(13),
                      color: Colors.black54,
                    ),
                  ),
                  SizedBox(height: context.h(8)),
                  Wrap(
                    spacing: context.w(6),
                    runSpacing: context.h(6),
                    children: animal.tags
                        .map(
                          (tag) => Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: context.w(8),
                              vertical: context.h(4),
                            ),
                            decoration: BoxDecoration(
                              color: tag.color.withValues(alpha: 0.14),
                              borderRadius: BorderRadius.circular(
                                context.r(999),
                              ),
                            ),
                            child: Text(
                              tag.label,
                              style: TextStyle(
                                color: tag.color,
                                fontSize: context.sp(11),
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
