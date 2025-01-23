import 'package:domasna2/screens/admin/admin_home_page.dart';
import 'package:flutter/material.dart';

import '../question_bank_page.dart';
import '../teacher_create_test_page.dart';

class TeacherHeaderSection extends StatefulWidget {
  final Function(bool) onToggleView;

  const TeacherHeaderSection({
    Key? key,
    required this.onToggleView,
  }) : super(key: key);

  @override
  State<TeacherHeaderSection> createState() => _TeacherHeaderSectionState();
}

class _TeacherHeaderSectionState extends State<TeacherHeaderSection> {
  bool showAllTests = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AdminHomePage()),
                  );
                },
                child: Row(
                  children: [
                    Icon(Icons.arrow_back, color: Colors.blue[700]),
                    const SizedBox(width: 8),
                    Text(
                      'Back',
                      style:
                          TextStyle(color: Color(0xFF3E47FF), fontSize: 16.0),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 110),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      showAllTests ? Color(0xFF3E47FF) : Colors.white,
                  foregroundColor:
                      showAllTests ? Colors.white : Color(0xFF3E47FF),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(width: 2)),
                ),
                onPressed: () {
                  setState(() {
                    showAllTests = true;
                  });
                  widget.onToggleView(true);
                },
                child: const Text('All tests'),
              ),
            ],
          ),
          Row(
            children: [
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(width: 2)),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TeacherCreateTestPage()),
                  );
                },
                icon: const Icon(Icons.add, color: Colors.white),
                label: const Text('Create new test'),
              ),
              const SizedBox(width: 8),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF3E47FF),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(width: 2)),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => QuestionBankPage()),
                  );
                },
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.quiz, color: Colors.white),
                    SizedBox(width: 4),
                    Text('Questions'),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
