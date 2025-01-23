import 'package:flutter/material.dart';

class TeachersSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          color: const Color(0xFF1E40AF),
          padding: EdgeInsets.all(12.0),
          child: Text(
            'Empower Your Teaching',
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
            'Comprehensive tools to enhance your teaching experience',
            style: TextStyle(
                fontSize: 20,
                color: Colors.white
            ),
            textAlign: TextAlign.center,
          ),
        ),
        Text(
          'Teacher Tools & Features',
          style: TextStyle(
            fontSize: 37.0,
            color: Colors.black,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 12.0),
      ],
    );
  }
}
