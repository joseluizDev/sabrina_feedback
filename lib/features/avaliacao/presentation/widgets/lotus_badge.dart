import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';

class LotusBadge extends StatelessWidget {
  final double size;

  const LotusBadge({super.key, this.size = 88});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      padding: const EdgeInsets.all(1), // mantém o anel dourado visível sobre a logo
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: AppColors.gold300),
        boxShadow: [
          BoxShadow(
            color: AppColors.slate600.withValues(alpha: 0.28),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: ClipOval(
        child: Image.asset('assets/logo_icon.png', fit: BoxFit.cover),
      ),
    );
  }
}
