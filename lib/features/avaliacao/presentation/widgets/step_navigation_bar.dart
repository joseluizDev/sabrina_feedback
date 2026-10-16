import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import 'primary_button.dart';

class StepNavigationBar extends StatelessWidget {
  final VoidCallback? onBack;
  final VoidCallback? onNext;
  final String nextLabel;

  const StepNavigationBar({
    super.key,
    this.onBack,
    required this.onNext,
    required this.nextLabel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: const EdgeInsets.only(top: 14),
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(color: AppColors.rose100, width: 1),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (onBack != null)
            TextButton.icon(
              onPressed: onBack,
              icon: const Icon(Icons.chevron_left_rounded, size: 20),
              label: const Text('Voltar'),
              style: TextButton.styleFrom(
                foregroundColor: AppColors.rose600,
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              ),
            )
          else
            const SizedBox(width: 48, height: 40),
          PrimaryButton(
            label: nextLabel,
            onPressed: onNext,
          ),
        ],
      ),
    );
  }
}
