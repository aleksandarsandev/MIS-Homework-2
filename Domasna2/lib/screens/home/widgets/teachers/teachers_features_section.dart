import 'package:flutter/material.dart';
import '../students/student_feature_card.dart';
import '../../students_page_screen.dart';
class TeachersFeaturesSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        StudentFeatureCard(
          icon: Icons.book,
          title: 'Test Creation',
          description: 'Create and customize tests with our intuitive interface',
        ),
        SizedBox(height: 18.0),
        StudentFeatureCard(
          icon: Icons.analytics_outlined,
          title: 'Advanced Analytics',
          description: 'Get detailed insights into student performance',
        ),SizedBox(height: 18.0),
        StudentFeatureCard(
          icon: Icons.people,
          title: 'Collaboration',
          description: 'Share resources and collaborate with other educators',
        ),
      ],
    );
  }
}
