import 'package:flutter/material.dart';
import 'package:food_ordering/utils/constants.dart';
import 'package:food_ordering/utils/styles.dart';

class StorySection extends StatelessWidget {
  const StorySection({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: storyImages.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.only(left: 8),
            width: w! * 0.25,
            height: h! * 0.2,
            decoration: BoxDecoration(
              borderRadius: Styles.storyCardBorderRadius(),
              boxShadow: [Styles.storyCardShadow()],
              image: DecorationImage(
                fit: BoxFit.fitHeight,
                image: AssetImage(storyImages[index]),
              ),
            ),
          );
        });
  }
}
