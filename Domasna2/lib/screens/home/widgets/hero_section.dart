import 'package:flutter/material.dart';
import '../register_screen.dart';
class HeroSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Welcome to',
          style: TextStyle(
              fontSize: 64,
              fontWeight: FontWeight.bold,
              color: Colors.blue[600]),
        ),
        Text(
          'My Test',
          style: TextStyle(
              fontSize: 64,
              fontWeight: FontWeight.bold,
              color: Colors.blue[800]),
        ),
        Text(
          'Your smart platform for creating and taking tests',
          style: TextStyle(
            fontSize: 24.0,
            color: Colors.grey[600],
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 24.0),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => RegisterScreen()),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF1E40AF),
            padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
          ),
          child: Text(
            'Get Started',
            style: TextStyle(fontSize: 18.0, color: Colors.white),
          ),
        ),
        SizedBox(height: 24.0),
        Text(
          'Explore Our Features',
          style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
            color: Colors.grey[800],
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 16.0),
      ],
    );
  }
}
