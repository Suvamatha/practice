import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/property_match.dart';
import '../theme/app_colors.dart';
import '../widgets/property_card.dart';

class MatchesFeedScreen extends StatelessWidget {
  const MatchesFeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hi sir',
                        style: GoogleFonts.inter(fontSize: 12, color: inkMuted),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        "Today's top matches",
                        style: GoogleFonts.fraunces(
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                          color: ink,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: 38,
                    height: 38,
                    decoration: const BoxDecoration(
                      color: primaryTint,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.notifications_none, size: 18, color: primaryBlue),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  _chip('Top matches', selected: true),
                  const SizedBox(width: 8),
                  _chip('Filters', selected: false),
                ],
              ),
              const SizedBox(height: 24),
              for (final property in sampleMatches) ...[
                PropertyCard(
                  imageUrl: property.imageUrl,
                  price: property.price,
                  percent: property.percent,
                  beds: property.beds,
                  baths: property.baths,
                  sqft: property.sqft,
                  tags: property.tags,
                ),
                const SizedBox(height: 16),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _chip(String label, {required bool selected}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: selected ? primaryBlue : Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: selected ? null : Border.all(color: border),
      ),
      child: Text(
        label,
        style: GoogleFonts.inter(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: selected ? Colors.white : inkMuted,
        ),
      ),
    );
  }
}