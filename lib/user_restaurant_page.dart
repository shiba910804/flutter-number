import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'favorites_provider.dart'; // 確保你導入了favorites_provider.dart
import 'abiko.dart'; // 確保你導入了abiko.dart

class UserRestaurantPage extends StatelessWidget {
  const UserRestaurantPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '餐廳',
          style: TextStyle(color: Colors.white), // 設置文字顏色為白色
        ),
        backgroundColor: Colors.cyan, // 將header設置為青色
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildRestaurantItem(
            context,
            FavoriteRestaurant(name: '我孫子Abiko', address: '320桃園市中壢區興仁路二段67巷7號', page: const AbikoPage())
          ),
          _buildRestaurantItem(
            context,
            FavoriteRestaurant(name: '餐廳名稱 2', address: '餐廳地址 2', page: const Placeholder())
          ),
          _buildRestaurantItem(
            context,
            FavoriteRestaurant(name: '餐廳名稱 3', address: '餐廳地址 3', page: const Placeholder())
          ),
          // 添加更多餐廳條目
        ],
      ),
    );
  }

  Widget _buildRestaurantItem(BuildContext context, FavoriteRestaurant restaurant) {
    return Consumer<FavoritesProvider>(
      builder: (context, favoritesProvider, child) {
        final isFavorite = favoritesProvider.isFavorite(restaurant);
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 8.0),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: ListTile(
            title: Text(restaurant.name),
            subtitle: Text(restaurant.address),
            trailing: IconButton(
              icon: Icon(
                isFavorite ? Icons.favorite : Icons.favorite_border,
                color: isFavorite ? Colors.red : null,
              ),
              onPressed: () {
                if (isFavorite) {
                  favoritesProvider.removeFavorite(restaurant);
                } else {
                  favoritesProvider.addFavorite(restaurant);
                }
              },
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => restaurant.page),
              );
            },
          ),
        );
      },
    );
  }
}
