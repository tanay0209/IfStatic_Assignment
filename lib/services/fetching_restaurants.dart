import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RestaurantsProvider extends ChangeNotifier {
  List<dynamic> restaurants = [];
  bool isLoading = true;

// ------------------------------------  Function to fetch Restaurants----------------------------------------------------------------
  void fetchRestaurants() async {
    String baseUrl = "https://theoptimiz.com/restro/public/api/";
    String postsEndPoint = "${baseUrl}get_resturants";

    final url = Uri.parse(postsEndPoint);
    final response = await http.post(url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(<String, double>{
          "lat": 25.22,
          "lng": 45.32,
        }));

    dynamic decodedData = jsonDecode(response.body);
    restaurants = decodedData["data"];
    isLoading = false;
    notifyListeners();
  }
}
