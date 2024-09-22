// main.dart
import 'package:flutter/material.dart';
import 'home_screen.dart';

void main() {
  runApp(const RecipeBookApp());
}

class RecipeBookApp extends StatelessWidget {
  const RecipeBookApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Recipe Book',
      theme: ThemeData(
        primaryColor: Colors.grey[800], // Dark gray for primary theme color
        scaffoldBackgroundColor: Colors.grey[200], // Light gray background
      ),
      home: const HomeScreen(),
       debugShowCheckedModeBanner: false, 
    );
  }
}
