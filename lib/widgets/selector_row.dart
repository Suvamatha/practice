import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

class SelectorRow extends StatelessWidget {
  const SelectorRow({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
    this.onTap,
  });

  final IconData icon;
  final String label;
  final String value;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: border),
        ),
        child: Row(
          children: [
            Container(
              width: 34,
              height: 34,
              decoration: const BoxDecoration(
                color: primaryTint,
                shape: BoxShape.circle,
              ),
              child: Icon(icon, size: 16, color: primaryBlue),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(label, style: AppText.body(size: 13, color: ink)),
            ),
            Text(value, style: AppText.label(size: 12, color: inkMuted)),
            const SizedBox(width: 4),
            const Icon(Icons.keyboard_arrow_down, size: 18, color: inkMuted),
          ],
        ),
      ),
    );
  }
}