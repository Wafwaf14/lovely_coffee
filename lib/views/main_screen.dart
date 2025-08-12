import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/navigation_viewmodel.dart';
import 'tabs/brew_tab.dart';
import 'tabs/profile_tab.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final List<Map<String, dynamic>> mainCoffeeCategories = [
    {
      'name': 'Ice Coffee',
      'image': 'assets/Ice_Coffee.jpg',
      'color': const Color(0xFF4FC3F7),
      'subTypes': [
        'Iced Americano',
        'Iced Latte',
        'Frappé',
        'Cold Brew',
      ],
    },
    {
      'name': 'Espresso',
      'image': 'assets/Espresso.jpg',
      'color': const Color.fromARGB(255, 12, 207, 22),
      'subTypes': [
        'Espresso Shot',
        'Doppio',
        'Lungo',
        'Ristretto',
      ],
    },
    {
      'name': 'Hot Coffee',
      'image': 'assets/Hot_Coffee.jpg',
      'color': const Color(0xFFD32F2F),
      'subTypes': [
        'Americano',
        'Cappuccino',
        'Latte',
        'Macchiato',
        'Mocha',
      ],
    },
  ];

  int currentCoffeeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Consumer<NavigationViewModel>(
      builder: (context, navViewModel, child) {
        return Scaffold(
          backgroundColor: const Color(0xFFF5F2ED),
          body: SafeArea(
            child: Column(
              children: [
                _buildCompactLogoSection(),
                
                Expanded(
                  child: IndexedStack(
                    index: navViewModel.selectedIndex,
                    children: [
                      _buildCoffeeSection(),
                      const BrewTab(),
                      const ProfileTab(),
                    ],
                  ),
                ),
                
                _buildUpdatedNavBar(navViewModel),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildCompactLogoSection() {
    return Container(
      height: 80,
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Center(
        child: Container(
          width: 50,
          height: 50,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
          ),
          child: ClipOval(
            child: Image.asset(
              'assets/logo.png',
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  decoration: const BoxDecoration(
                    color: Color(0xFF6F4E37),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.coffee,
                    color: Colors.white,
                    size: 25,
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCoffeeSection() {
    final currentCategory = mainCoffeeCategories[currentCoffeeIndex];
    
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            currentCategory['color'].withOpacity(0.7),
            currentCategory['color'],
            currentCategory['color'].withOpacity(0.9),
          ],
        ),
      ),
      child: Column(
        children: [
          const SizedBox(height: 40),
          
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {
                  setState(() {
                    currentCoffeeIndex = currentCoffeeIndex > 0 
                        ? currentCoffeeIndex - 1 
                        : mainCoffeeCategories.length - 1;
                  });
                },
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                  size: 30,
                ),
              ),
              
              IconButton(
                onPressed: () {
                  setState(() {
                    currentCoffeeIndex = (currentCoffeeIndex + 1) % mainCoffeeCategories.length;
                  });
                },
                icon: const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ],
          ),

          Container(
            width: 180,
            height: 180,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.1),
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.white.withOpacity(0.3),
                width: 3,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 15,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: ClipOval(
              child: Image.asset(
                currentCategory['image'],
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.coffee,
                      size: 100,
                      color: Colors.white,
                    ),
                  );
                },
              ),
            ),
          ),

          const SizedBox(height: 30),

          Text(
            currentCategory['name'],
            style: const TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              letterSpacing: 2,
              shadows: [
                Shadow(
                  offset: Offset(2, 2),
                  blurRadius: 4,
                  color: Colors.black26,
                ),
              ],
            ),
          ),

          const SizedBox(height: 30),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              mainCoffeeCategories.length,
              (index) => Container(
                margin: const EdgeInsets.symmetric(horizontal: 4),
                width: 12,
                height: 12,
                decoration: BoxDecoration(
                  color: index == currentCoffeeIndex 
                      ? Colors.white 
                      : Colors.white.withOpacity(0.4),
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),

          const SizedBox(height: 30),

          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: currentCategory['subTypes']
                    .map<Widget>((subType) => _buildSubTypeButton(subType, currentCategory['color']))
                    .toList(),
              ),
            ),
          ),

          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildSubTypeButton(String subType, Color categoryColor) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          print('Selected: $subType');
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Selected: $subType'),
              backgroundColor: categoryColor,
              duration: const Duration(seconds: 1),
            ),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white.withOpacity(0.15),
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 25),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
            side: BorderSide(
              color: Colors.white.withOpacity(0.4),
              width: 1.5,
            ),
          ),
          elevation: 6,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                subType,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    print('Liked: $subType');
                  },
                  child: const Icon(
                    Icons.favorite_border,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
                const SizedBox(width: 10),
                const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                  size: 14,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildUpdatedNavBar(NavigationViewModel navViewModel) {
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
            isSelected: navViewModel.selectedIndex == 0,
            onTap: () => navViewModel.setIndex(0),
          ),
          _buildNavItem(
            icon: Icons.local_cafe,
            label: 'Brew',
            isSelected: navViewModel.selectedIndex == 1,
            onTap: () => navViewModel.setIndex(1),
          ),
          _buildNavItem(
            icon: Icons.search,
            label: 'Search',
            isSelected: false,
            onTap: () => _showSearchDialog(),
          ),
          _buildNavItem(
            icon: Icons.person,
            label: 'Profile',
            isSelected: navViewModel.selectedIndex == 2,
            onTap: () => navViewModel.setIndex(2),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem({
    required IconData icon,
    required String label,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        decoration: BoxDecoration(
          color: isSelected ? Colors.white.withOpacity(0.2) : Colors.transparent,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: isSelected ? Colors.white : Colors.white70,
              size: 24,
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.white70,
                fontSize: 12,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showSearchDialog() {
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