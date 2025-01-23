import 'package:flutter/material.dart';

import 'custom/custom_dropdown.dart';

class FiltersSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.8,
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 8,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Filters',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 12),
                CustomDropdown(
                  label: 'Choose Subject:',
                  hint: 'Select a subject',
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
                SizedBox(height: 12),
                CustomDropdown(
                  label: 'Choose Difficulty:',
                  hint: 'Select difficulty level',
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
                SizedBox(height: 12),
                CustomDropdown(
                  label: 'Choose Part of Year:',
                  hint: 'Select time period',
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
                SizedBox(height: 12),
                CustomDropdown(
                  label: 'Choose Test Type:',
                  hint: 'Select test type',
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
                SizedBox(height: 12),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
