// addLocation.dart
import 'package:flutter/material.dart';

class AddLocation extends StatelessWidget { // Ensure class name matches
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text("Add Location"),
      ),
      body: Center(
        child: Text("This is the Add Location Page"),
      ),
    );
  }
}