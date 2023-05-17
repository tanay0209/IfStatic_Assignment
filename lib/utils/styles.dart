import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Styles {
  static Color black = Colors.black;
  static Color upperContainerTopGradient = const Color(0xFFFFE1E2);
  static Color upperContainerLowerGradient = const Color(0xFFFFDFDF);
  static Color discountBackgroundColor = const Color(0xFFFF0000);
  static Color selectedChipBackground = const Color(0xFFFF5858);
  static Color ratingColor = const Color(0xFF1BC400);
  static Color bottomNavSelectedColor = const Color(0xFFC90000);
  static Color bottomNavColor = const Color(0XFFD37272);
  static Color black25 = const Color.fromARGB(25, 0, 0, 0);
  static Color white = Colors.white;
  static Color white54 = Colors.white54;
  

  static TextStyle subHeading() {
    return GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.w600);
  }

  static TextStyle location() {
    return GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.normal);
  }

  static TextStyle chipText() {
    return GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.w500);
  }

  static TextStyle shopName() {
    return GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w600);
  }

  static TextStyle subCategories() {
    return GoogleFonts.poppins(fontSize: 11, fontWeight: FontWeight.normal);
  }

  static TextStyle bottomNavLabel() {
    return GoogleFonts.inter(
        fontSize: 11,
        color: Styles.bottomNavSelectedColor,
        fontWeight: FontWeight.w600);
  }

  static BoxShadow storyCardShadow() {
    return BoxShadow(
        color: Styles.black25, offset: const Offset(0, 4), blurRadius: 4);
  }

  static BoxShadow chipShadow() {
    return BoxShadow(
        color: Styles.black25, offset: const Offset(0, 4), blurRadius: 8);
  }

  static BoxShadow restaurantCardShadow() {
    return BoxShadow(
        color: Styles.black25, offset: const Offset(4, 6), blurRadius: 10);
  }

  static BoxShadow bottomNavCenterOptionShadow() {
    return BoxShadow(
        color: Styles.black25, offset: const Offset(-2, -4), blurRadius: 8);
  }

  static BorderRadius restaurantCardBorderRadius() {
    return BorderRadius.circular(11);
  }

  static BorderRadius storyCardBorderRadius() {
    return BorderRadius.circular(9);
  }

  static BorderRadius ratingBorderRadius() {
    return BorderRadius.circular(5);
  }
}
