import 'package:flutter/material.dart';

import '../../../../core/responsive/responsive.dart';
import '../../../../core/theme/adoption_theme.dart';

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
            color: AdoptionColors.textPrimary,
          ),
        ),
        const Spacer(),
        TextButton(
          onPressed: onTap,
          child: Text(
            actionLabel,
            style: TextStyle(
              color: AdoptionColors.primaryStrong,
              fontSize: context.sp(13),
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
      ],
    );
  }
}
