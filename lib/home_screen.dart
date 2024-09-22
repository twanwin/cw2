// home_screen.dart
import 'package:flutter/material.dart';
import 'details_screen.dart';
import 'favorites_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> recipes = ['Spaghetti', 'Fried Rice', 'Pancakes', 'Banana Cakes','Lasanha'];
  List<String> favoriteRecipes = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recipe Book'),
        backgroundColor: const Color.fromARGB(255, 101, 98, 98),
      ),
      backgroundColor: const Color.fromARGB(255, 242, 236, 236),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: recipes.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(recipes[index]),
                  onTap: () {
                    // Navigate to DetailsScreen and pass the recipe name and favorite callback
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailsScreen(
                          recipe: recipes[index],
                          isFavorite: favoriteRecipes.contains(recipes[index]),
                          onFavoriteChanged: (isFavorite) {
                            setState(() {
                              if (isFavorite) {
                                favoriteRecipes.add(recipes[index]);
                              } else {
                                favoriteRecipes.remove(recipes[index]);
                              }
                            });
                          },
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          // Add the "View Favorites" button
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                // Navigate to FavoritesScreen
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        FavoritesScreen(favoriteRecipes: favoriteRecipes),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(backgroundColor: const Color.fromARGB(255, 157, 155, 155)),
              child: const Text('View Favorites'),
            ),
          ),
        ],
      ),
    );
  }
}
