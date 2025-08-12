// lib/utils/constants.dart
import 'package:flutter/material.dart';

class AppConstants {
  // Colors
  static const Color primaryColor = Color(0xFF6F4E37);
  static const Color secondaryColor = Color(0xFF8B6F47);
  static const Color backgroundColor = Color(0xFFF5F2ED);
  static const Color darkBrown = Color(0xFF3C2415);
  static const Color lightBrown = Color(0xFFA67C52);
  static const Color cream = Color(0xFFFAF7F2);
  static const Color beige = Color(0xFFD4A574);
  
  // Coffee Categories
  static const List<String> coffeeCategories = [
    'All',
    'Espresso Based',
    'Brewed',
    'Iced',
    'Regional',
  ];
  
  // Timer Presets (in seconds)
  static const List<int> timerPresets = [30, 60, 120, 240];
  
  // Ratio Constants
  static const double defaultCoffeePerCup = 15.0; // grams
  static const double defaultWaterPerCup = 250.0; // ml
  static const double idealRatio = 16.67; // 1:16.67
  
  // Animation Durations
  static const Duration shortAnimation = Duration(milliseconds: 300);
  static const Duration mediumAnimation = Duration(milliseconds: 500);
  static const Duration longAnimation = Duration(milliseconds: 800);
  
  // Padding and Margins
  static const double defaultPadding = 20.0;
  static const double smallPadding = 10.0;
  static const double largePadding = 30.0;
  
  // Border Radius
  static const double smallRadius = 10.0;
  static const double mediumRadius = 15.0;
  static const double largeRadius = 20.0;
  static const double circularRadius = 35.0;
}
