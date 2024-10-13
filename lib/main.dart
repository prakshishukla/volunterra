import 'package:flutter/material.dart';
import 'pages/addLocation.dart';
import 'pages/favorites.dart';
import 'pages/map.dart';
import 'pages/announcements.dart';
import 'pages/profilePage.dart';
import 'custom_navbar.dart'; // Ensure to import your custom nav bar

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: const HomePage(), // Set the main home page
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0; // Track the current index of the nav bar

  // List of pages to display
  final List<Widget> _pages = [
    AddLocation(),
    Favorites(),
    MapPage(),
    Announcements(),
    ProfilePage(),
  ];

  // Update the current index when a nav item is tapped
  void _onNavItemTapped(int index) {
    setState(() {
      _currentIndex = index; // Set the new index
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            "VolunTerra",
            style: TextStyle(fontSize: 36), // Optional: Customize the text style
          ),
        ),
        toolbarHeight: 60,
      ),
      body: _pages[_currentIndex], // Display the selected page
      bottomNavigationBar: CustomNavBar(
        currentIndex: _currentIndex, // Pass the current index
        onTap: _onNavItemTapped, // Pass the onTap callback
      ),
      backgroundColor: Colors.grey[200], // Set the background color to a light gray
    );
  }
}