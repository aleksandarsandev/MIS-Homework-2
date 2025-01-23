import 'package:flutter/material.dart';

class GradeDropdown extends StatefulWidget {
  final List<String> grades;
  final String initialGrade;
  final ValueChanged<String> onGradeChanged;

  GradeDropdown({
    required this.grades,
    required this.initialGrade,
    required this.onGradeChanged,
  });

  @override
  _GradeDropdownState createState() => _GradeDropdownState();
}

class _GradeDropdownState extends State<GradeDropdown> {
  late String selectedGrade;

  @override
  void initState() {
    super.initState();
    selectedGrade = widget.initialGrade;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        selectedGrade.isEmpty
            ? Text(
                'Choose Grade:',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                ),
              )
            : Text(
                'Grade:',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                ),
              ),
        SizedBox(height: 8),
        DropdownButtonFormField<String>(
          value: selectedGrade.isEmpty ? null : selectedGrade,
          hint: selectedGrade.isEmpty
              ? Text(
                  'Choose grade if you are a student',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                  ),
                )
              : null,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 12,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: Colors.black,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: Colors.black,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: Colors.blue,
              ),
            ),
          ),
          items: widget.grades.map((String grade) {
            return DropdownMenuItem<String>(
              value: grade,
              child: Text(
                grade,
                style: TextStyle(
                  color: Colors.grey[800],
                  fontSize: 14,
                ),
              ),
            );
          }).toList(),
          onChanged: (String? newValue) {
            setState(() {
              selectedGrade = newValue ?? '';
            });
            widget.onGradeChanged(
                selectedGrade); // Notify parent about the change
          },
        ),
      ],
    );
  }
}
