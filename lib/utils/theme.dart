// lib/utils/theme.dart
import 'package:flutter/material.dart';
import 'constants.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: AppConstants.primaryColor,
      scaffoldBackgroundColor: AppConstants.backgroundColor,
      fontFamily: 'SF Pro Display',
      
      // AppBar Theme
      appBarTheme: const AppBarTheme(
        backgroundColor: AppConstants.backgroundColor,
        elevation: 0,
        iconTheme: IconThemeData(color: AppConstants.darkBrown),
        titleTextStyle: TextStyle(
          color: AppConstants.darkBrown,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      
      // Card Theme
      cardTheme: CardThemeData(
        color: Colors.white,
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppConstants.largeRadius),
        ),
      ),
      
      // Text Theme
      textTheme: const TextTheme(
        headlineLarge: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: AppConstants.darkBrown,
        ),
        headlineMedium: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: AppConstants.darkBrown,
        ),
        headlineSmall: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: AppConstants.darkBrown,
        ),
        bodyLarge: TextStyle(
          fontSize: 16,
          color: AppConstants.darkBrown,
        ),
        bodyMedium: TextStyle(
          fontSize: 14,
          color: AppConstants.darkBrown,
        ),
        bodySmall: TextStyle(
          fontSize: 12,
          color: Colors.grey,
        ),
      ),
      
      // Button Theme
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppConstants.primaryColor,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppConstants.mediumRadius),
          ),
        ),
      ),
      
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppConstants.primaryColor,
        ),
      ),
      
      // Input Decoration Theme
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppConstants.circularRadius),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppConstants.circularRadius),
          borderSide: const BorderSide(color: AppConstants.primaryColor),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      ),
      
      // Icon Theme
      iconTheme: const IconThemeData(
        color: AppConstants.primaryColor,
        size: 24,
      ),
      
      // Color Scheme
      colorScheme: const ColorScheme.light(
        primary: AppConstants.primaryColor,
        secondary: AppConstants.secondaryColor,
        background: AppConstants.backgroundColor,
        surface: Colors.white,
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        onBackground: AppConstants.darkBrown,
        onSurface: AppConstants.darkBrown,
      ),
    );
  }
  
  static ThemeData get darkTheme {
    return ThemeData(
      primaryColor: AppConstants.primaryColor,
      scaffoldBackgroundColor: const Color(0xFF1A1A1A),
      fontFamily: 'SF Pro Display',
      brightness: Brightness.dark,
      
      // Similar structure but with dark colors
      // You can customize this further if needed
    );
  }
}