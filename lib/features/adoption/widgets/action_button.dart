import 'package:adoption_animal/core/responsive/responsive.dart';
import 'package:adoption_animal/core/theme/adoption_theme.dart';
import 'package:flutter/material.dart';

class CircleActionButton extends StatelessWidget {
  const CircleActionButton({
    super.key,
    required this.icon,
    required this.onTap,
  });

  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(context.r(14)),
      child: CircleAvatar(
        radius: context.r(20),
        backgroundColor: AdoptionColors.surface,
        foregroundColor: AdoptionColors.primaryStrong,
        child: Container(
          width: context.w(36),
          height: context.w(36),
          decoration: BoxDecoration(
            color: AdoptionColors.surfaceSoft,
            borderRadius: BorderRadius.circular(context.r(18)),
            border: Border.all(color: AdoptionColors.border, width: 1.2),
          ),
          child: Icon(
            icon,
            size: context.sp(18),
            color: AdoptionColors.primaryStrong,
          ),
        ),
      ),
    );
  }
}
