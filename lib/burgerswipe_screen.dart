import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:liquid_swipe/liquid_swipe.dart';

class BurgerSwipeScreen extends StatefulWidget {
  const BurgerSwipeScreen({super.key});

  @override
  State<BurgerSwipeScreen> createState() => _BurgerSwipeScreenState();
}

class _BurgerSwipeScreenState extends State<BurgerSwipeScreen> {
  final List<String> burgerImages = const [
    'assets/burger.png',
    'assets/burger2.png',
    'assets/burger3.png',
    'assets/burger4.png',
  ];

  final List<Color> pageColors = const [
    Color(0xFFFFC107),
    Color(0xFFF57C00),
    Color(0xFFFF7043),
    Color(0xFFEF5350),
  ];

  final List<String> titles = const [
    "Classic Cheeseburger",
    "Double Patty Delight",
    "Veggie Supreme",
    "Spicy Chicken Burger",
  ];

  final List<String> subtitles = const [
    "A timeless favorite with cheese and beef.",
    "Twice the meat, twice the fun!",
    "Loaded with fresh veggies and flavors.",
    "A fiery twist to your chicken burger.",
  ];

  late LiquidController liquidController;

  @override
  void initState() {
    super.initState();
    liquidController = LiquidController();
    // Set initial status bar color
    _setStatusBarColor(pageColors[0]);
  }

  void _setStatusBarColor(Color color) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: color,
      statusBarIconBrightness:
      color.computeLuminance() > 0.5 ? Brightness.dark : Brightness.light,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LiquidSwipe(
          liquidController: liquidController,
          pages: List.generate(
            burgerImages.length,
                (index) => _buildPage(index),
          ),
          waveType: WaveType.circularReveal,
          enableLoop: true,
          fullTransitionValue: 800,
          onPageChangeCallback: (int pageIndex) {
            _setStatusBarColor(pageColors[pageIndex]);
          },
        ),
      ),
    );
  }

  Widget _buildPage(int index) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [pageColors[index], Colors.white],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeOut,
              width: 280,
              height: 280,
              child: Image.asset(
                burgerImages[index],
                fit: BoxFit.contain,
              ),
            ),
            Text(
              titles[index],
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            Text(
              subtitles[index],
              style: const TextStyle(
                fontSize: 18,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 15),
            const Text(
              "Swipe for more burgers 🍔",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                print("Order button pressed for ${titles[index]}");
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                padding:
                const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: const Text(
                "Order Now 🍔",
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
