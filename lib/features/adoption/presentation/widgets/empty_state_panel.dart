import 'package:flutter/material.dart';

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
                backgroundColor: AdoptionColors.surface,
                child: Icon(icon, color: AdoptionColors.danger),
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
              color: AdoptionColors.textMuted,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 20),
          FilledButton(
            onPressed: onPressed,
            style: FilledButton.styleFrom(
              backgroundColor: AdoptionColors.primary,
              padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 14),
            ),
            child: Text(actionLabel),
          ),
        ],
      ),
    );
  }
}
