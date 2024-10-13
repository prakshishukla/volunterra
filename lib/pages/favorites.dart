import 'package:flutter/material.dart';

class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text("Favorites"),
      ),
      body: Center(
        child: Text("This is the Favorites Page"),
      ),
    );
  }
}