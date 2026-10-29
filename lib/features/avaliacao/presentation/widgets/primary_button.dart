import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';

class PrimaryButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final IconData? icon;

  const PrimaryButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.icon = Icons.arrow_forward_rounded,
  });

  @override
  Widget build(BuildContext context) {
    final isEnabled = onPressed != null;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(999),
        gradient: isEnabled ? AppColors.primaryGradient : null,
        color: isEnabled ? null : AppColors.slate200,
        boxShadow: isEnabled
            ? [
                BoxShadow(
                  color: AppColors.slate500.withValues(alpha: 0.30),
                  blurRadius: 14,
                  offset: const Offset(0, 6),
                ),
              ]
            : null,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(999),
          onTap: onPressed,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 13),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  label.toUpperCase(),
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1.5,
                    color: isEnabled ? Colors.white : AppColors.slate600,
                  ),
                ),
                if (icon != null) ...[
                  const SizedBox(width: 6),
                  Icon(
                    icon,
                    size: 16,
                    color: isEnabled ? Colors.white : AppColors.slate600,
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
