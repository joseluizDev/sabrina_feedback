import 'package:flutter/material.dart';

abstract final class AppColors {
  // Paleta extraída da logo: ardósia (azul acinzentado) + dourado champanhe.
  static const bgStart = Color(0xFFF6F9FC);
  static const bgMid = Color(0xFFEAF1F7);
  static const bgEnd = Color(0xFFDCE7F1);

  static const textDark = Color(0xFF24343F);

  static const slate50 = Color(0xFFF7FAFC);
  static const slate100 = Color(0xFFEDF3F7);
  static const slate200 = Color(0xFFDCE6EE);
  static const slate300 = Color(0xFFB9CBD9);
  static const slate400 = Color(0xFF7C96AB);
  static const slate500 = Color(0xFF627C91);
  static const slate600 = Color(0xFF4C6478);
  static const slate700 = Color(0xFF40586C);
  static const slate800 = Color(0xFF33475A);
  static const slate900 = Color(0xFF24343F);

  static const gold100 = Color(0xFFF8F3E8);
  static const gold200 = Color(0xFFE8DCC2);
  static const gold300 = Color(0xFFD8C8A0);

  static const primaryGradient = LinearGradient(
    colors: [Color(0xFF6E889C), Color(0xFF5B7489), Color(0xFF455C70)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const selectedCircleGradient = LinearGradient(
    colors: [Color(0xFF6E889C), Color(0xFF4C6478)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
