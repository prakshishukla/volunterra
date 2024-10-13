import 'package:flutter/material.dart';
import 'pages/addLocation.dart';
import 'pages/favorites.dart';
import 'pages/map.dart';
import 'pages/announcements.dart';
import 'pages/profilePage.dart';
import 'custom_navbar.dart'; // Ensure to import your custom nav bar
import 'package:volunterra/pages/SignUp.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.web);
  runApp(MyApp());
}


class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  
  @override
  State<MyApp> createState() => _MyAppState();
}


class _MyAppState extends State<MyApp> {
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(45.521563, -122.677433);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }  
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Your App Title',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      /*home: Scaffold(
        appBar: AppBar(
          title: const Text('Google Maps Demo'),
          elevation: 2,
        ),
        body: GoogleMap(
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: _center,
            zoom: 11.0,
          ),
        ),
      ),*/
      //home: const MyHomePage(title: 'Flutter Demo Home Page'),
      home: SignUp(),
      //home: AddLocationPage(),
    );
  }
}

/*
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
      ) 
    );
  }*/
