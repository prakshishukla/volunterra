import 'package:flutter/material.dart';
import 'pages/addLocation.dart';
import 'pages/favorites.dart';
import 'pages/map.dart';
import 'pages/announcementPage.dart';
import 'pages/profilePage.dart';

class CustomNavBar extends StatefulWidget {
  @override
  _CustomNavBarState createState() => _CustomNavBarState();

}

class _CustomNavBarState extends State<CustomNavBar> {
  int _currentIndex = 2; // Track the currently selected index

  // List of widgets for each tab
  final List<Widget> _pages = [
    
    FavoritesPage(),     // Favorites Page
    AddLocationPage(),   // Add Location Page (ensure this widget exists)
    MapPage(),           // Home (Map) Page
    AnnouncementsPage(), // Announcements Page
    ProfilePage(),       // Profile Page
  ];

  void _onItemTapped(int index) {
    if (index < 0 || index >= _pages.length) return; // Ensure index is within bounds
    setState(() {
      _currentIndex = index; // Update the current index safely
    });
  }

  @override
  Widget build(BuildContext context) {
    ThemeData(primarySwatch: Colors.green,);
    return Scaffold(
      body: _pages[_currentIndex], // Display the selected page
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_location),
              label: 'Add Location',
            ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: 'Map',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.announcement),
            label: 'Announcements',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _currentIndex, // Highlight the selected tab
        onTap: _onItemTapped, // Handle tab taps
        selectedItemColor: Colors.green, // Customize selected item color
        unselectedItemColor: Colors.grey, // Customize unselected item color
      ),
    );
  }
}
