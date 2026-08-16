import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';
import '../widgets/selector_row.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  String _propertyType = 'House';
  String _location = 'Austin, TX';
  String _budget = '\$400K - \$800K';
  String _bedrooms = '3+';
  String _importantTo = 'Garage, Yard';

  Future<void> _pickPropertyType() async {
    final result = await showModalBottomSheet<String>(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        const options = ['House', 'Apartment', 'Land', 'Condo'];
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: options
                .map((option) => ListTile(
                      title: Text(option, style: AppText.body(size: 14)),
                      trailing: option == _propertyType
                          ? const Icon(Icons.check, color: primaryBlue, size: 18)
                          : null,
                      onTap: () => Navigator.of(context).pop(option),
                    ))
                .toList(),
          ),
        );
      },
    );

    if (result != null) {
      setState(() => _propertyType = result);
    }
  }

  Future<void> _pickLocation() async {
    final result = await showModalBottomSheet<String>(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        const options = ['Austin, TX', 'Dallas, TX', 'Houston, TX', 'San Antonio, TX'];
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: options
                .map((option) => ListTile(
                      title: Text(option, style: AppText.body(size: 14)),
                      trailing: option == _location
                          ? const Icon(Icons.check, color: primaryBlue, size: 18)
                          : null,
                      onTap: () => Navigator.of(context).pop(option),
                    ))
                .toList(),
          ),
        );
      },
    );

    if (result != null) {
      setState(() => _location = result);
    }
  }

  Future<void> _pickBudget() async {
    final result = await showModalBottomSheet<String>(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        const options = ['\$200K - \$400K', '\$400K - \$800K', '\$800K - \$1.2M', '\$1.2M+'];
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: options
                .map((option) => ListTile(
                      title: Text(option, style: AppText.body(size: 14)),
                      trailing: option == _budget
                          ? const Icon(Icons.check, color: primaryBlue, size: 18)
                          : null,
                      onTap: () => Navigator.of(context).pop(option),
                    ))
                .toList(),
          ),
        );
      },
    );

    if (result != null) {
      setState(() => _budget = result);
    }
  }

  Future<void> _pickBedrooms() async {
    final result = await showModalBottomSheet<String>(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        const options = ['1+', '2+', '3+', '4+'];
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: options
                .map((option) => ListTile(
                      title: Text(option, style: AppText.body(size: 14)),
                      trailing: option == _bedrooms
                          ? const Icon(Icons.check, color: primaryBlue, size: 18)
                          : null,
                      onTap: () => Navigator.of(context).pop(option),
                    ))
                .toList(),
          ),
        );
      },
    );

    if (result != null) {
      setState(() => _bedrooms = result);
    }
  }

  Future<void> _pickImportantTo() async {
    final result = await showModalBottomSheet<String>(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        const options = ['Garage, Yard', 'Pool, Garage', 'Yard, Pet-friendly', 'Modern Kitchen'];
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: options
                .map((option) => ListTile(
                      title: Text(option, style: AppText.body(size: 14)),
                      trailing: option == _importantTo
                          ? const Icon(Icons.check, color: primaryBlue, size: 18)
                          : null,
                      onTap: () => Navigator.of(context).pop(option),
                    ))
                .toList(),
          ),
        );
      },
    );

    if (result != null) {
      setState(() => _importantTo = result);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: surface,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: LinearProgressIndicator(
                        value: 0.25,
                        minHeight: 4,
                        backgroundColor: border,
                        valueColor: const AlwaysStoppedAnimation(primaryBlue),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Text('Step 1 of 4', style: AppText.label(size: 12, color: inkMuted)),
                ],
              ),
              const SizedBox(height: 24),
              Text(
                "Let's find your dream home",
                style: AppText.heading(size: 24, height: 1.25),
              ),
              RichText(
                text: TextSpan(
                  style: AppText.heading(size: 24, height: 1.25),
                  children: [
                    const TextSpan(text: 'with '),
                    TextSpan(
                      text: 'AI Matching',
                      style: AppText.heading(size: 24, height: 1.25, color: primaryBlue),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 6),
              Text(
                "Our AI will match you with homes you'll love.",
                style: AppText.body(size: 13, color: inkMuted),
              ),
              const SizedBox(height: 28),
              SelectorRow(
                icon: Icons.home_outlined,
                label: 'What type of home?',
                value: _propertyType,
                onTap: _pickPropertyType,
              ),
              const SizedBox(height: 12),
              SelectorRow(
                icon: Icons.location_on_outlined,
                label: 'Where you want to live?',
                value: _location,
                onTap: () {},
              ),
              const SizedBox(height: 12),
              SelectorRow(
                icon: Icons.attach_money,
                label: 'Your budget range?',
                value: _budget,
                onTap: () {},
              ),
              const SizedBox(height: 12),
              SelectorRow(
                icon: Icons.bed_outlined,
                label: 'How many bedrooms?',
                value: _bedrooms,
                onTap: () {},
              ),
              const SizedBox(height: 12),
              SelectorRow(
                icon: Icons.favorite_border,
                label: "What's important?",
                value: _importantTo,
                onTap: () {},
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryBlue,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  child: Text('Find My Matches', style: AppText.body(size: 15, weight: FontWeight.w600, color: Colors.white)),
                ),
              ),
              const SizedBox(height: 8),
              Center(
                child: Text(
                  'Your info is secure and never shared.',
                  style: AppText.label(size: 11, color: inkMuted),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}