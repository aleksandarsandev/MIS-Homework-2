import 'package:domasna2/states/home/home_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'widgets/custom/custom_top_menu.dart';
import 'widgets/settings_section.dart';

class TeacherSettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final homeState = Provider.of<HomeState>(context);

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
                'Hi, TeacherName',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
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
          SingleChildScrollView(
            child: Column(
              children: [SettingsSection()],
            ),
          ),
          if (homeState.isMenuOpen)
            Positioned(
              child: CustomTopMenu(onClose: homeState.toggleMenu),
            ),
        ],
      ),
    );
  }
}
