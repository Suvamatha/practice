import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

class HorizontalSection<T> extends StatelessWidget {
  const HorizontalSection({
    super.key,
    required this.title,
    required this.items,
    required this.itemBuilder,
    this.cardWidth = 245,
    this.height = 270,
    this.onSeeAll,
  });

  final String title;
  final List<T> items;
  final Widget Function(BuildContext context, T item) itemBuilder;
  final double cardWidth;
  final double height;
  final VoidCallback? onSeeAll;

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title, style: AppText.heading(size: 17)),
            if (onSeeAll != null)
              GestureDetector(
                onTap: onSeeAll,
                child: Text('See all', style: AppText.label(size: 12, color: primaryBlue)),
              ),
          ],
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: height,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: items.length,
            separatorBuilder: (_, __) => const SizedBox(width: 12),
            itemBuilder: (context, index) => SizedBox(
              width: cardWidth,
              child: itemBuilder(context, items[index]),
            ),
          ),
        ),
      ],
    );
  }
}
