// data/coffee_data.dart
import 'package:flutter/material.dart';
import '../models/coffee_category_model.dart';
import '../models/coffee_item_model.dart';

class CoffeeData {
  static final List<CoffeeCategoryModel> categories = [
    // Ice Coffee Category
    CoffeeCategoryModel(
      name: 'Ice Coffee',
      image: 'assets/Ice_Coffee.jpg',
      color: const Color(0xFF6F4E37),
      items: [
        CoffeeItemModel(
          name: 'Iced Americano',
          description: 'Rich espresso shots topped with cold water and ice',
          image: 'assets/iced_americano.jpg',
          price: 4.50,
          sizes: ['Small', 'Medium', 'Large'],
          milkOptions: ['None', 'Whole Milk', 'Almond Milk', 'Oat Milk', 'Coconut Milk'],
          hasDecaf: true,
        ),
        CoffeeItemModel(
          name: 'Iced Latte',
          description: 'Smooth espresso with cold milk and ice, perfectly balanced',
          image: 'assets/iced_latte.jpg',
          price: 5.25,
          sizes: ['Small', 'Medium', 'Large'],
          milkOptions: ['Whole Milk', 'Almond Milk', 'Oat Milk', 'Coconut Milk', 'Soy Milk'],
        ),
        CoffeeItemModel(
          name: 'Frappé',
          description: 'Blended iced coffee with whipped cream and flavors',
          image: 'assets/frappe.jpg',
          price: 6.00,
          sizes: ['Medium', 'Large'],
          milkOptions: ['Whole Milk', 'Almond Milk', 'Coconut Milk'],
        ),
        CoffeeItemModel(
          name: 'Cold Brew',
          description: 'Slow-steeped coffee served over ice, smooth and bold',
          image: 'assets/Ice_Coffee.jpg',
          price: 4.75,
          sizes: ['Small', 'Medium', 'Large'],
          milkOptions: ['None', 'Whole Milk', 'Almond Milk', 'Oat Milk'],
        ),
      ],
    ),

    // Espresso Category
    CoffeeCategoryModel(
      name: 'Espresso',
      image: 'assets/Espresso.jpg',
      color: const Color(0xFF8B4513),
      items: [
        CoffeeItemModel(
          name: 'Espresso Shot',
          description: 'Pure, intense coffee shot - the foundation of all coffee',
          image: 'assets/espresso_shot.jpg',
          price: 2.50,
          sizes: ['Single', 'Double'],
          milkOptions: ['None'],
          hasDecaf: true,
        ),
        CoffeeItemModel(
          name: 'Doppio',
          description: 'Double shot of espresso for the coffee purist',
          image: 'assets/Doppio.jpg',
          price: 3.25,
          sizes: ['Double'],
          milkOptions: ['None'],
          hasDecaf: true,
        ),
        CoffeeItemModel(
          name: 'Lungo',
          description: 'Long extraction espresso with more water, lighter taste',
          image: 'assets/lungo.jpg',
          price: 3.00,
          sizes: ['Single', 'Double'],
          milkOptions: ['None'],
          hasDecaf: true,
        ),
        CoffeeItemModel(
          name: 'Ristretto',
          description: 'Short extraction espresso, concentrated and intense',
          image: 'assets/ristretto.jpg',
          price: 3.50,
          sizes: ['Single', 'Double'],
          milkOptions: ['None'],
          hasDecaf: true,
        ),
      ],
    ),

    // Hot Coffee Category
    CoffeeCategoryModel(
      name: 'Hot Coffee',
      image: 'assets/Hot_Coffee.jpg',
      color: const Color(0xFF6F4E37),
      items: [
        CoffeeItemModel(
          name: 'Americano',
          description: 'Rich espresso shots with hot water, clean and bold',
          image: 'assets/americano.jpg',
          price: 3.75,
          sizes: ['Small', 'Medium', 'Large'],
          milkOptions: ['None', 'Whole Milk', 'Almond Milk', 'Oat Milk'],
          hasDecaf: true,
        ),
        CoffeeItemModel(
          name: 'Cappuccino',
          description: 'Equal parts espresso, steamed milk, and foam',
          image: 'assets/cappuccino.jpg',
          price: 4.50,
          sizes: ['Small', 'Medium', 'Large'],
          milkOptions: ['Whole Milk', 'Almond Milk', 'Oat Milk', 'Coconut Milk'],
          hasDecaf: true,
        ),
        CoffeeItemModel(
          name: 'Latte',
          description: 'Smooth espresso with steamed milk and light foam',
          image: 'assets/latte.jpg',
          price: 5.00,
          sizes: ['Small', 'Medium', 'Large'],
          milkOptions: ['Whole Milk', 'Almond Milk', 'Oat Milk', 'Soy Milk'],
          hasDecaf: true,
        ),
        CoffeeItemModel(
          name: 'Macchiato',
          description: 'Espresso "marked" with a dollop of steamed milk',
          image: 'assets/Macchiato.jpg',
          price: 4.25,
          sizes: ['Small', 'Medium'],
          milkOptions: ['Whole Milk', 'Almond Milk', 'Oat Milk'],
          hasDecaf: true,
        ),
        CoffeeItemModel(
          name: 'Mocha',
          description: 'Espresso with chocolate syrup, steamed milk, and whipped cream',
          image: 'assets/Mocha.jpg',
          price: 5.50,
          sizes: ['Small', 'Medium', 'Large'],
          milkOptions: ['Whole Milk', 'Almond Milk', 'Coconut Milk'],
        ),
      ],
    ),
  ];

  // Helper methods
  static List<CoffeeCategoryModel> getAllCoffees() => categories;
  
  static CoffeeCategoryModel? getCategoryByName(String name) {
    try {
      return categories.firstWhere((category) => category.name == name);
    } catch (e) {
      return null;
    }
  }

  static CoffeeItemModel? getCoffeeItemById(String categoryName, String itemName) {
    final category = getCategoryByName(categoryName);
    if (category != null) {
      try {
        return category.items.firstWhere((item) => item.name == itemName);
      } catch (e) {
        return null;
      }
    }
    return null;
  }
}