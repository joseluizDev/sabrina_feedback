import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import 'rating_scale_widget.dart';
import 'step_navigation_bar.dart';

class StepWhatsapp extends StatelessWidget {
  final int? score;
  final ValueChanged<int> onSelectScore;
  final VoidCallback onBack;
  final VoidCallback? onNext;

  const StepWhatsapp({
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
        key: const ValueKey(2),
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 52,
                height: 52,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.rose50,
                  border: Border.all(color: AppColors.rose200),
                ),
                child: const Icon(Icons.chat_bubble_outline_rounded, color: AppColors.rose500, size: 24),
              ),
              const SizedBox(height: 12),
              const Text(
                'RECEPÇÃO & AGENDAMENTO',
                style: TextStyle(
                  fontSize: 11,
                  letterSpacing: 2.0,
                  fontWeight: FontWeight.w600,
                  color: AppColors.rose400,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Como foi seu atendimento pelo WhatsApp?',
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
                'Toque em um dos círculos abaixo para classificar a gentileza e agilidade',
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
