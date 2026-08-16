import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

class AppBottomNav extends StatelessWidget {
  const AppBottomNav({super.key, required this.selectedIndex, required this.onSelect});

  final int selectedIndex;
  final ValueChanged<int> onSelect;

  static const _items = [
    (Icons.home_outlined, Icons.home, 'Matches'),
    (Icons.favorite_border, Icons.favorite, 'Saved'),
    (Icons.search_outlined, Icons.search, 'Search'),
    (Icons.chat_bubble_outline, Icons.chat_bubble, 'Messages'),
    (Icons.person_outline, Icons.person, 'Profile'),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: border)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(_items.length, (index) {
          final (outlineIcon, filledIcon, label) = _items[index];
          final isSelected = index == selectedIndex;
          return GestureDetector(
            onTap: () => onSelect(index),
            behavior: HitTestBehavior.opaque,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  isSelected ? filledIcon : outlineIcon,
                  size: 22,
                  color: isSelected ? primaryBlue : inkFaint,
                ),
                const SizedBox(height: 2),
                Text(
                  label,
                  style: AppText.label(size: 10, color: isSelected ? primaryBlue : inkFaint),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}