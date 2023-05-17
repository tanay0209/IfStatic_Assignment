import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:stylish_bottom_bar/model/bar_items.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return StylishBottomBar(
      items: [
        BottomBarItem(
          icon: const Icon(
            Icons.menu_sharp,
          ),
          selectedIcon: const Icon(Icons.house_rounded),
          backgroundColor: Colors.red,
          title: const Text('Home'),
        ),
        BottomBarItem(
            icon: const FaIcon(FontAwesomeIcons.youtube),
            title: const Text('Videos'),
            backgroundColor: Colors.red.shade400),
        BottomBarItem(
          icon: const Icon(
            Icons.bookmark,
          ),
          backgroundColor: Colors.red.shade400,
          title: const Text('Bookmarked'),
        ),
        BottomBarItem(
          icon: const Icon(
            Icons.person_outline,
          ),
          backgroundColor: Colors.red.shade400,
          title: const Text('Profile'),
        ),
      ],
      hasNotch: true,
      fabLocation: StylishBarFabLocation.center,
      onTap: (index) {},
      option: AnimatedBarOptions(
        barAnimation: BarAnimation.fade,
        iconStyle: IconStyle.animated,
      ),
    );
  }
}
