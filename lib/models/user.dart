// lib/models/user.dart
class User {
  final String id;
  final String name;
  final String email;
  final String avatarUrl;
  final String level;
  final int points;
  final int coffeeTried;
  final int streak;
  final int totalBrewed;
  final String favoriteCoffee;
  final List<String> achievements;
  final DateTime joinDate;
  
  User({
    required this.id,
    required this.name,
    required this.email,
    required this.avatarUrl,
    required this.level,
    required this.points,
    required this.coffeeTried,
    required this.streak,
    required this.totalBrewed,
    required this.favoriteCoffee,
    required this.achievements,
    required this.joinDate,
  });
}