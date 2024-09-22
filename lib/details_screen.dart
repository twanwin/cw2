// details_screen.dart
import 'package:flutter/material.dart';

class DetailsScreen extends StatefulWidget {
  final String recipe;
  final bool isFavorite;
  final ValueChanged<bool> onFavoriteChanged;

  const DetailsScreen({super.key, 
    required this.recipe,
    required this.isFavorite,
    required this.onFavoriteChanged,
  });

  @override
  // ignore: library_private_types_in_public_api
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  late bool isFavorite;

  @override
  void initState() {
    super.initState();
    isFavorite = widget.isFavorite;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.recipe),
        backgroundColor: Colors.grey[800],
      ),
      backgroundColor: Colors.grey[200],
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Ingredients for ${widget.recipe}:',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text('1. Ingredient 1\n2. Ingredient 2\n3. Ingredient 3'),
            const SizedBox(height: 16),
            const Text(
              'Instructions:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text('1. Step 1\n2. Step 2\n3. Step 3'),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  icon: Icon(
                    isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: isFavorite ? Colors.red : Colors.grey,
                  ),
                  onPressed: () {
                    setState(() {
                      isFavorite = !isFavorite;
                    });
                    widget.onFavoriteChanged(isFavorite);
                  },
                ),
                Text(isFavorite ? 'Unmark as Favorite' : 'Mark as Favorite')
              ],
            )
          ],
        ),
      ),
    );
  }
}
