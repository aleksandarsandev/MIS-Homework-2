import 'package:domasna2/screens/admin/teacher/add_question_test_page.dart';
import 'package:domasna2/screens/admin/teacher/edit_question_page.dart';
import 'package:flutter/material.dart';

class TestQuestionsSection extends StatefulWidget {
  final String testTitle;

  const TestQuestionsSection({
    Key? key,
    required this.testTitle,
  }) : super(key: key);

  @override
  _TestQuestionsSectionState createState() => _TestQuestionsSectionState();
}

class _TestQuestionsSectionState extends State<TestQuestionsSection> {
  void _showDeleteModal() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0.0),
          ),
          title: const Text(
            'Delete Question?',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          content: Text(
            'Are you sure you want to delete this question from the test? This action cannot be undone.',
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
                    Navigator.of(context).pop();
                  },
                  label: const Text('Delete',
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
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
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
                      'Back to Dashboard',
                      style:
                          TextStyle(color: Color(0xFF3E47FF), fontSize: 18.0),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Text(
            'Test Questions',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Color(0xFF3E47FF),
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF22C55E),
                padding: const EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: BorderSide(
                    color: Colors.black,
                    width: 2,
                  ),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => AddQuestionTestPage(
                            title: widget.testTitle,
                          )),
                );
              },
              child: const Text('Add New Question',
                  style: TextStyle(color: Colors.white)),
            ),
          ),
          const SizedBox(height: 16),
          if (widget.testTitle == "Тест по математика") ...[
            _buildQuestionCard(
              '12 * 34 = 359',
              'True / False',
              3,
              [
                _buildAnswer('True', false, false),
                _buildAnswer('False', true, true),
              ],
            ),
            const SizedBox(height: 16),
            _buildQuestionCard(
              '0 е позитивен број',
              'True / False',
              3,
              [
                _buildAnswer('True', false, false),
                _buildAnswer('False', true, true),
              ],
            ),
            const SizedBox(height: 16),
            _buildQuestionCard(
              'Кои се позитивни броеви?',
              'Multiple Choice',
              3,
              [
                _buildAnswer('0', false, false),
                _buildAnswer('5', true, true),
                _buildAnswer('1', true, true),
              ],
            ),
            const SizedBox(height: 16),
          ] else ...[
            _buildQuestionCard(
              'Буквата „А" е самогласка',
              'True / False',
              1,
              [
                _buildAnswer('True', true, true),
                _buildAnswer('False', false, false),
              ],
            ),
            const SizedBox(height: 16),
            _buildQuestionCard(
              'Кои букви не се самогласки',
              'Multiple Choice',
              3,
              [
                _buildAnswer('К', true, true),
                _buildAnswer('И', false, false),
                _buildAnswer('Ј', true, true),
                _buildAnswer('У', false, false),
              ],
            ),
            const SizedBox(height: 16),
            _buildQuestionCard(
              'Што е придавка?',
              'Essay',
              1,
              [
                _buildAnswer(
                    'Зборови кои ги дообјаснуваат \nименките', true, true),
              ],
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildQuestionCard(
      String question, String type, int points, List<Widget> answers) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.black, width: 2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
            ),
            child: Text(
              question,
              style: TextStyle(fontSize: 16.0),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              width: 350.0,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              color: Color(0xFF3B82F6),
              child: Text(
                type,
                style: TextStyle(fontSize: 16.0),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Points: $points',
                    style: const TextStyle(color: Colors.grey, fontSize: 16.0)),
                const SizedBox(height: 8),
                const Text(
                  'Answers:',
                  style: TextStyle(fontSize: 16.0),
                ),
                const SizedBox(height: 8),
                ...answers,
                const SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFFCA8A04),
                          padding: const EdgeInsets.symmetric(vertical: 6),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: BorderSide(
                              color: Colors.black,
                              width: 2,
                            ),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => EditQuestionPage(
                                    question: question,
                                    type: type,
                                    points: points,
                                    answers: answers)),
                          );
                        },
                        child: const Text('Edit',
                            style: TextStyle(color: Colors.white)),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 6),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: BorderSide(
                              color: Colors.black,
                              width: 2,
                            ),
                          ),
                          backgroundColor: Color(0xFFF00000),
                        ),
                        onPressed: () {
                          _showDeleteModal();
                        },
                        child: const Text('Delete',
                            style: TextStyle(color: Colors.white)),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAnswer(String text, bool isCorrect, bool isSelected) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected && isCorrect ? Color(0xFF22C55E) : Colors.white,
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        children: [
          Icon(
            isCorrect ? Icons.check : Icons.close,
            size: 16,
            color: isCorrect ? Colors.black : Colors.red,
          ),
          const SizedBox(width: 8),
          Text(
            text,
            style: TextStyle(fontSize: 16.0),
          ),
        ],
      ),
    );
  }
}
