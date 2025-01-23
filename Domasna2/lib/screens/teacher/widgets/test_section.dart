import 'dart:async';

import 'package:domasna2/screens/student/student_home_page.dart';
import 'package:domasna2/screens/student/student_test_results_page.dart';
import 'package:flutter/material.dart';

enum QuestionType { trueFalse, multipleChoice, essay }

class Question {
  final String text;
  final int points;
  final QuestionType type;
  dynamic answer;
  final List<String>? choices;

  Question({
    required this.text,
    required this.points,
    required this.type,
    this.answer,
    this.choices,
  });
}

class TestSection extends StatefulWidget {
  final int timeLimit;

  const TestSection({
    super.key,
    this.timeLimit = 2,
  });

  @override
  State<TestSection> createState() => _TestSectionState();
}

class _TestSectionState extends State<TestSection> {
  int currentQuestionIndex = 0;
  Timer? _timer;
  int _timeRemaining = 0;
  final TextEditingController _essayController = TextEditingController();

  final List<Question> questions = [
    Question(
      text: 'Буквата „А" е самогласка',
      points: 1,
      type: QuestionType.trueFalse,
      answer: null,
    ),
    Question(
      text: 'Кои букви не се самогласки',
      points: 3,
      type: QuestionType.multipleChoice,
      choices: ['И', 'K', 'Ј', 'У'],
      answer: <String>[],
    ),
    Question(
      text: 'Што е придавка?',
      points: 1,
      type: QuestionType.essay,
      answer: '',
    ),
  ];

  void _showSubmitModal() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0.0),
          ),
          title: const Text(
            'Submit Test',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          content: const Text(
            'Are you sure you want to submit your test? This action cannot be undone.',
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
          actions: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextButton.icon(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(Icons.close, color: Colors.black),
                  label: const Text(
                    'Cancel',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                const SizedBox(height: 8),
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => StudentTestResultsPage()),
                    );
                    _timer?.cancel();
                  },
                  icon: const Icon(Icons.check, color: Colors.white),
                  label: const Text('Submit Test',
                      style: TextStyle(color: Colors.white)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF3E47FF),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  void _showExitModal() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0.0),
          ),
          title: const Text(
            'Exit Test?',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          content: const Text(
            'Are you sure you want to exit? This will abandon your test and you will need to start over. Your answers will not be saved.',
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton.icon(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  label: const Text(
                    'Cancel',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                const SizedBox(width: 16),
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => StudentHomePage()),
                    );
                    _timer?.cancel();
                  },
                  label: const Text('Exit Test',
                      style: TextStyle(color: Colors.white)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    side: const BorderSide(color: Colors.black, width: 2),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    startTimer();
    if (questions[2].type == QuestionType.essay) {
      _essayController.text = questions[2].answer ?? '';
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    _essayController.dispose();
    super.dispose();
  }

  void startTimer() {
    _timeRemaining = widget.timeLimit * 60;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_timeRemaining > 0) {
          _timeRemaining--;
        } else {
          timer.cancel();
          handleTimeUp();
        }
      });
    });
  }

  String formatTime(int seconds) {
    int minutes = seconds ~/ 60;
    int remainingSeconds = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
  }

  void handleTimeUp() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Time Up!'),
          content: const Text(
              'Your time has expired. The test will be submitted automatically.'),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Widget buildQuestionContent(Question question) {
    switch (question.type) {
      case QuestionType.trueFalse:
        return Column(
          children: [
            RadioListTile<bool>(
              title: const Text('True'),
              value: true,
              groupValue: question.answer as bool?,
              onChanged: (bool? value) => handleTrueFalseAnswer(value!),
            ),
            RadioListTile<bool>(
              title: const Text('False'),
              value: false,
              groupValue: question.answer as bool?,
              onChanged: (bool? value) => handleTrueFalseAnswer(value!),
            ),
          ],
        );

      case QuestionType.multipleChoice:
        return Column(
          children: question.choices!.map((choice) {
            return CheckboxListTile(
              title: Text(choice),
              value: (question.answer as List<String>).contains(choice),
              onChanged: (bool? value) =>
                  handleMultipleChoiceAnswer(choice, value!),
            );
          }).toList(),
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
      questions[currentQuestionIndex].answer = value;
    });
  }

  void handleMultipleChoiceAnswer(String choice, bool selected) {
    setState(() {
      List<String> currentAnswers =
          List<String>.from(questions[currentQuestionIndex].answer ?? []);

      if (selected) {
        currentAnswers.add(choice);
      } else {
        currentAnswers.remove(choice);
      }

      questions[currentQuestionIndex].answer = currentAnswers;
    });
  }

  void handleEssayAnswer(String value) {
    setState(() {
      questions[currentQuestionIndex].answer = value;
    });
  }

  void goToQuestion(int index) {
    if (index >= 0 && index < questions.length) {
      setState(() {
        currentQuestionIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerRight,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color:
                    _timeRemaining < 30 ? Colors.red[100] : Colors.yellow[100],
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: Colors.black,
                  width: 2.0,
                ),
              ),
              child: Text(
                'Time Remaining: ${formatTime(_timeRemaining)}',
                style: TextStyle(
                  fontSize: 14,
                  color: _timeRemaining < 30 ? Colors.red : Colors.black,
                  fontWeight:
                      _timeRemaining < 30 ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ),
          ),
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Тест по\nмакедонски јазик',
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 8),
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Time limit: 2 minutes',
              style: TextStyle(fontSize: 14),
            ),
          ),
          const SizedBox(height: 20),
          Card(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              side: BorderSide(
                color: Colors.black,
                width: 2.0,
              ),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'Question ${currentQuestionIndex + 1} of ${questions.length}',
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      const Spacer(),
                      Text(
                        'Points: ${questions[currentQuestionIndex].points}',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    questions[currentQuestionIndex].text,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  buildQuestionContent(questions[currentQuestionIndex]),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: currentQuestionIndex > 0
                            ? () => goToQuestion(currentQuestionIndex - 1)
                            : null,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFFCDCDCD),
                          side: BorderSide(
                            color: Colors.black,
                            width: 2.0,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        child: const Text(
                          'Previous',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: currentQuestionIndex < questions.length - 1
                            ? () => goToQuestion(currentQuestionIndex + 1)
                            : null,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF3E47FF),
                          side: BorderSide(
                            color: Colors.black,
                            width: 2.0,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        child: const Text(
                          'Next',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                onPressed: () {
                  _showSubmitModal();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF3E47FF),
                  side: BorderSide(
                    color: Colors.black,
                    width: 2.0,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                child: const Text(
                  'Submit Test',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  _showExitModal();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFA6A5A5),
                  side: BorderSide(
                    color: Colors.black,
                    width: 2.0,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                child: const Text(
                  'Exit Test',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: List.generate(
              questions.length,
              (index) => Container(
                width: 32,
                height: 32,
                margin: EdgeInsets.only(
                    right: index < questions.length - 1 ? 8 : 0),
                child: ElevatedButton(
                  onPressed: () => goToQuestion(index),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: currentQuestionIndex == index
                        ? Color(0xFF3E47FF)
                        : Colors.white,
                    padding: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    side: BorderSide(
                      color: Colors.black,
                      width: 2.0,
                    ),
                  ),
                  child: Text(
                    '${index + 1}',
                    style: TextStyle(
                      color: currentQuestionIndex == index
                          ? Colors.white
                          : Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
