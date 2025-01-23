import 'package:domasna2/screens/student/widgets/filters_section.dart';
import 'package:flutter/material.dart';

class AddExistingQuestionSection extends StatefulWidget {
  final String testTitle;

  const AddExistingQuestionSection({
    Key? key,
    required this.testTitle,
  }) : super(key: key);

  @override
  _AddExistingQuestionSectionState createState() =>
      _AddExistingQuestionSectionState();
}

class _AddExistingQuestionSectionState
    extends State<AddExistingQuestionSection> {
  bool showFilters = false;

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
                      'Back',
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
            'Add Existing Question',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF3E47FF),
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
                setState(() {
                  showFilters = !showFilters;
                });
              },
              child: Text(showFilters ? 'Hide Filters' : 'Show Filters',
                  style: TextStyle(color: Colors.white)),
            ),
          ),
          const SizedBox(height: 16),
          if (showFilters) FiltersSection(),
          const SizedBox(height: 16),
          const Text(
            'Available questions from other tests',
            style: TextStyle(
              fontSize: 18,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 16),
          if (widget.testTitle == "Тест по математика") ...[
            _buildQuestionCard(
              '92 + 11 = 103',
              'True / False',
              2,
              [
                _buildAnswer('True', true, true),
                _buildAnswer('False', false, false),
              ],
            ),
            const SizedBox(height: 16),
            _buildQuestionCard(
              '0 е негативен број',
              'True / False',
              3,
              [
                _buildAnswer('True', false, false),
                _buildAnswer('False', true, true),
              ],
            ),
            const SizedBox(height: 16),
          ] else ...[
            _buildQuestionCard(
              'Македонската азбука има 31 буква',
              'True / False',
              1,
              [
                _buildAnswer('True', true, true),
                _buildAnswer('False', false, false),
              ],
            ),
            const SizedBox(height: 16),
            _buildQuestionCard(
              'Кои букви се самогласки',
              'Multiple Choice',
              3,
              [
                _buildAnswer('А', true, true),
                _buildAnswer('И', true, true),
                _buildAnswer('Г', false, false),
                _buildAnswer('Ф', false, false),
              ],
            ),
            const SizedBox(height: 16),
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
                          backgroundColor: Color(0xFF3E47FF),
                          padding: const EdgeInsets.symmetric(vertical: 6),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: BorderSide(
                              color: Colors.black,
                              width: 2,
                            ),
                          ),
                        ),
                        onPressed: () {},
                        child: const Text('Add to Test',
                            style: TextStyle(color: Colors.white)),
                      ),
                    ),
                    const SizedBox(width: 12),
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
