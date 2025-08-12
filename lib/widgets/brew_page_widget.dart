// widgets/brew_page_widget.dart
import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'bottom_navigation_widget.dart';

class BrewPageWidget extends StatelessWidget {
  final LiquidController liquidController;

  const BrewPageWidget({
    Key? key,
    required this.liquidController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 10, 147, 189),
      body: SafeArea(
        child: Column(
          children: [
         //   const CompactLogoWidget(),
            Expanded(
              child: _buildBrewContent(),
            ),
            BottomNavigationWidget(liquidController: liquidController),
          ],
        ),
      ),
    );
  }

  Widget _buildBrewContent() {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.local_cafe,
            size: 100,
            color: Colors.white,
          ),
          const SizedBox(height: 30),
          const Text(
            'Brewing Guide',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'Learn different brewing methods',
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
