// models/coffee_category_model.dart
import 'package:flutter/material.dart';
import 'coffee_item_model.dart';

class CoffeeCategoryModel {
  final String name;
  final String image;
  final Color color;
  final List<CoffeeItemModel> items;

  CoffeeCategoryModel({
    required this.name,
    required this.image,
    required this.color,
    required this.items,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'image': image,
      'color': color.value,
      'items': items.map((item) => item.toMap()).toList(),
    };
  }

  factory CoffeeCategoryModel.fromMap(Map<String, dynamic> map) {
    return CoffeeCategoryModel(
      name: map['name'] ?? '',
      image: map['image'] ?? '',
      color: Color(map['color'] ?? 0xFF000000),
      items: (map['items'] as List<dynamic>?)
          ?.map((item) => CoffeeItemModel.fromMap(item))
          .toList() ?? [],
    );
  }
}