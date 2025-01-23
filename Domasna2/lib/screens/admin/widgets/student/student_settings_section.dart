import 'package:flutter/material.dart';
import '../custom/custom_text_field.dart';
import '../custom/custom_grade_dropdown.dart';
class StudentSettingsSection extends StatefulWidget {

  final String fullName;
  final String username;
  final String email;

  const StudentSettingsSection({
    Key? key,
    required this.fullName,
    required this.username,
    required this.email,
  }) : super(key: key);

  @override
  _SettingsSectionState createState() => _SettingsSectionState();
}

class _SettingsSectionState extends State<StudentSettingsSection> {
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
  ];  late TextEditingController usernameController;
  late TextEditingController emailController;
  late TextEditingController fullNameController;

  @override
  void initState() {
    super.initState();
    usernameController = TextEditingController(text: widget.username);
    emailController = TextEditingController(text: widget.email);
    fullNameController = TextEditingController(text: widget.fullName);
  }

  @override
  void dispose() {
    usernameController.dispose();
    emailController.dispose();
    fullNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height - 100,
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      child: Center(
        child: SingleChildScrollView(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 440),
            child: Card(
              color: Colors.white,
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text(
                      'Student Details',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 24),
                    CustomTextField(
                      label: 'Username:',
                      hint: 'username',
                      isPassword: false,
                      controller: usernameController,
                    ),
                    const SizedBox(height: 16),
                    CustomTextField(
                      label: 'Email:',
                      hint: 'student@email.com',
                      isPassword: false,
                      controller: emailController,
                    ),
                    const SizedBox(height: 16),
                    CustomTextField(
                      label: 'Full Name:',
                      hint: 'Full Name',
                      isPassword: false,
                      controller: fullNameController,
                    ),
                    const SizedBox(height: 16),
                    GradeDropdown(
                      grades: grades,
                      initialGrade: grades[2],
                      onGradeChanged: (newGrade) {
                        setState(() {
                          selectedGrade = newGrade;
                        });
                      },
                    ),
                    const SizedBox(height: 16),
                    CustomTextField(
                      label: 'Location:',
                      hint: 'Skopje',
                      isPassword: false,
                      // controller: fullNameController,
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF22C55E),
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        'Update',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF3B82F6),
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        'Make Teacher',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFF00000),
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        'Delete',
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
