import 'package:flutter/material.dart';

import 'custom/custom_dropdown.dart';
import 'custom/custom_text_field.dart';

enum QuestionType { trueFalse, multipleChoice, essay }

class EditQuestionSection extends StatefulWidget {
  final String question;
  final String type;
  final int points;
  final List<Widget> initialChoices;

  EditQuestionSection({
    required this.question,
    required this.type,
    required this.points,
    required this.initialChoices,
  });

  @override
  _EditQuestionSectionState createState() => _EditQuestionSectionState();
}

class _EditQuestionSectionState extends State<EditQuestionSection> {
  dynamic _selectedAnswer;
  final TextEditingController _essayController = TextEditingController();
  late QuestionType _selectedQuestionType;
  late List<TextEditingController> _controllers;
  late List<String> _choices;
  List<String> _selectedChoices = [];

  @override
  void initState() {
    super.initState();
    _selectedQuestionType = getQuestionType(widget.type);
    _choices = extractTextFromWidgets(widget.initialChoices);
    _controllers = _choices.map((choice) {
      return TextEditingController(text: choice);
    }).toList();

    switch (_selectedQuestionType) {
      case QuestionType.trueFalse:
        _selectedAnswer =
            _choices.isNotEmpty ? _choices[0].toLowerCase() == 'true' : null;
        break;
      case QuestionType.multipleChoice:
        _selectedChoices = widget.initialChoices
            .whereType<CheckboxListTile>()
            .where((tile) => tile.value == true)
            .map((tile) => (tile.title as Text).data ?? '')
            .toList();
        break;
      case QuestionType.essay:
        var essayWidget = widget.initialChoices.firstWhere(
            (choice) => choice is TextField,
            orElse: () => TextField());
        if (essayWidget is TextField) {
          _essayController.text = (essayWidget.controller)?.text ?? '';
          _selectedAnswer = _essayController.text;
        }
        break;
    }
  }

  List<String> extractTextFromWidgets(List<Widget> answerWidgets) {
    return answerWidgets.map((widget) {
      if (widget is TextField) {
        return (widget.controller as TextEditingController).text;
      } else if (widget is CheckboxListTile) {
        return (widget.title as Text?)?.data ?? '';
      } else if (widget is CustomTextField) {
        return widget.controller?.text ?? widget.hint;
      } else if (widget is Container) {
        if (widget.child is Text) {
          return (widget.child as Text?)?.data ?? '';
        } else if (widget.child is Row) {
          final textWidget = (widget.child as Row)
                  .children
                  .firstWhere((child) => child is Text, orElse: () => Text(''))
              as Text?;
          return textWidget?.data ?? '';
        }
      }
      return '';
    }).toList();
  }

  QuestionType getQuestionType(String type) {
    switch (type) {
      case 'True / False':
        return QuestionType.trueFalse;
      case 'Multiple Choice':
        return QuestionType.multipleChoice;
      case 'Essay':
        return QuestionType.essay;
      default:
        return QuestionType.trueFalse;
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
              'Edit Question Bank Entry',
              style: TextStyle(
                  fontSize: 28,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              'Edit the question details',
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            ),
            SizedBox(height: 16),
            CustomDropdown(
              label: 'Question Type:',
              hint: widget.type,
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
              controller: TextEditingController(text: widget.question),
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
                      hint: widget.points.toString(),
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
                  child: Text('Update Question'),
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
              onChanged: (bool? value) {
                setState(() {
                  _selectedAnswer = value;
                });
              },
            ),
            RadioListTile<bool>(
              title: const Text('False'),
              value: false,
              groupValue: _selectedAnswer,
              onChanged: (bool? value) {
                setState(() {
                  _selectedAnswer = value;
                });
              },
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
                      hintText: _choices[index],
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
          onChanged: (value) {
            setState(() {
              _selectedAnswer = value;
            });
          },
        );

      default:
        return const SizedBox.shrink();
    }
  }
}
