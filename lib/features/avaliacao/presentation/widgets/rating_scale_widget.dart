import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import 'avaliacao_constants.dart';

class RatingScaleWidget extends StatelessWidget {
  final int? selectedScore;
  final ValueChanged<int> onSelected;

  const RatingScaleWidget({
    super.key,
    required this.selectedScore,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Linha de botões 1 a 7
        Row(
          children: List.generate(7, (index) {
            final score = index + 1;
            final isSelected = selectedScore == score;
            return Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2.5),
                child: InkWell(
                  borderRadius: BorderRadius.circular(999),
                  onTap: () => onSelected(score),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.easeOut,
                    height: 42,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: isSelected ? AppColors.selectedCircleGradient : null,
                      color: isSelected ? null : AppColors.slate50.withValues(alpha: 0.8),
                      border: Border.all(
                        color: isSelected ? AppColors.slate600 : AppColors.slate300,
                        width: 1.5,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: isSelected
                              ? AppColors.slate700.withValues(alpha: 0.35)
                              : Colors.transparent,
                          blurRadius: isSelected ? 8 : 0,
                          offset: isSelected ? const Offset(0, 3) : Offset.zero,
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        '$score',
                        style: TextStyle(
                          fontFamily: 'serif',
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: isSelected ? Colors.white : AppColors.slate700,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          }),
        ),
        const SizedBox(height: 12),
        // Legenda e badge de nota com altura reservada e fixa (evita redimensionar o card)
        SizedBox(
          height: 26,
          child: Center(
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 200),
              opacity: selectedScore != null ? 1.0 : 0.0,
              child: selectedScore != null
                  ? Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 3),
                      decoration: BoxDecoration(
                        color: AppColors.gold100,
                        borderRadius: BorderRadius.circular(999),
                      ),
                      child: Text(
                        'Nota $selectedScore • ${scoreLabels[selectedScore]}',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                          color: AppColors.slate700,
                        ),
                      ),
                    )
                  : const SizedBox.shrink(),
            ),
          ),
        ),
        const SizedBox(height: 6),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Pouco satisfatório', style: TextStyle(fontSize: 11, color: AppColors.slate600)),
            Text('Impecável', style: TextStyle(fontSize: 11, color: AppColors.slate600)),
          ],
        ),
      ],
    );
  }
}
