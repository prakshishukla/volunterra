import 'package:flutter/material.dart';
import 'pages/addLocation.dart';
import 'pages/favorites.dart';
import 'pages/map.dart';
import 'pages/announcements.dart';
import 'pages/profilePage.dart';
import 'custom_navbar.dart'; // Ensure to import your custom nav bar
import 'package:volunterra/pages/SignUp.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'pages/addLocation.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.web);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Your App Title',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AddLocationPage(),
    );
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your App Title'),
      ),
      body: Center(
        child: Text('Hello, World!'),

        title: const Center(
          child: Text(
            "VolunTerra",
            style: TextStyle(fontSize: 36), // Optional: Customize the text style
          ),
      ),
      
    );
  }
}