// lib/widgets/handwriting_text_widget.dart
import 'package:flutter/material.dart';
import 'handwriting_text_painter.dart';

class HandwritingTextWidget extends StatelessWidget {
  final AnimationController controller;
  final String text;

  const HandwritingTextWidget({
    Key? key,
    required this.controller,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    
    return Center(
      child: AnimatedBuilder(
        animation: controller,
        builder: (context, child) {
          return CustomPaint(
            size: Size(screenWidth - 40, 80), 
            painter: HandwritingTextPainter(
              progress: controller.value,
              text: text,
            ),
          );
        },
      ),
    );
  }
}