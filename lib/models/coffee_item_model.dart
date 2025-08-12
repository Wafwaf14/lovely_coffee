// models/coffee_item_model.dart
class CoffeeItemModel {
  final String name;
  final String description;
  final String image;
  final double price;
  final List<String> sizes;
  final List<String> milkOptions;
  final bool hasDecaf;

  CoffeeItemModel({
    required this.name,
    required this.description,
    required this.image,
    required this.price,
    required this.sizes,
    required this.milkOptions,
    this.hasDecaf = false,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'description': description,
      'image': image,
      'price': price,
      'sizes': sizes,
      'milkOptions': milkOptions,
      'hasDecaf': hasDecaf,
    };
  }

  factory CoffeeItemModel.fromMap(Map<String, dynamic> map) {
    return CoffeeItemModel(
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      image: map['image'] ?? '',
      price: map['price']?.toDouble() ?? 0.0,
      sizes: List<String>.from(map['sizes'] ?? []),
      milkOptions: List<String>.from(map['milkOptions'] ?? []),
      hasDecaf: map['hasDecaf'] ?? false,
    );
  }
}