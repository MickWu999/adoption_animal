import 'package:flutter/material.dart';

import '../../../../core/responsive/responsive.dart';
import '../../../../core/theme/adoption_theme.dart';

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
              Image.asset(
                imagePath,
                width: context.w(136),
                height: context.w(136),
                fit: BoxFit.cover,
              ),
              CircleAvatar(
                radius: context.r(18),
                backgroundColor: AdoptionColors.surface,
                child: Icon(icon, color: AdoptionColors.danger),
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
              color: AdoptionColors.textMuted,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: context.h(20)),
          FilledButton(
            onPressed: onPressed,
            style: FilledButton.styleFrom(
              backgroundColor: AdoptionColors.primary,
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
