import 'package:flutter/material.dart';

abstract final class AppColors {
  static const bgStart = Color(0xFFFDF8F7);
  static const bgMid = Color(0xFFF9ECEA);
  static const bgEnd = Color(0xFFF2E2DC);

  static const textDark = Color(0xFF4A3533);

  static const rose50 = Color(0xFFFDF8F7);
  static const rose100 = Color(0xFFFAEEEC);
  static const rose200 = Color(0xFFF3D9D6);
  static const rose300 = Color(0xFFE7BCB7);
  static const rose400 = Color(0xFFD6958F);
  static const rose500 = Color(0xFFC2746D);
  static const rose600 = Color(0xFFAD5B54);
  static const rose700 = Color(0xFF8F4741);
  static const rose800 = Color(0xFF773D38);
  static const rose900 = Color(0xFF542B28);

  static const champagne100 = Color(0xFFF7F1E8);
  static const champagne200 = Color(0xFFEFE2D0);
  static const champagne300 = Color(0xFFE2CBA8);

  static const primaryGradient = LinearGradient(
    colors: [Color(0xFFCC8882), Color(0xFFB56962), Color(0xFF9E524B)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const selectedCircleGradient = LinearGradient(
    colors: [Color(0xFFCC8882), Color(0xFFB0625B)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
