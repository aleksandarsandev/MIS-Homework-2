import 'package:domasna2/states/home/home_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'widgets/add_existing_question_section.dart';
import 'widgets/create_question_section.dart';
import 'widgets/custom/custom_top_menu.dart';
import 'widgets/question_manage_section.dart';

class AddQuestionTestPage extends StatefulWidget {
  final String title;

  const AddQuestionTestPage({Key? key, required this.title}) : super(key: key);

  @override
  State<AddQuestionTestPage> createState() => _AddQuestionTestPageState();
}

class _AddQuestionTestPageState extends State<AddQuestionTestPage> {
  bool addNewQuestion = true;

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
                QuestionManageSection(
                  onToggleView: (bool value) {
                    setState(() {
                      addNewQuestion = value;
                    });
                  },
                ),
                if (addNewQuestion) ...[
                  CreateQuestionSection(),
                  SizedBox(height: 30)
                ] else
                  AddExistingQuestionSection(
                    testTitle: widget.title,
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
