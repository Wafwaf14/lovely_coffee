// lib/widgets/logo_widget.dart
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 400,
        height: 400,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
          
          ],
        ),
        child: ClipOval(
          child: Image.asset(
            'assets/logo.png',
            fit: BoxFit.cover,
          ),
        ),
      )
          .animate()
          .fadeIn(duration: 1.2.seconds, curve: Curves.easeOut)
          .scale(
            begin: const Offset(0.8, 0.8),
            end: const Offset(1.0, 1.0),
            duration: 1.5.seconds,
            curve: Curves.easeOutBack,
          )
          .animate(onPlay: (controller) => controller.repeat(reverse: true))
          .moveY(
            begin: -8,
            end: 8,
            duration: 2.5.seconds,
            curve: Curves.easeInOut,
          )
          .animate(onPlay: (controller) => controller.repeat(reverse: true))
          .rotate(
            begin: -0.02, 
            end: 0.02,
            duration: 4.seconds,
            curve: Curves.easeInOut,
          )
          .animate(onPlay: (controller) => controller.repeat(reverse: true))
          .scale(
            begin: const Offset(1.0, 1.0),
            end: const Offset(1.03, 1.03),
            duration: 3.seconds,
            curve: Curves.easeInOut,
          ),
    );
  }
}