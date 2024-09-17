import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'favorites_provider.dart'; // 確保你導入了favorites_provider.dart

class UserLoveresPage extends StatelessWidget {
  const UserLoveresPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '最愛商家',
          style: TextStyle(color: Colors.white), // 設置文字顏色為白色
        ),
        backgroundColor: Colors.cyan, // 將header設置為青色
      ),
      body: Consumer<FavoritesProvider>(
        builder: (context, favoritesProvider, child) {
          final favorites = favoritesProvider.favorites;
          return ListView.builder(
            itemCount: favorites.length,
            itemBuilder: (context, index) {
              final restaurant = favorites[index];
              return ListTile(
                title: Text(restaurant.name),
                subtitle: Text(restaurant.address),
                trailing: IconButton(
                  icon: const Icon(Icons.remove_circle),
                  onPressed: () {
                    favoritesProvider.removeFavorite(restaurant);
                  },
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => restaurant.page),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
