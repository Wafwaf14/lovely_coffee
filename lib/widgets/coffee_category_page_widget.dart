// Simplified widgets/coffee_category_page_widget.dart
import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import '../models/coffee_category_model.dart';
import '../models/coffee_item_model.dart';
import '../widgets/bottom_navigation_widget.dart';

class CoffeeCategoryPageWidget extends StatelessWidget {
  final CoffeeCategoryModel category;
  final LiquidController liquidController;

  const CoffeeCategoryPageWidget({
    Key? key,
    required this.category,
    required this.liquidController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              category.color.withOpacity(0.7),
              category.color,
              category.color.withOpacity(0.9),
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              
              
              // Category Header
              _buildCategoryHeader(),

              // Coffee Items List (Simplified)
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(top: 20),
                  decoration: const BoxDecoration(
                    color: Color(0xFFF5F2ED),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      
                  
                      
                      const SizedBox(height: 20),
                      
                      // Coffee Items List
                      Expanded(
                        child: ListView.builder(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          itemCount: category.items.length,
                          itemBuilder: (context, index) {
                            return _buildSimpleCoffeeItem(
                              context,
                              category.items[index],
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Bottom Navigation
              BottomNavigationWidget(liquidController: liquidController),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryHeader() {
    return Container(
      height: 200,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          // Category Image
          Container(
            width: 180,
            height: 180,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.white.withOpacity(0.3),
                width: 2,
              ),
            ),
            child: ClipOval(
              child: Image.asset(
                category.image,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(
                    Icons.coffee,
                    size: 40,
                    color: Colors.white,
                  );
                },
              ),
            ),
          ),
          
          const SizedBox(width: 20),
          
          // Category Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  category.name,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  '${category.items.length} varieties available',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white.withOpacity(0.8),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSimpleCoffeeItem(BuildContext context, CoffeeItemModel item) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: category.color.withOpacity(0.1),
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
        border: Border.all(
          color: category.color.withOpacity(0.2),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          // Coffee Image
          Container(
            width: 90,
            height: 90,
            decoration: BoxDecoration(
              color: category.color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
            ),
  
            child: ClipRRect(
      borderRadius: BorderRadius.circular(18),
      child: Image.asset(
        item.image,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return Icon(
            Icons.local_cafe,
            size: 80,
            color: category.color.withOpacity(0.6),
          );
        },
      ),
    ),
          ),

          const SizedBox(width: 15),
          
          // Coffee Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  item.description,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[600],
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$${item.price.toStringAsFixed(2)}',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: category.color,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () => _showCoffeeCustomization(context, item),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: category.color,
                        foregroundColor: const Color(0xFFF5F2ED),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 8,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: const Text(
                        'Customize',
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showCoffeeCustomization(BuildContext context, CoffeeItemModel item) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => _buildSimpleCustomizationSheet(context, item),
    );
  }

  Widget _buildSimpleCustomizationSheet(BuildContext context, CoffeeItemModel item) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.6,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Handle
            Center(
              child: Container(
                width: 50,
                height: 5,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            
            const SizedBox(height: 20),
            
            // Coffee Name & Price
            Text(
              item.name,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            
            const SizedBox(height: 10),
            
            Text(
              item.description,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
              ),
            ),
            
            const SizedBox(height: 20),
            
        
Center(
  child: Container(
    width: 100,
    height: 100,
    decoration: BoxDecoration(
      color: category.color.withOpacity(0.1),
      borderRadius: BorderRadius.circular(20),
      border: Border.all(
        color: category.color.withOpacity(0.3),
        width: 2,
      ),
    ),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(18),
      child: Image.asset(
        item.image,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return Icon(
            Icons.local_cafe,
            size: 80,
            color: category.color.withOpacity(0.6),
          );
        },
      ),
    ),
  ),
),

Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
    Text(
      '\$${item.price.toStringAsFixed(2)}',
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: category.color,
      ),
    ),
    
    Row(
      children: [
        IconButton(
          onPressed: () {
          },
          icon: Icon(Icons.remove_circle_outline),
          color: category.color,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
          decoration: BoxDecoration(
            border: Border.all(color: category.color),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            '1', 
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        IconButton(
          onPressed: () {
          },
          icon: Icon(Icons.add_circle_outline),
          color: category.color,
        ),
      ],
    ),
  ],
),


Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Text(
      'Sugar Level',
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    ),
    const SizedBox(height: 10),
    Slider(
      value: 2.0, 
      min: 0,
      max: 5,
      divisions: 5,
      activeColor: category.color,
      label: 'Regular',
      onChanged: (value) {
      },
    ),
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('No Sugar', style: TextStyle(fontSize: 12)),
        Text('Extra Sweet', style: TextStyle(fontSize: 12)),
      ],
    ),
  ],
),
SizedBox(height: 10),
            // Add to Cart Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('${item.name} added to cart!'),
                      backgroundColor: category.color,
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: category.color,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: const Text(
                  'Add to Cart',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}