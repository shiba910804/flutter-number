import 'package:flutter/material.dart';

class FavoriteRestaurant {
  final String name;
  final String address;
  final Widget page;

  FavoriteRestaurant({required this.name, required this.address, required this.page});
}

class FavoritesProvider with ChangeNotifier {
  final List<FavoriteRestaurant> _favorites = [];

  List<FavoriteRestaurant> get favorites => _favorites;

  void addFavorite(FavoriteRestaurant restaurant) {
    _favorites.add(restaurant);
    notifyListeners();
  }

  void removeFavorite(FavoriteRestaurant restaurant) {
    _favorites.remove(restaurant);
    notifyListeners();
  }

  bool isFavorite(FavoriteRestaurant restaurant) {
    return _favorites.any((item) => item.name == restaurant.name);
  }
}
