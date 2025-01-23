import 'package:domasna2/states/home/home_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'widgets/filters_section.dart';
import 'widgets/teacher_header_section.dart';
import 'widgets/test_card_widget.dart';

class TeacherHomePage extends StatefulWidget {
  @override
  State<TeacherHomePage> createState() => _TeacherHomePageState();
}

class _TeacherHomePageState extends State<TeacherHomePage> {
  bool showAllTests = true;

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
                TeacherHeaderSection(
                  onToggleView: (bool value) {
                    setState(() {
                      showAllTests = value;
                    });
                  },
                ),
                FiltersSection(),
                if (showAllTests) ...[
                  TestCard(
                    title: 'Тест по македонски јазик',
                    preTestText: 'Прв тест',
                    questionsText: '3 questions',
                    timeText: '2 minutes',
                    gradeText: '1st Year Secondary',
                    difficultyText: 'Basic',
                    testType: 'Final Test',
                  ),
                  TestCard(
                    title: 'Тест по математика',
                    preTestText: 'Овој тест е за вежбање за крајот на ноември',
                    questionsText: '3 questions',
                    timeText: '2 minutes',
                    subjectText: 'Mathematics',
                    partOfYearText: 'First Trimester',
                    testType: 'Written Test',
                  ),
                  SizedBox(height: 30)
                ] else
                  TestCard(
                    title: 'Тест по македонски јазик',
                    preTestText: 'Прв тест',
                    questionsText: '3 questions',
                    timeText: '2 minutes',
                    gradeText: '1st Year Secondary',
                    difficultyText: 'Basic',
                    testType: 'Final Test',
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
