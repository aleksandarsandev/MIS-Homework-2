import 'package:domasna2/states/home/home_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'widgets/custom/custom_top_menu.dart';
import 'widgets/edit_test_section.dart';

class TeacherEditTestPage extends StatelessWidget {
  final String title;
  final String description;
  final String numQuestions;
  final String timeLimit;
  final String subject;
  final String partOfYear;
  final String grade;
  final String difficulty;
  final String testType;

  const TeacherEditTestPage({
    Key? key,
    required this.title,
    required this.description,
    required this.numQuestions,
    required this.timeLimit,
    required this.subject,
    required this.partOfYear,
    required this.grade,
    required this.difficulty,
    required this.testType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final homeState = Provider.of<HomeState>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Test',
          style: TextStyle(
              fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: const Color(0xFF3E47FF),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Center(
              child: Text(
                'Hi, Admin',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
      backgroundColor: const Color(0xFFF5F4F4),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                EditTestSection(
                  title: title,
                  description: description,
                  numQuestions: numQuestions,
                  timeLimit: timeLimit,
                  subject: subject,
                  partOfYear: partOfYear,
                  grade: grade,
                  difficulty: difficulty,
                  testType: testType,
                ),
              ],
            ),
          ),
          if (homeState.isMenuOpen)
            Positioned(
              child: CustomTopMenu(onClose: homeState.toggleMenu),
            ),
        ],
      ),
    );
  }
}
