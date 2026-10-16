import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import 'rating_scale_widget.dart';
import 'step_navigation_bar.dart';

class StepSabrina extends StatelessWidget {
  final int? score;
  final ValueChanged<int> onSelectScore;
  final VoidCallback onBack;
  final VoidCallback? onNext;

  const StepSabrina({
    super.key,
    required this.score,
    required this.onSelectScore,
    required this.onBack,
    required this.onNext,
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(minHeight: 520),
      child: Column(
        key: const ValueKey(3),
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  Container(
                    width: 58,
                    height: 58,
                    padding: const EdgeInsets.all(2),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: AppColors.primaryGradient,
                    ),
                    child: Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.rose50,
                      ),
                      child: const Center(
                        child: Text(
                          'S',
                          style: TextStyle(
                            fontFamily: 'serif',
                            fontSize: 26,
                            fontWeight: FontWeight.w700,
                            fontStyle: FontStyle.italic,
                            color: AppColors.rose700,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(3),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: const Text('✦', style: TextStyle(fontSize: 10, color: AppColors.rose500)),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 3),
                decoration: BoxDecoration(
                  color: AppColors.rose50,
                  border: Border.all(color: AppColors.rose200),
                  borderRadius: BorderRadius.circular(999),
                ),
                child: const Text(
                  'Atendimento Personalizado • Sabrina',
                  style: TextStyle(fontSize: 11, fontWeight: FontWeight.w500, color: AppColors.rose600),
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Como foi seu atendimento com a Sabrina?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'serif',
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  color: AppColors.rose900,
                ),
              ),
              const SizedBox(height: 6),
              const Text(
                'Avalie o cuidado, a atenção aos detalhes e a clareza durante o seu atendimento',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.w300, color: AppColors.rose700),
              ),
              const SizedBox(height: 22),
              RatingScaleWidget(
                selectedScore: score,
                onSelected: onSelectScore,
              ),
            ],
          ),
          StepNavigationBar(
            onBack: onBack,
            nextLabel: 'Continuar',
            onNext: onNext,
          ),
        ],
      ),
    );
  }
}
