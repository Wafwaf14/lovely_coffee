import 'package:flutter/material.dart';
import 'logo_widget.dart';
import 'handwriting_text_widget.dart';

class WelcomePageWidget extends StatelessWidget {
  final AnimationController handwritingController;

  const WelcomePageWidget({
    Key? key,
    required this.handwritingController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xFFF5F2ED),
      body: SafeArea(
        child: Column(
          children: [
            // Logo Widget
            Container(
              height: screenHeight * 0.65,
              width: screenWidth,
              padding: const EdgeInsets.all(20),
              child: const LogoWidget(),
            ),
            Container(
              height: screenHeight * 0.10,
              width: screenWidth,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: HandwritingTextWidget(
                controller: handwritingController,
                text: 'Lovely Coffee',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
