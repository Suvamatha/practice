import 'package:flutter/material.dart';

import 'package:uzina_redesign/models/project.dart';
import 'package:uzina_redesign/models/property_match.dart';

import 'package:uzina_redesign/theme/app_text_styles.dart';
import 'package:uzina_redesign/widgets/app_logo.dart';
import 'package:uzina_redesign/widgets/project_card.dart';

import '../theme/app_colors.dart';
import '../widgets/bottom_nav.dart';
import '../widgets/category_tabs.dart';
import '../widgets/property_card.dart';
import '../widgets/property_section.dart';
import '../widgets/search_bar.dart';
import 'onboarding_screen.dart';

class MatchesFeedScreen extends StatefulWidget {
  const MatchesFeedScreen({super.key});

  @override
  State<MatchesFeedScreen> createState() => _MatchesFeedScreenState();
}

class _MatchesFeedScreenState extends State<MatchesFeedScreen> {
  String _selectedCategory = 'House';
  int _selectedNavIndex = 0;

  @override
  Widget build(BuildContext context) {
    final filtered = sampleMatches
        .where((property) => property.category == _selectedCategory)
        .toList();

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(
                  20,
                  16,
                  20,
                  24,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const AppLogo(),

                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (_) => const OnboardingScreen(),
                              ),
                            );
                          },
                          child: Container(
                            width: 33,
                            height: 33,
                            decoration: const BoxDecoration(
                              color: primaryTint,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.notifications_none,
                              size: 20,
                              color: primaryBlue,
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 16),

                    Text(
                      "Today's top matches",
                      style: AppText.heading(size: 22),
                    ),

                    const SizedBox(height: 16),

                    const AppSearchBar(),

                    const SizedBox(height: 16),

                    CategoryTabs(
                      selected: _selectedCategory,
                      onChanged: (category) {
                        setState(() {
                          _selectedCategory = category;
                        });
                      },
                    ),

                    const SizedBox(height: 24),

                    HorizontalSection<PropertyMatch>(
                      title: 'Featured properties',
                      items: sampleFeatured,
                      itemBuilder: (context, property) {
                        return PropertyCard(
                          imageUrl: property.imageUrl,
                          price: property.price,
                          percent: property.percent,
                          beds: property.beds,
                          baths: property.baths,
                          sqft: property.sqft,
                          tags: property.tags,
                        );
                      },
                      onSeeAll: () {},
                    ),

                    const SizedBox(height: 28),

                    HorizontalSection<Project>(
                      title: 'Projects',
                      items: sampleProjects,
                      itemBuilder: (context, project) {
                        return ProjectCard(
                          project: project,
                        );
                      },
                      height: 250,
                      onSeeAll: () {},
                    ),
                    const SizedBox(height: 28),
                    Text(
                      'Your top matches',
                      style: AppText.heading(size: 17),
                    ),
                    const SizedBox(height: 12),

                    for (final property in filtered) ...[
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

            AppBottomNav(
              selectedIndex: _selectedNavIndex,
              onSelect: (index) {
                setState(() {
                  _selectedNavIndex = index;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}