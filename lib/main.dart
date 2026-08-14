import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// --- Tokens (step 1) -------------------------------------------------
// Swap primaryBlue for your exact brand hex once you have it.
const Color primaryBlue = Color(0xFF2148CE);
const Color primaryTint = Color(0xFFE8ECFB);
const Color accentWarm = Color(0xFFFF8A3D);
const Color surface = Color(0xFFF7F8FC);
const Color ink = Color(0xFF12172B);
const Color inkMuted = Color(0xFF6B7280);
const Color border = Color(0xFFE4E7F0);

void main() {
  runApp(const UzinaRedesignApp());
}

class UzinaRedesignApp extends StatelessWidget {
  const UzinaRedesignApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: surface,
        colorScheme: ColorScheme.fromSeed(seedColor: primaryBlue),
      ),
      home: const MatchesFeedScreen(),
    );
  }
}

// --- Step 2: shell + header, no cards yet -----------------------------
class MatchesFeedScreen extends StatelessWidget {
  const MatchesFeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
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
                        'Hi Sohan',
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
                    child: const Icon(Icons.notifications_none,
                        size: 18, color: primaryBlue),
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
              const _PropertyCard(
                imageUrl: 'https://images.unsplash.com/photo-1568605114967-8130f3a36994?w=800',
                price: '\$725,000',
                beds: 4,
                baths: 3,
                sqft: 2450,
                tags:  ['Good schools', 'Yard'],        
              )
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

class _PropertyCard extends StatelessWidget {
  const _PropertyCard({
    required this.imageUrl,
    required this.price,
    required this.beds,
    required this.baths,
    required this.sqft,
    required this.tags,
  });

  final String imageUrl;
  final String price;
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
      child: Column(
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