// models/cart_item_model.dart
class CartItemModel {
  final String coffeeId;
  final String coffeeName;
  final String size;
  final int sugarLevel; // 0-5
  final String milkType;
  final bool isDecaf;
  final double price;
  int quantity;
  final String image;

  CartItemModel({
    required this.coffeeId,
    required this.coffeeName,
    required this.size,
    required this.sugarLevel,
    required this.milkType,
    required this.isDecaf,
    required this.price,
    this.quantity = 1,
    required this.image,
  });

  double get totalPrice => price * quantity;

  Map<String, dynamic> toMap() {
    return {
      'coffeeId': coffeeId,
      'coffeeName': coffeeName,
      'size': size,
      'sugarLevel': sugarLevel,
      'milkType': milkType,
      'isDecaf': isDecaf,
      'price': price,
      'quantity': quantity,
      'image': image,
    };
  }

  factory CartItemModel.fromMap(Map<String, dynamic> map) {
    return CartItemModel(
      coffeeId: map['coffeeId'] ?? '',
      coffeeName: map['coffeeName'] ?? '',
      size: map['size'] ?? '',
      sugarLevel: map['sugarLevel'] ?? 0,
      milkType: map['milkType'] ?? '',
      isDecaf: map['isDecaf'] ?? false,
      price: map['price']?.toDouble() ?? 0.0,
      quantity: map['quantity'] ?? 1,
      image: map['image'] ?? '',
    );
  }
}