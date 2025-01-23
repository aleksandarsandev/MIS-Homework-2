import 'package:domasna2/screens/teacher/teacher_home_page.dart';
import 'package:flutter/material.dart';

import 'custom/custom_dropdown.dart';
import 'custom/custom_text_field.dart';

class EditTestSection extends StatefulWidget {
  final String title;
  final String description;
  final String numQuestions;
  final String timeLimit;
  final String subject;
  final String partOfYear;
  final String grade;
  final String difficulty;
  final String testType;

  const EditTestSection({
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
  _EditTestSectionState createState() => _EditTestSectionState();
}

class _EditTestSectionState extends State<EditTestSection> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _numQuestionsController = TextEditingController();
  final TextEditingController _timeLimitController = TextEditingController();

  String? _selectedSubject;
  String? _selectedPartOfYear;
  String? _selectedGrade;
  String? _selectedDifficulty;
  String? _selectedTestType;

  @override
  void initState() {
    super.initState();
    _titleController.text = widget.title;
    _descriptionController.text = widget.description;
    _numQuestionsController.text = widget.numQuestions;
    _timeLimitController.text = widget.timeLimit;
    _selectedSubject = widget.subject;
    _selectedPartOfYear = widget.partOfYear;
    _selectedGrade = widget.grade;
    _selectedDifficulty = widget.difficulty;
    _selectedTestType = widget.testType;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(8),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Edit Test',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF3E47FF),
                ),
              ),
              const SizedBox(height: 16),
              CustomTextField(
                controller: _titleController,
                label: "Title",
                hint: "Enter test title",
              ),
              const SizedBox(height: 14),
              CustomTextField(
                controller: _descriptionController,
                label: "Description",
                hint: "Enter test description",
              ),
              const SizedBox(height: 14),
              CustomTextField(
                controller: _numQuestionsController,
                label: "Number of questions in the test",
                hint: "1",
              ),
              const SizedBox(height: 14),
              CustomTextField(
                controller: _timeLimitController,
                label: "Time limit (minutes)",
                hint: "60",
              ),
              const SizedBox(height: 14),
              const Text(
                'Test Metadata',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 16),
              CustomDropdown(
                label: "Subject",
                hint: _selectedSubject ?? 'Select Subject',
                items: [
                  DropdownMenuItem(
                    value: 'Macedonian Language',
                    child: Text('Macedonian Language'),
                  ),
                  DropdownMenuItem(
                    value: 'Mathematics',
                    child: Text('Mathematics'),
                  ),
                  DropdownMenuItem(
                    value: 'Biology',
                    child: Text('Biology'),
                  ),
                  DropdownMenuItem(
                    value: 'Chemistry',
                    child: Text('Chemistry'),
                  ),
                  DropdownMenuItem(
                    value: 'History',
                    child: Text('History'),
                  ),
                  DropdownMenuItem(
                    value: 'Physics',
                    child: Text('Physics'),
                  ),
                ],
                onChanged: (value) {
                  setState(() {
                    _selectedSubject = value;
                  });
                },
              ),
              const SizedBox(height: 12),
              CustomDropdown(
                label: 'Part of the Year:',
                hint: _selectedPartOfYear ?? 'Select Part Of The Year',
                items: [
                  DropdownMenuItem(
                    value: 'First Trimester',
                    child: Text('First Trimester'),
                  ),
                  DropdownMenuItem(
                    value: 'Second Trimester',
                    child: Text('Second Trimester'),
                  ),
                  DropdownMenuItem(
                    value: 'Third Trimester',
                    child: Text('Third Trimester'),
                  ),
                  DropdownMenuItem(
                    value: 'First Semester',
                    child: Text('First Semester'),
                  ),
                  DropdownMenuItem(
                    value: 'Second Semester',
                    child: Text('Second Semester'),
                  ),
                ],
                onChanged: (value) {
                  setState(() {
                    _selectedPartOfYear = value;
                  });
                },
              ),
              const SizedBox(height: 12),
              CustomDropdown(
                label: 'Grade:',
                hint: _selectedGrade ?? 'Select Grade',
                items: [
                  DropdownMenuItem(
                      value: '1st Grade', child: Text('1st Grade')),
                  DropdownMenuItem(
                      value: '2nd Grade', child: Text('2nd Grade')),
                  DropdownMenuItem(
                      value: '3rd Grade', child: Text('3rd Grade')),
                  DropdownMenuItem(
                      value: '4th Grade', child: Text('4th Grade')),
                  DropdownMenuItem(
                      value: '5th Grade', child: Text('5th Grade')),
                  DropdownMenuItem(
                      value: '6th Grade', child: Text('6th Grade')),
                  DropdownMenuItem(
                      value: '7th Grade', child: Text('7th Grade')),
                  DropdownMenuItem(
                      value: '8th Grade', child: Text('8th Grade')),
                  DropdownMenuItem(
                      value: '9th Grade', child: Text('9th Grade')),
                  DropdownMenuItem(
                      value: '1st Year Secondary',
                      child: Text('1st Year Secondary')),
                  DropdownMenuItem(
                      value: '2nd Year Secondary',
                      child: Text('2nd Year Secondary')),
                  DropdownMenuItem(
                      value: '3rd Year Secondary',
                      child: Text('3rd Year Secondary')),
                  DropdownMenuItem(
                      value: '4th Year Secondary',
                      child: Text('4th Year Secondary')),
                ],
                onChanged: (value) {
                  setState(() {
                    _selectedGrade = value;
                  });
                },
              ),
              const SizedBox(height: 12),
              CustomDropdown(
                label: 'Difficulty:',
                hint: _selectedDifficulty ?? 'Select Difficulty',
                items: [
                  DropdownMenuItem(value: 'Basic', child: Text('Basic')),
                  DropdownMenuItem(
                      value: 'Intermediate', child: Text('Intermediate')),
                  DropdownMenuItem(value: 'Advanced', child: Text('Advanced')),
                ],
                onChanged: (value) {
                  setState(() {
                    _selectedDifficulty = value;
                  });
                },
              ),
              const SizedBox(height: 12),
              CustomDropdown(
                label: 'Test Type:',
                hint: _selectedTestType ?? 'Select Test Type',
                items: [
                  DropdownMenuItem(value: 'Practice', child: Text('Practice')),
                  DropdownMenuItem(
                      value: 'Daily Assessment',
                      child: Text('Daily Assessment')),
                  DropdownMenuItem(
                      value: 'Final Test', child: Text('Final Test')),
                  DropdownMenuItem(
                      value: 'Written Test', child: Text('Written Test')),
                ],
                onChanged: (value) {
                  setState(() {
                    _selectedTestType = value;
                  });
                },
              ),
              const SizedBox(height: 12),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TeacherHomePage(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: BorderSide(width: 2),
                      ),
                      elevation: 5,
                    ),
                    child: const Text(
                      'Cancel',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF3E47FF),
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: BorderSide(width: 2),
                      ),
                      elevation: 5,
                    ),
                    child: const Text(
                      'Save Changes',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
