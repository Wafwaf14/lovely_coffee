// Updated home_page.dart - MVVM Structure
import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import '../widgets/liquid_swipe_widget.dart';
import '../widgets/welcome_page_widget.dart';
import '../widgets/coffee_category_page_widget.dart';
import '../widgets/brew_page_widget.dart';
import '../widgets/profile_page_widget.dart';
import '../data/coffee_data.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  AnimationController? _handwritingController;
  bool _isInitialized = false;
  final LiquidController _liquidController = LiquidController();

  @override
  void initState() {
    super.initState();

    _handwritingController = AnimationController(
      duration: const Duration(milliseconds: 3500),
      vsync: this,
    );

    _isInitialized = true;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        _handwritingController?.forward();
      }
    });
  }

  @override
  void dispose() {
    _handwritingController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!_isInitialized) {
      return const Scaffold(
        backgroundColor: Color(0xFFF5F2ED),
        body: Center(
          child: CircularProgressIndicator(
            color: Color(0xFF6F4E37),
          ),
        ),
      );
    }

    // جميع الصفحات
    List<Widget> allPages = [
      WelcomePageWidget(
        handwritingController: _handwritingController!,
      ),
      ...CoffeeData.categories.map((category) => 
        CoffeeCategoryPageWidget(
          category: category,
          liquidController: _liquidController,
        )
      ),
      BrewPageWidget(liquidController: _liquidController),
      ProfilePageWidget(liquidController: _liquidController),
    ];

    return LiquidSwipeWidget(
      liquidController: _liquidController,
      pages: allPages,
      enableLoop: false,
      slideIcon: Icons.arrow_back_ios,
      slideIconColor: Colors.white,
      positionSlideIcon: 0.5,
      waveType: WaveType.liquidReveal,
      onPageChangeCallback: (page) {
        print('Current page: $page');
        if (page == 0) {
          _handwritingController?.forward(from: 0);
        }
      },
    );
  }
}