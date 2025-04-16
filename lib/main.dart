import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'burgerswipe_screen.dart';
// Importing the main screen

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.yellow, // or any color you want
    statusBarIconBrightness: Brightness.dark, // for dark icons (use Brightness.light for light icons)
  ));

  runApp(BurgerApp());
}

class BurgerApp extends StatelessWidget {
  const BurgerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Hides the debug banner
      home: BurgerSwipeScreen(), // Loads the burger swipe screen
    );
  }
}
