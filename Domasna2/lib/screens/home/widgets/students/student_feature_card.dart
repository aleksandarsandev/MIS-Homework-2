import 'package:flutter/material.dart';

class StudentFeatureCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final double cardWidth;

  const StudentFeatureCard({
    required this.icon,
    required this.title,
    required this.description,
    this.cardWidth = 350.0,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: cardWidth,
        child: Card(
          color: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
          elevation: 4.0,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(icon, size: 48.0, color: Colors.blue),
                    SizedBox(width: 8.0),
                    Text(
                      title,
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(height: 8.0),
                Text(description, style: TextStyle(fontSize: 16.0)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
