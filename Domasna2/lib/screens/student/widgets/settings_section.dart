import 'package:domasna2/screens/student/change_password_page.dart';
import 'package:domasna2/screens/student/student_home_page.dart';
import 'package:flutter/material.dart';

import '../../home/widgets/custom/custom_grade_dropdown.dart';
import 'custom/custom_text_field.dart';

class SettingsSection extends StatefulWidget {
  @override
  _RegisterSectionState createState() => _RegisterSectionState();
}

class _RegisterSectionState extends State<SettingsSection> {
  String selectedGrade = '';
  final grades = [
    '1st Grade',
    '2nd Grade',
    '3rd Grade',
    '4th Grade',
    '5th Grade',
    '6th Grade',
    '7th Grade',
    '8th Grade',
    '9th Grade',
    '1st Year Secondary',
    '2nd Year Secondary',
    '3rd Year Secondary',
    '4th Year Secondary',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height - 100,
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      child: Center(
        child: SingleChildScrollView(
          child: Container(
            constraints: BoxConstraints(maxWidth: 440),
            child: Card(
              color: Colors.white,
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Student Settings',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 24),
                    CustomTextField(
                      label: 'Username:',
                      hint: 'username',
                      isPassword: false,
                    ),
                    SizedBox(height: 16),
                    CustomTextField(
                      label: 'Email:',
                      hint: 'student@email.com',
                      isPassword: false,
                    ),
                    SizedBox(height: 16),
                    CustomTextField(
                      label: 'Full Name:',
                      hint: 'StudentName',
                      isPassword: false,
                    ),
                    SizedBox(height: 16),
                    GradeDropdown(
                      grades: grades,
                      initialGrade: grades[2],
                      onGradeChanged: (newGrade) {
                        setState(() {
                          selectedGrade = grades[2];
                        });
                      },
                    ),
                    SizedBox(height: 16),
                    CustomTextField(
                      label: 'Location:',
                      hint: 'Skopje',
                      isPassword: false,
                    ),
                    SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => StudentHomePage()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF3B82F6),
                        padding: EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text(
                        'Update',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ChangePasswordPage()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF22C55E),
                        padding: EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text(
                        'Change Password',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
