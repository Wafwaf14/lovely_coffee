// lib/viewmodels/profile_viewmodel.dart
import 'package:flutter/material.dart';
import '../models/user.dart';

class ProfileViewModel extends ChangeNotifier {
  User? _user;
  bool _isDarkMode = false;
  String _selectedLanguage = 'English';
  bool _notificationsEnabled = true;
  
  // Mock user data
  ProfileViewModel() {
    _loadUserData();
  }
  
  void _loadUserData() {
    _user = User(
      id: '1',
      name: 'Coffee Lover',
      email: 'coffee@example.com',
      avatarUrl: '',
      level: 'Coffee Enthusiast',
      points: 1250,
      coffeeTried: 12,
      streak: 7,
      totalBrewed: 45,
      favoriteCoffee: 'Latte',
      achievements: ['First Brew', 'Week Streak', 'Coffee Expert'],
      joinDate: DateTime.now().subtract(const Duration(days: 30)),
    );
  }
  
  // Getters
  User? get user => _user;
  bool get isDarkMode => _isDarkMode;
  String get selectedLanguage => _selectedLanguage;
  bool get notificationsEnabled => _notificationsEnabled;
  
  String get userName => _user?.name ?? 'Guest';
  int get coffeeTried => _user?.coffeeTried ?? 0;
  int get streak => _user?.streak ?? 0;
  int get totalBrewed => _user?.totalBrewed ?? 0;
  String get favoriteCoffee => _user?.favoriteCoffee ?? 'None';
  String get userLevel => _user?.level ?? 'Beginner';
  int get userPoints => _user?.points ?? 0;
  List<String> get achievements => _user?.achievements ?? [];
  
  // Settings methods
  void toggleDarkMode() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }
  
  void setLanguage(String language) {
    _selectedLanguage = language;
    notifyListeners();
  }
  
  void toggleNotifications() {
    _notificationsEnabled = !_notificationsEnabled;
    notifyListeners();
  }
  
  // User methods
  void updateUserName(String name) {
    if (_user != null) {
      _user = User(
        id: _user!.id,
        name: name,
        email: _user!.email,
        avatarUrl: _user!.avatarUrl,
        level: _user!.level,
        points: _user!.points,
        coffeeTried: _user!.coffeeTried,
        streak: _user!.streak,
        totalBrewed: _user!.totalBrewed,
        favoriteCoffee: _user!.favoriteCoffee,
        achievements: _user!.achievements,
        joinDate: _user!.joinDate,
      );
      notifyListeners();
    }
  }
  
  void incrementCoffeeTried() {
    if (_user != null) {
      _user = User(
        id: _user!.id,
        name: _user!.name,
        email: _user!.email,
        avatarUrl: _user!.avatarUrl,
        level: _user!.level,
        points: _user!.points + 10,
        coffeeTried: _user!.coffeeTried + 1,
        streak: _user!.streak,
        totalBrewed: _user!.totalBrewed + 1,
        favoriteCoffee: _user!.favoriteCoffee,
        achievements: _user!.achievements,
        joinDate: _user!.joinDate,
      );
      notifyListeners();
    }
  }
}