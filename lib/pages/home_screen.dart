import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:food_ordering/services/fetching_restaurants.dart';
import 'package:food_ordering/services/user_location.dart';
import 'package:food_ordering/utils/constants.dart';
import 'package:food_ordering/utils/story_section.dart';
import 'package:food_ordering/utils/styles.dart';
import 'package:food_ordering/widgets/bottom_navigation.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController controller = TextEditingController();
  List restaurants = [];
  List filteredRestaurants = [];
  bool restaurantsPopulated = false;
  int selected = -1;

  @override
  void initState() {
    super.initState();
    Provider.of<RestaurantsProvider>(context, listen: false).fetchRestaurants();
    Provider.of<UserLocation>(context, listen: false).getCurrentPosition();
  }

// Function to filter the search results
  void filterSearchResults(String query) {
    setState(() {
      filteredRestaurants = restaurants
          .where(
            (item) => item["name"].toLowerCase().contains(
                  query.toLowerCase(),
                ),
          )
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    String location =
        Provider.of<UserLocation>(context, listen: true).currentAddress;
    bool isLoading =
        Provider.of<RestaurantsProvider>(context, listen: true).isLoading;
    if (!isLoading) {
      restaurants =
          Provider.of<RestaurantsProvider>(context, listen: true).restaurants;
      if (filteredRestaurants.isEmpty && !restaurantsPopulated) {
        filteredRestaurants = restaurants;
        restaurantsPopulated = true;
      }
    }
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: const BottomNavigation(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Styles.bottomNavSelectedColor,
          child: const Icon(
            FontAwesomeIcons.barcode,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        extendBody: true,
        body: SingleChildScrollView(
          child: Column(children: [
            Container(
              height: h! * 0.38,
              width: w,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Styles.upperContainerTopGradient,
                    Styles.upperContainerLowerGradient,
                    Styles.white54
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Column(
                children: [
// ------------------------------------  Location Section ----------------------------------------------------------------
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const FaIcon(
                          FontAwesomeIcons.locationDot,
                          size: 19,
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        Text(
                          location,
                          style: Styles.location(),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),

// ------------------------------------  Stories Section ----------------------------------------------------------------
                  Container(
                    margin: const EdgeInsets.only(left: 15.5),
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Stories",
                      style: Styles.subHeading(),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  SizedBox(
                    height: h! * 0.15,
                    child: const StorySection(),
                  ),
                  const SizedBox(
                    height: 15,
                  ),

// ------------------------------------  Search Bar  ----------------------------------------------------------------
                  Container(
                    decoration: BoxDecoration(boxShadow: [Styles.chipShadow()]),
                    margin:
                        const EdgeInsets.symmetric(horizontal: 14, vertical: 0),
                    child: TextField(
                      controller: controller,
                      onChanged: (value) {
                        filterSearchResults(value);
                      },
                      decoration: InputDecoration(
                        filled: true,
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        fillColor: Styles.white,
                        hintText: "Search Food Items",
                        hintStyle: Styles.chipText(),
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: FaIcon(
                            FontAwesomeIcons.magnifyingGlass,
                            color: Styles.black,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
// ------------------------------------  Chips ----------------------------------------------------------------
            SizedBox(
              width: w,
              height: 50,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: chips.length,
                  itemBuilder: (context, index) {
                    return Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(left: 10),
                        ),
                        index == selected
                            ? ElevatedButton(
                                style: ButtonStyle(
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18),
                                    ),
                                  ),
                                  backgroundColor:
                                      MaterialStateProperty.resolveWith<Color>(
                                          (states) {
                                    if (states
                                        .contains(MaterialState.pressed)) {
                                      selected = index;
                                      return Styles.selectedChipBackground;
                                    } else {
                                      return Styles.selectedChipBackground;
                                    }
                                  }),
                                ),
                                onPressed: () {
                                  setState(() {
                                    selected = index;
                                  });
                                },
                                child: Row(
                                  children: [
                                    index == 0
                                        ? const SizedBox(
                                            height: 0,
                                            width: 0,
                                          )
                                        : Container(
                                            height: 30,
                                            width: 50,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: AssetImage(
                                                  chips[index]["chipImage"],
                                                ),
                                              ),
                                            ),
                                          ),
                                    Text(chips[index]["label"],
                                        style: Styles.chipText())
                                  ],
                                ),
                              )
                            : ElevatedButton(
                                style: ButtonStyle(
                                    shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(18),
                                      ),
                                    ),
                                    backgroundColor: MaterialStateProperty
                                        .resolveWith<Color>((states) {
                                      if (states
                                          .contains(MaterialState.pressed)) {
                                        selected = index;
                                        return Styles.selectedChipBackground;
                                      } else {
                                        return Styles.white;
                                      }
                                    })),
                                onPressed: () {
                                  setState(() {
                                    selected = index;
                                  });
                                },
                                child: index == 0
                                    ? const SizedBox(
                                        child: Text(
                                          "All",
                                          style: TextStyle(color: Colors.black),
                                        ),
                                      )
                                    : Container(
                                        height: 30,
                                        width: 50,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: AssetImage(
                                              chips[index]["chipImage"],
                                            ),
                                          ),
                                        ),
                                      ),
                              ),
                      ],
                    );
                  }),
            ),
            const SizedBox(
              height: 10,
            ),

// ------------------------------------  Nea rBy Restaurants Section ----------------------------------------------------------------
            Container(
              margin: const EdgeInsets.only(left: 10, right: 10),
              height: h! / 2,
              width: w,
              child: isLoading
                  ? const Text("Looking for restaurants around you")
                  : filteredRestaurants.isEmpty
                      ? const Text("No Restaurants Found")
                      : ListView.builder(
                          itemCount: filteredRestaurants.length,
                          itemBuilder: (context, index) {
                            List<String> subCtaegories =
                                filteredRestaurants[index]["tags"].split(',');

                            String modifiedCategories =
                                subCtaegories.join("  ");
                            return Container(
                              decoration: BoxDecoration(
                                color: Styles.white,
                                boxShadow: [
                                  Styles.restaurantCardShadow(),
                                ],
                                borderRadius: BorderRadius.circular(11),
                              ),
                              margin: const EdgeInsets.only(bottom: 10),
                              height: h! / 4,
                              width: 200,
                              child: Column(
                                children: [
                                  SizedBox(
                                    child: Stack(
                                      children: [
                                        Container(
                                          height: h! / 6,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              fit: BoxFit.fill,
                                              image: NetworkImage(
                                                filteredRestaurants[index]
                                                    ["primary_image"],
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          height: h! / 6,
                                          alignment: Alignment.bottomRight,
                                          child: Container(
                                            margin: const EdgeInsets.only(
                                              right: 10,
                                              bottom: 10,
                                            ),
                                            decoration: BoxDecoration(
                                              color: Styles.ratingColor,
                                              borderRadius:
                                                  Styles.ratingBorderRadius(),
                                            ),
                                            padding: const EdgeInsets.all(8),
                                            child: RichText(
                                              text: TextSpan(
                                                children: [
                                                  TextSpan(
                                                    text:
                                                        "${filteredRestaurants[index]["rating"]}",
                                                    style: Styles.subHeading(),
                                                  ),
                                                  const WidgetSpan(
                                                    child: SizedBox(
                                                      width: 5,
                                                    ),
                                                  ),
                                                  WidgetSpan(
                                                    child: Icon(
                                                      Icons.star,
                                                      size: 17,
                                                      color: Styles.white,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.only(
                                          left: 8,
                                          top: 8,
                                        ),
                                        child: Text(
                                          filteredRestaurants[index]["name"],
                                          style: Styles.shopName(),
                                        ),
                                      ),
                                      RichText(
                                        text: TextSpan(
                                          children: [
                                            const WidgetSpan(
                                              child: Image(
                                                height: 18,
                                                image: AssetImage(
                                                  "assets/icons/discount.png",
                                                ),
                                              ),
                                            ),
                                            const WidgetSpan(
                                              child: SizedBox(
                                                width: 10,
                                              ),
                                            ),
                                            TextSpan(
                                              text:
                                                  "${filteredRestaurants[index]["discount"]} % FLAT OFF",
                                              style:
                                                  Styles.subHeading().copyWith(
                                                color: Styles
                                                    .discountBackgroundColor,
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.only(left: 8),
                                        child: Text(
                                          modifiedCategories,
                                          style: Styles.subCategories(),
                                        ),
                                      ),
                                      Container(
                                        padding:
                                            const EdgeInsets.only(right: 8),
                                        child: Text(
                                          "${(double.parse(filteredRestaurants[index]["distance"]) / 1000).toStringAsFixed(3)} km ",
                                          style: Styles.subCategories(),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            );
                          }),
            )
          ]),
        ),
      ),
    );
  }
}
