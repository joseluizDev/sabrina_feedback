import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';

class ProgressBarHeader extends StatelessWidget {
  final int currentStep;

  const ProgressBarHeader({super.key, required this.currentStep});

  @override
  Widget build(BuildContext context) {
    final isVisible = currentStep >= 2 && currentStep <= 4;
    final progressValue = isVisible ? (currentStep - 1) / 3.0 : 0.0;

    return AnimatedOpacity(
      duration: const Duration(milliseconds: 300),
      opacity: isVisible ? 1.0 : 0.0,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 16, left: 8, right: 8),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'PASSO ${currentStep - 1} DE 3',
                  style: const TextStyle(
                    fontSize: 11,
                    letterSpacing: 2.0,
                    fontWeight: FontWeight.w600,
                    color: AppColors.slate600,
                  ),
                ),
                Text(
                  '${(progressValue * 100).round()}%',
                  style: const TextStyle(
                    fontSize: 11,
                    letterSpacing: 1.5,
                    fontWeight: FontWeight.w600,
                    color: AppColors.slate600,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            ClipRRect(
              borderRadius: BorderRadius.circular(999),
              child: LinearProgressIndicator(
                value: progressValue,
                minHeight: 4,
                backgroundColor: AppColors.slate200.withValues(alpha: 0.7),
                valueColor: const AlwaysStoppedAnimation<Color>(AppColors.slate500),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
