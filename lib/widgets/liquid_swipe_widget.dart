// widgets/liquid_swipe_widget.dart
import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';

class LiquidSwipeWidget extends StatelessWidget {
  final List<Widget> pages;
  final bool enableLoop;
  final IconData? slideIcon;
  final Color? slideIconColor;
  final double positionSlideIcon;
  final WaveType waveType;
  final Function(int)? onPageChangeCallback;
  final LiquidController? liquidController;

  const LiquidSwipeWidget({
    Key? key,
    required this.pages,
    this.enableLoop = false,
    this.slideIcon = Icons.arrow_back_ios,
    this.slideIconColor = Colors.white,
    this.positionSlideIcon = 0.5,
    this.waveType = WaveType.liquidReveal,
    this.onPageChangeCallback,
    this.liquidController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LiquidSwipe(
      liquidController: liquidController ?? LiquidController(),
      pages: pages,
      enableLoop: enableLoop,
      slideIconWidget: Icon(
        slideIcon!,
        color: slideIconColor,
      ),
      positionSlideIcon: positionSlideIcon,
      waveType: waveType,
      onPageChangeCallback: onPageChangeCallback,
    );
  }
}