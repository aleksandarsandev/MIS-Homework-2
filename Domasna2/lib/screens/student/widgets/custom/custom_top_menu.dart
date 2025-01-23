import 'package:domasna2/screens/home/home_screen.dart';
import 'package:domasna2/screens/student/student_home_page.dart';
import 'package:domasna2/screens/student/student_settings_page.dart';
import 'package:flutter/material.dart';

class CustomTopMenu extends StatelessWidget {
  final VoidCallback onClose;

  const CustomTopMenu({required this.onClose});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        color: const Color(0xFF3E47FF),
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(0)),
      ),
      child: Column(
        children: [
          ListTile(
            title: Text('Student Dashboard',
                style: TextStyle(color: Colors.white, fontSize: 18)),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => StudentHomePage()),
              );
              onClose();
            },
          ),
          ListTile(
            title: Text('Settings',
                style: TextStyle(color: Colors.white, fontSize: 18)),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => StudentSettingsPage()),
              );
              onClose();
            },
          ),
          ListTile(
            title: Text('Log out',
                style: TextStyle(color: Colors.red, fontSize: 18)),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen()),
              );
              onClose();
            },
          ),
        ],
      ),
    );
  }
}
