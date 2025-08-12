// lib/widgets/handwriting_text_painter.dart
import 'dart:ui';

import 'package:flutter/material.dart';

class HandwritingTextPainter extends CustomPainter {
  final double progress;
  final String text;
  
  HandwritingTextPainter({
    required this.progress,
    required this.text,
  });
  
  @override
  void paint(Canvas canvas, Size size) {
  
    final paths = <Path>[];
    
    
    const double totalWidth = 260; 
    double startX = (size.width - totalWidth) / 2; 
    final double baseY = size.height / 2;
    
    
    paths.add(_createLetterL(startX, baseY));
    startX += 20;
    
    paths.add(_createLetterO(startX, baseY));
    startX += 22;
    
    paths.add(_createLetterV(startX, baseY));
    startX += 22;
    
    paths.add(_createLetterE(startX, baseY));
    startX += 22;
    
    paths.add(_createLetterL(startX, baseY));
    startX += 20;
    
    paths.add(_createLetterY(startX, baseY));
    startX += 30;
    
    startX += 15;
    
    paths.add(_createLetterC(startX, baseY));
    startX += 25;
    
    paths.add(_createLetterO(startX, baseY));
    startX += 22;
    
    paths.add(_createLetterF(startX, baseY));
    startX += 18;
    
    paths.add(_createLetterF(startX, baseY));
    startX += 18;
    
    paths.add(_createLetterE(startX, baseY));
    startX += 22;
    
    paths.add(_createLetterE(startX, baseY));
    
    final paint = Paint()
      ..color = const Color(0xFF6F4E37)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.5 
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;
    
    // Draw each letter with progressive animation
    final totalLetters = paths.length;
    final currentProgress = progress * totalLetters;
    final completedLetters = currentProgress.floor();
    final currentLetterProgress = currentProgress - completedLetters;
    
    // Draw completed letters
    for (int i = 0; i < completedLetters && i < totalLetters; i++) {
      canvas.drawPath(paths[i], paint);
    }
    
    // Draw currently animating letter
    if (completedLetters < totalLetters && currentLetterProgress > 0) {
      final currentPath = paths[completedLetters];
      final animatedPath = _createAnimatedPath(currentPath, currentLetterProgress);
      canvas.drawPath(animatedPath, paint);
    }
  }
  
  Path _createLetterL(double x, double y) {
    final path = Path();
    path.moveTo(x, y - 20); 
    path.lineTo(x, y + 10);
    path.lineTo(x + 12, y + 10); 
    return path;
  }
  
  Path _createLetterO(double x, double y) {
    final path = Path();
    path.addOval(Rect.fromCenter(
      center: Offset(x + 8, y - 3),
      width: 18, 
      height: 20,
    ));
    return path;
  }
  
  Path _createLetterV(double x, double y) {
    final path = Path();
    path.moveTo(x, y - 10);
    path.quadraticBezierTo(x + 8, y + 20, x + 12, y - 10);
    return path;
  }
  
  Path _createLetterE(double x, double y) {
    final path = Path();
    path.moveTo(x + 10, y - 2);
    path.quadraticBezierTo(x + 12, y - 3, x + 6, y - 8);
    path.quadraticBezierTo(x - 2, y - 8, x - 2, y + 2);
    path.quadraticBezierTo(x - 2, y + 8, x + 6, y + 8);
    path.quadraticBezierTo(x + 10, y + 8, x + 10, y + 2);
    return path;
  }
  
  Path _createLetterY(double x, double y) {
    final path = Path();
    path.moveTo(x, y - 10);
    path.lineTo(x + 6, y);
    path.moveTo(x + 12, y - 10);
    path.lineTo(x + 6, y);
    path.lineTo(x + 6, y + 12);
    path.quadraticBezierTo(x + 4, y + 15, x + 2, y + 12);
    return path;
  }
  
  Path _createLetterC(double x, double y) {
    final path = Path();
    path.moveTo(x + 12, y - 10);
    path.quadraticBezierTo(x - 2, y - 10, x - 2, y);
    path.quadraticBezierTo(x - 2, y + 10, x + 12, y + 10);
    return path;
  }
  
  Path _createLetterF(double x, double y) {
    final path = Path();
    path.moveTo(x, y - 20);
    path.lineTo(x, y + 12);
    // Top curve
    path.moveTo(x - 2, y - 10);
    path.quadraticBezierTo(x + 8, y - 12, x + 12, y - 8);
    // Middle line
    path.moveTo(x - 2, y - 2);
    path.lineTo(x + 8, y - 2);
    return path;
  }
  
  Path _createAnimatedPath(Path originalPath, double progress) {
    final Path animatedPath = Path();
    
    final PathMetrics pathMetrics = originalPath.computeMetrics();
    for (PathMetric pathMetric in pathMetrics) {
      final double length = pathMetric.length;
      final Path extractPath = pathMetric.extractPath(
        0.0,
        length * progress.clamp(0.0, 1.0),
      );
      animatedPath.addPath(extractPath, Offset.zero);
    }
    
    return animatedPath;
  }
  
  @override
  bool shouldRepaint(HandwritingTextPainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}