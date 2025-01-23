import 'package:flutter/material.dart';
import 'student_feature_card.dart';
import '../../students_page_screen.dart';
class StudentFeaturesSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        StudentFeatureCard(
          icon: Icons.book,
          title: 'Practice Tests',
          description: 'Access a wide range of practice tests to enhance your knowledge',
        ),
        SizedBox(height: 18.0),
        StudentFeatureCard(
          icon: Icons.auto_graph,
          title: 'Track Progress',
          description: 'Monitor your performance and see your improvement over time',
        ),SizedBox(height: 18.0),
        StudentFeatureCard(
          icon: Icons.timelapse_sharp,
          title: 'Flexible Learning',
          description: 'Study at your own pace with 24/7 access to materials',
        ),
      ],
    );
  }
}
