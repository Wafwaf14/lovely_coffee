import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'viewmodels/navigation_viewmodel.dart';
import 'viewmodels/brew_viewmodel.dart';
import 'viewmodels/profile_viewmodel.dart';
import 'views/home_page.dart';
import 'utils/theme.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NavigationViewModel()),
        ChangeNotifierProvider(create: (_) => BrewViewModel()),
        ChangeNotifierProvider(create: (_) => ProfileViewModel()),
      ],
      child: const CoffeeApp(),
    ),
  );
}

class CoffeeApp extends StatelessWidget {
  const CoffeeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lovely Coffee',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const HomePage(), // Start with HomePage
    );
  }
}