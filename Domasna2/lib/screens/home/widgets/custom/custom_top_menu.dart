import 'package:domasna2/screens/home/login_screen.dart';
import 'package:flutter/material.dart';

import '../../register_screen.dart';
import '../../students_page_screen.dart';
import '../../teachers_page_screen.dart';

class CustomTopMenu extends StatelessWidget {
  final VoidCallback onClose;

  const CustomTopMenu({required this.onClose});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        color: const Color(0xFF3E47FF),
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
      ),
      child: Column(
        children: [
          ListTile(
            title: Text('For Teachers',
                style: TextStyle(color: Colors.white, fontSize: 18)),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TeachersPageScreen()),
              );
              onClose();
            },
          ),
          ListTile(
            title: Text('For Students',
                style: TextStyle(color: Colors.white, fontSize: 18)),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => StudentsPageScreen()),
              );
              onClose();
            },
          ),
          Expanded(
            child: Align(
              alignment: Alignment.center,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  );
                  onClose();
                },
                child: Text(
                  'Log In',
                  style: TextStyle(color: Colors.white, fontSize: 18.0),
                ),
              ),
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.center,
              child: SizedBox(
                  width: 330,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RegisterScreen()),
                      );
                      onClose();
                    },
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegisterScreen()),
                        );
                        onClose();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white, // White background
                        foregroundColor: const Color(0xFF3E47FF), // Text color
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(30.0), // Rounded corners
                        ),
                      ),
                      child: Text(
                        'Register',
                        style: TextStyle(fontSize: 18), // Text style
                      ),
                    ),
                  )),
            ),
          ),
          SizedBox(height: 24.0),
        ],
      ),
    );
  }
}
