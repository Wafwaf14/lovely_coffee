// lib/viewmodels/navigation_viewmodel.dart
import 'package:flutter/material.dart';

class NavigationViewModel extends ChangeNotifier {
  int _selectedIndex = 0;
  
  int get selectedIndex => _selectedIndex;
  
  void setIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }
  
  void goToHome() {
    _selectedIndex = 0;
    notifyListeners();
  }
  
  void goToBrew() {
    _selectedIndex = 1;
    notifyListeners();
  }
  
  void goToProfile() {
    _selectedIndex = 2;
    notifyListeners();
  }
}