// lib/widgets/timer_button.dart
import 'package:flutter/material.dart';

class TimerButton extends StatelessWidget {
  final String label;
  final int seconds;
  final bool isSelected;
  final VoidCallback onTap;
  
  const TimerButton({
    Key? key,
    required this.label,
    required this.seconds,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        decoration: BoxDecoration(
          color: isSelected 
              ? const Color(0xFF6F4E37)
              : Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 5,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected 
                ? Colors.white
                : const Color(0xFF6F4E37),
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}