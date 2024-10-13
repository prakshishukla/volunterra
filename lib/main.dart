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
      /*home: Scaffold(
        body: _pages[_currentIndex], // Display the current page based on index
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.person_add),
              label: 'Sign Up',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.map),
              label: 'Map',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add_location),
              label: 'Add Location',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Favorites',
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
          currentIndex: _currentIndex, // Highlight the current index
          onTap: _onNavItemTapped, // Handle navigation
          selectedItemColor: Colors.green,
          unselectedItemColor: Colors.grey,
        ),
      ),*/
    );
  }
}


/*class _MyAppState extends State<MyApp> {
  late GoogleMapController mapController;
  int _currentIndex = 0;

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
      //home: customNavBar(),
      //home: AddLocationPage(),
    );
  }
} */