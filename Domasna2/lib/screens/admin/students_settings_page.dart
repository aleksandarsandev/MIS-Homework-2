import 'package:flutter/material.dart';

import 'widgets/student/student_settings_section.dart';

class StudentsSettingsPage extends StatefulWidget {
  final String fullName;
  final String username;
  final String email;

  const StudentsSettingsPage(
      {Key? key,
      required this.fullName,
      required this.username,
      required this.email})
      : super(key: key);

  @override
  _StudentsSettingsPageState createState() => _StudentsSettingsPageState();
}

class _StudentsSettingsPageState extends State<StudentsSettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Test',
          style: TextStyle(
              fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: const Color(0xFF3E47FF),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Center(
              child: Text(
                'Hi, Admin',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                StudentSettingsSection(
                    fullName: widget.fullName,
                    username: widget.username,
                    email: widget.email)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
