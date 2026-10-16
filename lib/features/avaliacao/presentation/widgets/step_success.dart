import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';

class StepSuccess extends StatelessWidget {
  final int? whatsappScore;
  final int? sabrinaScore;
  final String comment;
  final VoidCallback onReset;

  const StepSuccess({
    super.key,
    required this.whatsappScore,
    required this.sabrinaScore,
    required this.comment,
    required this.onReset,
  });

  @override
  Widget build(BuildContext context) {
    final trimmedComment = comment.trim();
    return ConstrainedBox(
      constraints: const BoxConstraints(minHeight: 520),
      child: Column(
        key: const ValueKey(5),
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 72,
                height: 72,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.rose50,
                  border: Border.all(color: AppColors.rose300),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.rose400.withValues(alpha: 0.3),
                      blurRadius: 18,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                child: const Icon(Icons.check_rounded, color: AppColors.rose600, size: 38),
              ),
              const SizedBox(height: 14),
              const Text(
                'AVALIAÇÃO RECEBIDA',
                style: TextStyle(
                  fontSize: 11,
                  letterSpacing: 2.5,
                  fontWeight: FontWeight.w600,
                  color: AppColors.rose400,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Gratidão pelo seu carinho!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'serif',
                  fontSize: 26,
                  fontWeight: FontWeight.w600,
                  color: AppColors.rose900,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Sua presença ilumina nossa clínica. Esperamos receber você novamente em breve para mais momentos de autocuidado e beleza.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.w300, color: AppColors.rose800),
              ),
              const SizedBox(height: 18),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.rose50.withValues(alpha: 0.7),
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(color: AppColors.rose200),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'RESUMO DA SUA EXPERIÊNCIA',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 1.5,
                            color: AppColors.rose400,
                          ),
                        ),
                        Text('✦', style: TextStyle(color: AppColors.rose400, fontSize: 11)),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Expanded(
                          child: _buildSummaryBadge('WhatsApp', '${whatsappScore ?? "-"}/7'),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: _buildSummaryBadge('Sabrina', '${sabrinaScore ?? "-"}/7'),
                        ),
                      ],
                    ),
                    if (trimmedComment.isNotEmpty) ...[
                      const SizedBox(height: 10),
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: AppColors.rose100),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'SEU COMENTÁRIO:',
                              style: TextStyle(fontSize: 9, fontWeight: FontWeight.w700, letterSpacing: 1.2, color: AppColors.rose400),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              '"$trimmedComment"',
                              style: const TextStyle(fontSize: 12, fontStyle: FontStyle.italic, color: AppColors.rose800),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.only(top: 14),
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(color: AppColors.rose100, width: 1),
              ),
            ),
            child: Center(
              child: OutlinedButton.icon(
                onPressed: onReset,
                icon: const Icon(Icons.refresh_rounded, size: 16),
                label: const Text('ENVIAR NOVO FEEDBACK', style: TextStyle(letterSpacing: 1.5, fontSize: 11)),
                style: OutlinedButton.styleFrom(
                  foregroundColor: AppColors.rose600,
                  side: const BorderSide(color: AppColors.rose300),
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(999)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryBadge(String label, String value) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.rose100),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(fontSize: 12, color: AppColors.rose700)),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            decoration: BoxDecoration(
              color: AppColors.rose100,
              borderRadius: BorderRadius.circular(999),
            ),
            child: Text(
              value,
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: AppColors.rose900),
            ),
          ),
        ],
      ),
    );
  }
}
