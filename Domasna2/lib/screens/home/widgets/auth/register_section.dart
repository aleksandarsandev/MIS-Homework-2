import 'package:domasna2/screens/home/forward_screen.dart';
import 'package:flutter/material.dart';

import '../custom/custom_grade_dropdown.dart';
import '../custom/custom_text_field.dart';

class RegisterSection extends StatefulWidget {
  @override
  _RegisterSectionState createState() => _RegisterSectionState();
}

class _RegisterSectionState extends State<RegisterSection> {
  String selectedGrade = '';
  final grades = [
    '1st Grade', '2nd Grade', '3rd Grade', '4th Grade', '5th Grade',
    '6th Grade', '7th Grade', '8th Grade', '9th Grade', '1st Year Secondary',
    '2nd Year Secondary', '3rd Year Secondary', '4th Year Secondary',
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
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
                      'Register',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 24),
                    CustomTextField(
                      label: 'Username:',
                      hint: 'Enter your username',
                      isPassword: false,
                    ),
                    SizedBox(height: 16),
                    CustomTextField(
                      label: 'Password:',
                      hint: 'Enter your password',
                      isPassword: true,
                    ),
                    SizedBox(height: 16),
                    CustomTextField(
                      label: 'Confirm Password:',
                      hint: 'Confirm your password',
                      isPassword: true,
                    ),
                    SizedBox(height: 16),
                    CustomTextField(
                      label: 'Email:',
                      hint: 'Enter your email',
                      isPassword: false,
                    ),
                    SizedBox(height: 16),
                    CustomTextField(
                      label: 'Full Name:',
                      hint: 'Enter your full name',
                      isPassword: false,
                    ),
                    SizedBox(height: 16),
                    GradeDropdown(
                      grades: grades,
                      initialGrade: selectedGrade,
                      onGradeChanged: (newGrade) {
                        setState(() {
                          selectedGrade = newGrade;
                        });
                      },
                    ),
                    SizedBox(height: 24),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ForwardScreen()),
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
                        'Register',
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
