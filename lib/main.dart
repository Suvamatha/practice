import 'package:flutter/material.dart';
import 'package:uzina_redesign/screens/match_feed_screen.dart';

import 'theme/app_colors.dart';

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