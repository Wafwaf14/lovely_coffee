// widgets/profile_page_widget.dart
import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'bottom_navigation_widget.dart';

class ProfilePageWidget extends StatelessWidget {
  final LiquidController liquidController;

  const ProfilePageWidget({
    Key? key,
    required this.liquidController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 100, 10, 40),
      body: SafeArea(
        child: Column(
          children: [
          //  const CompactLogoWidget(),
            Expanded(
              child: _buildProfileContent(),
            ),
            BottomNavigationWidget(liquidController: liquidController),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileContent() {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.person,
            size: 100,
            color: Colors.white,
          ),
          const SizedBox(height: 30),
          const Text(
            'Profile',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'Manage your coffee preferences',
            style: TextStyle(
              fontSize: 16,
              color: Colors.white70,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}