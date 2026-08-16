import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

class CategoryTabs extends StatelessWidget {
  const CategoryTabs({super.key, required this.selected, required this.onChanged});

  final String selected;
  final ValueChanged<String> onChanged;

  static const categories = ['House', 'Land'];

  @override
  Widget build(BuildContext context) {
    return Row(
      children: categories.map((c) {
        final isSelected = c == selected;
        return Padding(
          padding: const EdgeInsets.only(right: 8),
          child: GestureDetector(
            onTap: () => onChanged(c),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: isSelected ? primaryBlue : Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: isSelected ? null : Border.all(color: border),
              ),
              child: Text(
                c,
                style: AppText.label(
                  weight: FontWeight.w600,
                  color: isSelected ? Colors.white : inkMuted,
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}