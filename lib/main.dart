import 'package:flutter/material.dart';
import 'pages/addLocation.dart';
import 'pages/favorites.dart';
import 'pages/map.dart';
import 'pages/announcements.dart';
import 'pages/profilePage.dart';
import 'CustomNavBar.dart'; // Ensure to import your custom nav bar
import 'package:volunterra/pages/SignUp.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.web);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _currentIndex = 0; // State variable for current navigation index

  // List of pages for navigation
  final List<Widget> _pages = [
    const SignUp(), // Replace with your initial page
     MapPage(), // Your map page
    const AddLocationPage(), // Your add location page
     FavoritesPage(), // Your favorites page
     AnnouncementsPage(), // Your announcements page
     ProfilePage(), // Your profile page
  ];

  void _onNavItemTapped(int index) {
    setState(() {
      _currentIndex = index; // Update the current index on tap
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Your App Title',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const SignUp(),
    );
  }
}


