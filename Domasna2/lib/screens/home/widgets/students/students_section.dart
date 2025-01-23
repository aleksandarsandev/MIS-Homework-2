import 'package:flutter/material.dart';

class StudentsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          color: const Color(0xFF1E40AF),
          padding: EdgeInsets.all(12.0),
          child: Text(
            'Transform your learning journey',
            style: TextStyle(
                fontSize: 36,
                color: Colors.white
            ),
            textAlign: TextAlign.center,
          ),
        ),
        Container(
          color: const Color(0xFF1E40AF),
          padding: EdgeInsets.all(10.0),
          child: Text(
            'Personalized learning experience designed for your success',
            style: TextStyle(
                fontSize: 20,
                color: Colors.white
            ),
            textAlign: TextAlign.center,
          ),
        ),
        Text(
          'What you get as a Student',
          style: TextStyle(
            fontSize: 36.0,
            color: Colors.black,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 12.0),
      ],
    );
  }
}
