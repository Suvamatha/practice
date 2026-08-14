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
              // Next step: drop your first PropertyMatchCard here.
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