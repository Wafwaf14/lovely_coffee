// widgets/coffee_sub_type_button_widget.dart
import 'package:flutter/material.dart';

class CoffeeSubTypeButtonWidget extends StatelessWidget {
  final String subType;
  final Color categoryColor;

  const CoffeeSubTypeButtonWidget({
    Key? key,
    required this.subType,
    required this.categoryColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          print('Selected: $subType');
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Selected: $subType'),
              backgroundColor: categoryColor,
              duration: const Duration(seconds: 1),
            ),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white.withOpacity(0.15),
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 25),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
            side: BorderSide(
              color: Colors.white.withOpacity(0.4),
              width: 1.5,
            ),
          ),
          elevation: 6,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                subType,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    print('Liked: $subType');
                  },
                  child: const Icon(
                    Icons.favorite_border,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
                const SizedBox(width: 10),
                const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                  size: 14,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}