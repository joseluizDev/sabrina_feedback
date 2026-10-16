import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';

class LotusBadge extends StatelessWidget {
  final double size;

  const LotusBadge({super.key, this.size = 88});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.rose50,
        border: Border.all(color: AppColors.rose200),
        boxShadow: [
          BoxShadow(
            color: AppColors.rose400.withValues(alpha: 0.25),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Center(
        child: CustomPaint(
          size: Size(size * 0.5, size * 0.5),
          painter: const _LotusPainter(),
        ),
      ),
    );
  }
}

class _LotusPainter extends CustomPainter {
  const _LotusPainter();

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.rose500
      ..strokeWidth = 1.4
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final w = size.width;
    final h = size.height;

    // Pétala Central
    final centerPetal = Path()
      ..moveTo(w * 0.5, h * 0.28)
      ..cubicTo(w * 0.38, h * 0.42, w * 0.40, h * 0.65, w * 0.5, h * 0.78)
      ..cubicTo(w * 0.60, h * 0.65, w * 0.62, h * 0.42, w * 0.5, h * 0.28);
    canvas.drawPath(centerPetal, paint);

    // Pétala Esquerda Interna
    final leftPetal = Path()
      ..moveTo(w * 0.5, h * 0.78)
      ..cubicTo(w * 0.32, h * 0.72, w * 0.26, h * 0.50, w * 0.30, h * 0.35)
      ..cubicTo(w * 0.38, h * 0.42, w * 0.44, h * 0.55, w * 0.5, h * 0.78);
    canvas.drawPath(leftPetal, paint);

    // Pétala Direita Interna
    final rightPetal = Path()
      ..moveTo(w * 0.5, h * 0.78)
      ..cubicTo(w * 0.68, h * 0.72, w * 0.74, h * 0.50, w * 0.70, h * 0.35)
      ..cubicTo(w * 0.62, h * 0.42, w * 0.56, h * 0.55, w * 0.5, h * 0.78);
    canvas.drawPath(rightPetal, paint);

    // Arco inferior
    final arc = Path()
      ..moveTo(w * 0.30, h * 0.85)
      ..quadraticBezierTo(w * 0.5, h * 0.90, w * 0.70, h * 0.85);
    canvas.drawPath(arc, paint);

    // Brilho / Estrela superior
    canvas.drawLine(Offset(w * 0.5, h * 0.12), Offset(w * 0.5, h * 0.22), paint);
    canvas.drawLine(Offset(w * 0.45, h * 0.17), Offset(w * 0.55, h * 0.17), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
