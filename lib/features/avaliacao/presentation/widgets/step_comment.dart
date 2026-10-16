import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import 'avaliacao_constants.dart';
import 'step_navigation_bar.dart';

class StepComment extends StatelessWidget {
  final TextEditingController controller;
  final Set<String> selectedTags;
  final ValueChanged<String> onToggleTag;
  final ValueChanged<String> onCommentChanged;
  final VoidCallback onBack;
  final VoidCallback? onSubmit;

  const StepComment({
    super.key,
    required this.controller,
    required this.selectedTags,
    required this.onToggleTag,
    required this.onCommentChanged,
    required this.onBack,
    required this.onSubmit,
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(minHeight: 520),
      child: Column(
        key: const ValueKey(4),
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'TOQUE FINAL',
                    style: TextStyle(
                      fontSize: 11,
                      letterSpacing: 2.0,
                      fontWeight: FontWeight.w600,
                      color: AppColors.rose400,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                    decoration: BoxDecoration(
                      color: AppColors.rose50,
                      borderRadius: BorderRadius.circular(999),
                      border: Border.all(color: AppColors.rose200),
                    ),
                    child: const Text(
                      'Opcional',
                      style: TextStyle(fontSize: 11, color: AppColors.rose600, fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              const Text(
                'Como podemos melhorar sua experiência?',
                style: TextStyle(
                  fontFamily: 'serif',
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  color: AppColors.rose900,
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                'Selecione um dos aspectos abaixo ou escreva uma mensagem carinhosa, sugestão ou elogio.',
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.w300, color: AppColors.rose700),
              ),
              const SizedBox(height: 8),
              Wrap(
                spacing: 6,
                runSpacing: 6,
                children: quickTagsList.map((tag) {
                  final isSelected = selectedTags.contains(tag);
                  return InkWell(
                    borderRadius: BorderRadius.circular(999),
                    onTap: () => onToggleTag(tag),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: isSelected ? AppColors.rose200 : AppColors.rose50.withValues(alpha: 0.8),
                        borderRadius: BorderRadius.circular(999),
                        border: Border.all(
                          color: isSelected ? AppColors.rose500 : AppColors.rose200,
                        ),
                      ),
                      child: Text(
                        '✦ $tag',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                          color: isSelected ? AppColors.rose900 : AppColors.rose700,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: controller,
                onChanged: onCommentChanged,
                maxLines: 3,
                maxLength: 500,
                style: const TextStyle(fontSize: 14, color: AppColors.rose900),
                decoration: InputDecoration(
                  counterText: '',
                  hintText: 'Deixe aqui seu comentário, elogio ou sugestão (opcional)...',
                  hintStyle: TextStyle(fontSize: 13, color: AppColors.rose400),
                  filled: true,
                  fillColor: AppColors.rose50.withValues(alpha: 0.6),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(color: AppColors.rose200),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(color: AppColors.rose200),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(color: AppColors.rose400, width: 1.5),
                  ),
                ),
              ),
            ],
          ),
          StepNavigationBar(
            onBack: onBack,
            nextLabel: 'Enviar Avaliação',
            onNext: onSubmit,
          ),
        ],
      ),
    );
  }
}
