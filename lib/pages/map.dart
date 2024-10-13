import 'package:flutter/material.dart';

class MapPage extends StatelessWidget { // Ensure the class name matches what you use in CustomNavBar
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text("Map"),
      ),
      body: Center(
        child: Text("This is the Map Page"),
      ),
    );
  }
}
