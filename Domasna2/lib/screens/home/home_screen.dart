import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../states/home/home_state.dart';
import 'widgets/custom/custom_top_menu.dart';
import 'widgets/features_section.dart';
import 'widgets/hero_section.dart';

class HomeScreen extends StatelessWidget {
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
              children: [
                HeroSection(),
                FeaturesSection(),
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
