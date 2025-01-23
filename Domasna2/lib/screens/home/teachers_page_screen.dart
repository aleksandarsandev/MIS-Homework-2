import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../states/home/home_state.dart';
import 'home_screen.dart';
import 'widgets/custom/custom_top_menu.dart';
import 'widgets/teachers/teachers_features_section.dart';
import 'widgets/teachers/teachers_section.dart';

class TeachersPageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final homeState = Provider.of<HomeState>(context);

    return Scaffold(
      appBar: AppBar(
        title: GestureDetector(
          onTap: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
            );
          },
          child: Text(
            'My Test',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        backgroundColor: const Color(0xFF3E47FF),
        actions: [
          IconButton(
            icon: Icon(homeState.isMenuOpen ? Icons.close : Icons.menu),
            onPressed: homeState.toggleMenu,
            color: Colors.white,
          ),
        ],
      ),
      backgroundColor: const Color(0xFFF5F4F4),
      body: Stack(
        children: [
          // Main Content
          SingleChildScrollView(
            child: Column(
              children: [
                TeachersSection(),
                TeachersFeaturesSection(),
              ],
            ),
          ),

          // Sliding Menu
          if (homeState.isMenuOpen)
            Positioned(
              child: CustomTopMenu(onClose: homeState.toggleMenu),
            ),
        ],
      ),
    );
  }
}
