import 'package:flutter/material.dart';

import '../students_page_screen.dart';
import '../teachers_page_screen.dart';
import 'feature_card.dart';

class FeaturesSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FeatureCard(
          icon: Icons.school,
          title: 'For Students',
          description:
              'Take tests, track your progress, and improve your knowledge.',
          targetScreen: StudentsPageScreen(),
        ),
        SizedBox(height: 24.0),
        FeatureCard(
          icon: Icons.person,
          title: 'For Teachers',
          description:
              'Create tests, monitor student progress, and gain insights.',
          targetScreen: TeachersPageScreen(),
        ),
      ],
    );
  }
}
