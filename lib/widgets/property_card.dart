import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../theme/app_colors.dart';
import 'match_ring_badge.dart';

class PropertyCard extends StatelessWidget {
  const PropertyCard({
    super.key,
    required this.imageUrl,
    required this.price,
    required this.percent,
    required this.beds,
    required this.baths,
    required this.sqft,
    required this.tags,
  });

  final String imageUrl;
  final String price;
  final int percent;
  final int beds;
  final int baths;
  final int sqft;
  final List<String> tags;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: border),
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(imageUrl, height: 150, width: double.infinity, fit: BoxFit.cover),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      price,
                      style: GoogleFonts.fraunces(
                        fontSize: 19,
                        fontWeight: FontWeight.w500,
                        color: ink,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        _spec(Icons.bed_outlined, '$beds bed'),
                        const SizedBox(width: 12),
                        _spec(Icons.bathtub_outlined, '$baths bath'),
                        const SizedBox(width: 12),
                        _spec(Icons.straighten_outlined, '$sqft sqft'),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Wrap(
                      spacing: 6,
                      children: tags
                          .map((t) => Container(
                                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                                decoration: BoxDecoration(
                                  color: primaryTint,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Text(
                                  t,
                                  style: GoogleFonts.inter(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w500,
                                    color: primaryBlue,
                                  ),
                                ),
                              ))
                          .toList(),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            top: 150 - 24,
            right: 16,
            child: MatchRingBadge(percent: percent),
          ),
        ],
      ),
    );
  }

  Widget _spec(IconData icon, String label) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 14, color: inkMuted),
        const SizedBox(width: 4),
        Text(label, style: GoogleFonts.inter(fontSize: 12, color: inkMuted)),
      ],
    );
  }
}
