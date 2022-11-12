import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class Product with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  bool isFavorite;

  Product({
    this.id,
    this.title,
    this.description,
    this.price,
    this.imageUrl,
    this.isFavorite = false,
  });

  void toggleFavoriteStatus(String token, String userId) async {
    final oldStatus = isFavorite;
    isFavorite = !isFavorite;
    notifyListeners();
    final url = Uri.parse(
        'https://myshopapp-90643-default-rtdb.firebaseio.com/userFavourites/$userId/$id.json?auth=$token');
    try {
      await http.put(
        url,
        body: json.encode(
          isFavorite,
        ),
      );
    } catch (error) {
      isFavorite = oldStatus;
      notifyListeners();
    }
  }
}
