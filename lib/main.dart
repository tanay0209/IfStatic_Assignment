import 'package:flutter/material.dart';
import 'package:food_ordering/pages/splash_screen.dart';
import 'package:food_ordering/services/fetching_restaurants.dart';
import 'package:food_ordering/services/user_location.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const OrderFoodOnline());
}

class OrderFoodOnline extends StatelessWidget {
  const OrderFoodOnline({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => RestaurantsProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => UserLocation(),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}
