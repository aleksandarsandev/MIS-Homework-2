import 'package:flutter/material.dart';

class QuestionManageSection extends StatefulWidget {
  final Function(bool) onToggleView;

  const QuestionManageSection({
    Key? key,
    required this.onToggleView,
  }) : super(key: key);

  @override
  State<QuestionManageSection> createState() => _QuestionManageSectionState();
}

class _QuestionManageSectionState extends State<QuestionManageSection> {
  bool addNewQuestion = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor:
                      !addNewQuestion ? Color(0xFF3E47FF) : Colors.white,
                  backgroundColor:
                      !addNewQuestion ? Colors.white : Color(0xFF3E47FF),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(width: 2)),
                ),
                onPressed: () {
                  setState(() {
                    addNewQuestion = true;
                  });
                  widget.onToggleView(true);
                },
                child: const Text('Create New Question'),
              ),
              const SizedBox(width: 8),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor:
                      addNewQuestion ? Color(0xFF3E47FF) : Colors.white,
                  backgroundColor:
                      addNewQuestion ? Colors.white : Color(0xFF3E47FF),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(width: 2)),
                ),
                onPressed: () {
                  setState(() {
                    addNewQuestion = false;
                  });
                  widget.onToggleView(false);
                },
                child: const Text('Add Existing Question'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
