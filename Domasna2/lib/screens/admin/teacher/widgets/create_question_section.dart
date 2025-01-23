import 'package:flutter/material.dart';

import 'custom/custom_dropdown.dart';
import 'custom/custom_text_field.dart';

enum QuestionType { trueFalse, multipleChoice, essay }

class CreateQuestionSection extends StatefulWidget {
  @override
  _CreateQuestionSectionState createState() => _CreateQuestionSectionState();
}

class _CreateQuestionSectionState extends State<CreateQuestionSection> {
  dynamic _selectedAnswer;
  final TextEditingController _essayController = TextEditingController();
  QuestionType _selectedQuestionType = QuestionType.trueFalse;
  List<TextEditingController> _controllers = [];
  List<String> _choices = ['Option 1', 'Option 2', 'Option 3', 'Option 4'];
  List<String> _selectedChoices = [];

  @override
  void initState() {
    super.initState();
    for (var choice in _choices) {
      _controllers.add(TextEditingController(text: choice));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Row(
                children: [
                  Icon(Icons.arrow_back, color: Colors.blue[700]),
                  const SizedBox(width: 8),
                  Text(
                    'Back',
                    style: TextStyle(color: Color(0xFF3E47FF), fontSize: 18.0),
                  ),
                ],
              ),
            ),
            Text(
              'Create Question Bank Entry',
              style: TextStyle(
                  fontSize: 28,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              'Create a new question that can be used in future tests',
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            ),
            SizedBox(height: 16),
            CustomDropdown(
              label: 'Question Type:',
              hint: 'True / False',
              items: [
                DropdownMenuItem(
                  value: 'trueFalse',
                  child: Text('True / False'),
                ),
                DropdownMenuItem(
                  value: 'multipleChoice',
                  child: Text('Multiple Choice'),
                ),
                DropdownMenuItem(
                  value: 'essay',
                  child: Text('Essay'),
                ),
              ],
              onChanged: (value) {
                print('Selected value: $value');
                setState(() {
                  if (value == 'trueFalse') {
                    _selectedQuestionType = QuestionType.trueFalse;
                  } else if (value == 'multipleChoice') {
                    _selectedQuestionType = QuestionType.multipleChoice;
                  } else if (value == 'essay') {
                    _selectedQuestionType = QuestionType.essay;
                  }
                });
              },
            ),
            SizedBox(height: 16),
            Text('Question', style: TextStyle(fontSize: 13)),
            SizedBox(height: 8),
            TextField(
              maxLines: 3,
              decoration: InputDecoration(
                hintText: 'Enter your question here...',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 8),
                    CustomTextField(
                      label: 'Points:',
                      hint: '1',
                      isPassword: false,
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 8),
                    CustomTextField(
                      label: 'Negative points per wrong:',
                      hint: '0',
                      isPassword: false,
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 16),
            Text('Image (Optional)',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF22C55E),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    side: BorderSide(width: 2)),
                minimumSize: Size(150, 40),
              ),
              child: Text('Pick an image'),
            ),
            SizedBox(height: 16),
            Text('Answers:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            buildQuestionContent(_selectedQuestionType),
            SizedBox(height: 16),
            Text('Question Metadata',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            CustomDropdown(
              label: "Subject",
              hint: "Select Subject",
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
                print('Selected value: $value');
              },
            ),
            SizedBox(height: 16),
            CustomDropdown(
              label: 'Part of the Year:',
              hint: 'Select Part of the Year',
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
                  value: 'Second Trimester',
                  child: Text('Third Trimester'),
                ),
                DropdownMenuItem(
                  value: 'Second Trimester',
                  child: Text('First Semester'),
                ),
                DropdownMenuItem(
                  value: 'Second Trimester',
                  child: Text('Second Semester'),
                ),
              ],
              onChanged: (value) {
                print('Selected value: $value');
              },
            ),
            SizedBox(height: 16),
            CustomDropdown(
              label: 'Grade:',
              hint: 'Select Grade',
              items: [
                DropdownMenuItem(value: '1st Grade', child: Text('1st Grade')),
                DropdownMenuItem(value: '2nd Grade', child: Text('2nd Grade')),
                DropdownMenuItem(value: '3rd Grade', child: Text('3rd Grade')),
                DropdownMenuItem(value: '4th Grade', child: Text('4th Grade')),
                DropdownMenuItem(value: '5th Grade', child: Text('5th Grade')),
                DropdownMenuItem(value: '6th Grade', child: Text('6th Grade')),
                DropdownMenuItem(value: '7th Grade', child: Text('7th Grade')),
                DropdownMenuItem(value: '8th Grade', child: Text('8th Grade')),
                DropdownMenuItem(value: '9th Grade', child: Text('9th Grade')),
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
                print('Selected value: $value');
              },
            ),
            SizedBox(height: 16),
            CustomDropdown(
              label: 'Difficulty:',
              hint: 'Select Difficulty',
              items: [
                DropdownMenuItem(
                  value: 'Basic',
                  child: Text('Basic'),
                ),
                DropdownMenuItem(
                  value: 'Intermediate',
                  child: Text('Intermediate'),
                ),
                DropdownMenuItem(
                  value: 'Advanced',
                  child: Text('Advanced'),
                ),
              ],
              onChanged: (value) {
                print('Selected value: $value');
              },
            ),
            SizedBox(height: 16),
            CustomDropdown(
              label: 'Test Type:',
              hint: 'Select Test Type',
              items: [
                DropdownMenuItem(
                  value: 'Practice',
                  child: Text('Practice'),
                ),
                DropdownMenuItem(
                  value: 'Daily Assessment',
                  child: Text('Daily Assessment'),
                ),
                DropdownMenuItem(
                  value: 'Final Test',
                  child: Text('Final Test'),
                ),
                DropdownMenuItem(
                  value: 'Written Test',
                  child: Text('Written Test'),
                ),
              ],
              onChanged: (value) {
                print('Selected value: $value');
              },
            ),
            SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        side: BorderSide(width: 2)),
                    minimumSize: Size(150, 40),
                  ),
                  child: Text('Cancel'),
                ),
                SizedBox(width: 16),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF3E47FF),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        side: BorderSide(width: 2)),
                    minimumSize: Size(150, 40),
                  ),
                  child: Text('Create Question'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget buildQuestionContent(QuestionType questionType) {
    switch (questionType) {
      case QuestionType.trueFalse:
        return Column(
          children: [
            RadioListTile<bool>(
              title: const Text('True'),
              value: true,
              groupValue: _selectedAnswer,
              onChanged: (bool? value) => handleTrueFalseAnswer(value!),
            ),
            RadioListTile<bool>(
              title: const Text('False'),
              value: false,
              groupValue: _selectedAnswer,
              onChanged: (bool? value) => handleTrueFalseAnswer(value!),
            ),
          ],
        );

      case QuestionType.multipleChoice:
        return Column(
          children: List.generate(_choices.length, (index) {
            return Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controllers[index],
                    decoration: InputDecoration(
                      hintText: 'Option ${index + 1}',
                    ),
                    onChanged: (newText) {
                      setState(() {
                        _choices[index] = newText;
                      });
                    },
                  ),
                ),
                Checkbox(
                  value: _selectedChoices.contains(_choices[index]),
                  onChanged: (bool? value) {
                    setState(() {
                      if (value == true) {
                        _selectedChoices.add(_choices[index]);
                      } else {
                        _selectedChoices.remove(_choices[index]);
                      }
                    });
                  },
                ),
              ],
            );
          }),
        );

      case QuestionType.essay:
        return TextField(
          controller: _essayController,
          maxLines: 8,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Write your answer here...',
          ),
          onChanged: handleEssayAnswer,
        );

      default:
        return const SizedBox.shrink();
    }
  }

  void handleTrueFalseAnswer(bool value) {
    setState(() {
      _selectedAnswer = value;
    });
  }

  void handleEssayAnswer(String value) {
    setState(() {
      _selectedAnswer.answer = value;
    });
  }
}
