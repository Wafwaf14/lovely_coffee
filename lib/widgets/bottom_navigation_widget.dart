// widgets/bottom_navigation_widget.dart
import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import '../data/coffee_data.dart';

class BottomNavigationWidget extends StatelessWidget {
  final LiquidController liquidController;

  const BottomNavigationWidget({
    Key? key,
    required this.liquidController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF6F4E37),
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildNavItem(
            icon: Icons.coffee,
            label: 'Coffee',
            onTap: () {
              // Go to first coffee page (index 1)
              liquidController.animateToPage(page: 1);
            },
          ),
          _buildNavItem(
            icon: Icons.local_cafe,
            label: 'Brew',
            onTap: () {
              // Go to brew page
              liquidController.animateToPage(page: CoffeeData.categories.length + 1);
            },
          ),
          _buildNavItem(
            icon: Icons.search,
            label: 'Search',
            onTap: () => _showSearchDialog(context),
          ),
          _buildNavItem(
            icon: Icons.person,
            label: 'Profile',
            onTap: () {
              // Go to profile page
              liquidController.animateToPage(page: CoffeeData.categories.length + 2);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: Colors.white70,
              size: 24,
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showSearchDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Search Coffee'),
          content: const TextField(
            decoration: InputDecoration(
              hintText: 'Search for coffee types...',
              prefixIcon: Icon(Icons.search),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Search'),
            ),
          ],
        );
      },
    );
  }
}