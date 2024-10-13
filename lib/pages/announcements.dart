import 'package:flutter/material.dart';

class Announcements extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text("Announcements"),
      ),
      body: Center(
        child: Text("This is the Announcements Page"),
      ),
    );
  }
}