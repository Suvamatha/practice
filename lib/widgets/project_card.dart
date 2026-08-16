import 'package:flutter/material.dart';

import '../models/project.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

class ProjectCard extends StatelessWidget {
  const ProjectCard({super.key, required this.project});

  final Project project;

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
          Stack(
            children: [
              Image.network(project.imageUrl, height: 110, width: double.infinity, fit: BoxFit.cover),
              Positioned(
                top: 10,
                left: 10,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: primaryBlue,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(project.status, style: AppText.label(size: 10, color: Colors.white)),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(14, 10, 14, 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(project.name, style: AppText.heading(size: 15)),
                const SizedBox(height: 2),
                Row(
                  children: [
                    const Icon(Icons.location_on_outlined, size: 12, color: inkMuted),
                    const SizedBox(width: 3),
                    Text(project.location, style: AppText.label(size: 11, color: inkMuted)),
                  ],
                ),
                const SizedBox(height: 8),
                Text(project.priceRange, style: AppText.body(size: 14, weight: FontWeight.w600, color: ink)),
                const SizedBox(height: 4),
                Text(project.unitTypes, style: AppText.label(size: 11, color: inkMuted)),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${project.unitsAvailable} of ${project.totalUnits} available',
                      style: AppText.label(size: 11, color: primaryBlue, weight: FontWeight.w600),
                    ),
                    Text(project.developer, style: AppText.label(size: 10, color: inkMuted)),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}