import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import 'lotus_badge.dart';
import 'step_navigation_bar.dart';

class StepWelcome extends StatelessWidget {
  final VoidCallback onNext;

  const StepWelcome({super.key, required this.onNext});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(minHeight: 520),
      child: Column(
        key: const ValueKey(1),
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const LotusBadge(),
              const SizedBox(height: 16),
              const Text(
                'ESTÉTICA AVANÇADA & BEM-ESTAR',
                style: TextStyle(
                  fontSize: 11,
                  letterSpacing: 2.5,
                  fontWeight: FontWeight.w600,
                  color: AppColors.slate600,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Como foi o seu momento conosco?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'serif',
                  fontSize: 28,
                  fontWeight: FontWeight.w600,
                  color: AppColors.slate900,
                ),
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(width: 32, height: 1, color: AppColors.gold200),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Text('✦', style: TextStyle(color: AppColors.gold300, fontSize: 11)),
                  ),
                  Container(width: 32, height: 1, color: AppColors.gold200),
                ],
              ),
              const SizedBox(height: 14),
              const Text(
                'Cada detalhe da nossa clínica é pensado para encantar você. Compartilhe sua percepção em menos de 30 segundos.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                  color: AppColors.slate800,
                  height: 1.5,
                ),
              ),
            ],
          ),
          StepNavigationBar(
            nextLabel: 'Prosseguir',
            onNext: onNext,
          ),
        ],
      ),
    );
  }
}
