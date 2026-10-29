import 'package:flutter/material.dart';

import 'core/theme/app_colors.dart';
import 'features/avaliacao/presentation/pages/avaliacao_page.dart';

class SabrinaFeedbackApp extends StatelessWidget {
  const SabrinaFeedbackApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Avaliação',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'sans-serif',
        scaffoldBackgroundColor: AppColors.bgStart,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.slate500,
          primary: AppColors.slate600,
        ),
      ),
      home: const AvaliacaoPage(),
    );
  }
}
