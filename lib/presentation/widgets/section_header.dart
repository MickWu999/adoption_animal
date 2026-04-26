import 'package:flutter/material.dart';

import '../../core/responsive/responsive.dart';

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
