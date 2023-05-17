import 'package:flutter/material.dart';
import 'package:food_ordering/pages/home_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 1000), () {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: ((context) => const HomeScreen()),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Order Your Food Now!!",
            style: GoogleFonts.poppins(fontSize: 24),
          ),
          const SizedBox(
            height: 10,
          ),
          const Image(
            image: AssetImage("assets/images/splashscreen.jpg"),
          ),
        ],
      )),
    );
  }
}
