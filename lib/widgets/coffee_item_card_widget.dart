
import 'package:flutter/material.dart';
import 'package:lovely_coffe/models/coffee_item_model.dart';

class CoffeeCustomizationSheet extends StatefulWidget {
  final CoffeeItemModel item;
  final Color categoryColor;

  const CoffeeCustomizationSheet({
    Key? key,
    required this.item,
    required this.categoryColor,
  }) : super(key: key);

  @override
  State<CoffeeCustomizationSheet> createState() => _CoffeeCustomizationSheetState();
}

class _CoffeeCustomizationSheetState extends State<CoffeeCustomizationSheet> {
  String selectedSize = '';
  int sugarLevel = 2; // Default sugar level
  String selectedMilk = '';
  bool isDecaf = false;
  int quantity = 1;

  @override
  void initState() {
    super.initState();
    selectedSize = widget.item.sizes.first;
    selectedMilk = widget.item.milkOptions.first;
  }

  double get calculatedPrice {
    double basePrice = widget.item.price;
    // Add price variations based on size
    if (selectedSize == 'Large') basePrice += 0.75;
    else if (selectedSize == 'Medium') basePrice += 0.50;
    
    // Premium milk upcharge
    if (selectedMilk.contains('Oat') || selectedMilk.contains('Almond')) {
      basePrice += 0.60;
    }
    
    return basePrice * quantity;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.85,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Column(
        children: [
          // Handle
          Container(
            margin: const EdgeInsets.only(top: 15),
            width: 50,
            height: 5,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          
          // Content
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Coffee Image & Info
                  _buildCoffeeHeader(),
                  
                  const SizedBox(height: 30),
                  
                  // Size Selection
                  _buildSizeSelection(),
                  
                  const SizedBox(height: 25),
                  
                  // Sugar Level
                  _buildSugarSelection(),
                  
                  const SizedBox(height: 25),
                  
                  // Milk Options
                  _buildMilkSelection(),
                  
                  const SizedBox(height: 25),
                  
                  // Decaf Option
                  if (widget.item.hasDecaf) _buildDecafOption(),
                  
                  const SizedBox(height: 25),
                  
                  // Quantity
                  _buildQuantitySelection(),
                  
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
          
          // Add to Cart Button
          _buildAddToCartButton(),
        ],
      ),
    );
  }

  Widget _buildCoffeeHeader() {
    return Row(
      children: [
        // Coffee Image
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            color: widget.categoryColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Image.asset(
            widget.item.image,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Icon(
                Icons.coffee,
                size: 50,
                color: widget.categoryColor,
              );
            },
          ),
        ),
        
        const SizedBox(width: 20),
        
        // Coffee Info
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.item.name,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                widget.item.description,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[600],
                ),
              ),
              const SizedBox(height: 10),
              Text(
                '\$${calculatedPrice.toStringAsFixed(2)}',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: widget.categoryColor,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSizeSelection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Size',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        Row(
          children: widget.item.sizes.map((size) {
            bool isSelected = selectedSize == size;
            return GestureDetector(
              onTap: () => setState(() => selectedSize = size),
              child: Container(
                margin: const EdgeInsets.only(right: 10),
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                  color: isSelected ? widget.categoryColor : Colors.grey[200],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  size,
                  style: TextStyle(
                    color: isSelected ? Colors.white : Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildSugarSelection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Sugar Level',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('No Sugar'),
            const Text('Extra Sweet'),
          ],
        ),
        Slider(
          value: sugarLevel.toDouble(),
          min: 0,
          max: 5,
          divisions: 5,
          activeColor: widget.categoryColor,
          label: _getSugarLabel(sugarLevel),
          onChanged: (value) => setState(() => sugarLevel = value.round()),
        ),
        Center(
          child: Text(
            _getSugarLabel(sugarLevel),
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: widget.categoryColor,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMilkSelection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Milk Options',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: widget.item.milkOptions.map((milk) {
            bool isSelected = selectedMilk == milk;
            bool isPremium = milk.contains('Oat') || milk.contains('Almond');
            
            return GestureDetector(
              onTap: () => setState(() => selectedMilk = milk),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                decoration: BoxDecoration(
                  color: isSelected ? widget.categoryColor : Colors.grey[200],
                  borderRadius: BorderRadius.circular(15),
                  border: isPremium ? Border.all(color: Colors.amber, width: 1) : null,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      milk,
                      style: TextStyle(
                        color: isSelected ? Colors.white : Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    if (isPremium) ...[
                      const SizedBox(width: 5),
                      Text(
                        '+\$0.60',
                        style: TextStyle(
                          color: isSelected ? Colors.white : Colors.amber[700],
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildDecafOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Decaffeinated',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Switch(
          value: isDecaf,
          activeColor: widget.categoryColor,
          onChanged: (value) => setState(() => isDecaf = value),
        ),
      ],
    );
  }

  Widget _buildQuantitySelection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Quantity',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Row(
          children: [
            IconButton(
              onPressed: quantity > 1 ? () => setState(() => quantity--) : null,
              icon: const Icon(Icons.remove_circle_outline),
              color: widget.categoryColor,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                border: Border.all(color: widget.categoryColor),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                quantity.toString(),
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            IconButton(
              onPressed: () => setState(() => quantity++),
              icon: const Icon(Icons.add_circle_outline),
              color: widget.categoryColor,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildAddToCartButton() {
    return Container(
      padding: const EdgeInsets.all(20),
      child: ElevatedButton(
        onPressed: _addToCart,
        style: ElevatedButton.styleFrom(
          backgroundColor: widget.categoryColor,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.shopping_cart, color: Colors.white),
            const SizedBox(width: 10),
            Text(
              'Add to Cart - \$${calculatedPrice.toStringAsFixed(2)}',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _getSugarLabel(int level) {
    switch (level) {
      case 0: return 'No Sugar';
      case 1: return 'Light';
      case 2: return 'Regular';
      case 3: return 'Sweet';
      case 4: return 'Extra Sweet';
      case 5: return 'Very Sweet';
      default: return 'Regular';
    }
  }

  void _addToCart() {
    // TODO: Implement cart functionality
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          '${widget.item.name} added to cart! (${quantity}x ${selectedSize})',
        ),
        backgroundColor: widget.categoryColor,
        behavior: SnackBarBehavior.floating,
      ),
    );
    Navigator.pop(context);
  }
}