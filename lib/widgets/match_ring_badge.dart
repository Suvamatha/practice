import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../theme/app_colors.dart';

class MatchRingBadge extends StatelessWidget {
  const MatchRingBadge({super.key, required this.percent});

  final int percent;
  static const double size = 48;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(color: Color(0x1A12172B), blurRadius: 8, offset: Offset(0, 2)),
        ],
      ),
      child: CustomPaint(
        painter: _RingPainter(percent: percent),
        child: Center(
          child: Text(
            '$percent%',
            style: GoogleFonts.inter(
              fontSize: 11,
              fontWeight: FontWeight.w600,
              color: primaryBlue,
            ),
          ),
        ),
      ),
    );
  }
}

class _RingPainter extends CustomPainter {
  _RingPainter({required this.percent});
  final int percent;

  @override
  void paint(Canvas canvas, Size size) {
    final center = size.center(Offset.zero);
    final radius = (size.shortestSide - 3.5) / 2;

    canvas.drawCircle(center, radius + 1.75, Paint()..color = Colors.white);

    canvas.drawCircle(
      center,
      radius,
      Paint()
        ..color = border
        ..style = PaintingStyle.stroke
        ..strokeWidth = 3.5,
    );

    final sweep = 2 * 3.14159265 * (percent / 100);
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -3.14159265 / 2,
      sweep,
      false,
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 3.5
        ..strokeCap = StrokeCap.round
        ..shader = SweepGradient(
          startAngle: 0,
          endAngle: sweep == 0 ? 0.001 : sweep,
          colors: const [primaryBlue, accentWarm],
          transform: const GradientRotation(-3.14159265 / 2),
        ).createShader(Rect.fromCircle(center: center, radius: radius)),
    );
  }

  @override
  bool shouldRepaint(covariant _RingPainter oldDelegate) => oldDelegate.percent != percent;
}