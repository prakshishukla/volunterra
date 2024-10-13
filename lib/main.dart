import 'package:flutter/material.dart';
import 'pages/addLocation.dart';
import 'pages/favorites.dart';
import 'pages/map.dart';
import 'pages/announcements.dart';
import 'pages/profilePage.dart';
import 'custom_navbar.dart'; // Ensure to import your custom nav bar
import 'package:volunterra/pages/SignUp.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

// Note: The Google Maps API key should not be placed in this file.
// It should be added to the web/index.html file.
// Look for the following line in web/index.html:
// <script src="https://maps.googleapis.com/maps/api/js?key=YOUR-KEY-HERE"></script>
// Replace YOUR-KEY-HERE with your actual Google Maps API key.

class _MyAppState extends State<MyApp> {
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(45.521563, -122.677433);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Google Maps Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
        colorSchemeSeed: Colors.green[700],
      ),
      home: Scaffold(
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
      ),
      home: const MyHomePage(),
      //home: SignUp(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
        toolbarHeight: 60,
      ),
      body: _pages[_currentIndex], // Display the selected page
      bottomNavigationBar: CustomNavBar(
        currentIndex: _currentIndex, // Pass the current index
        onTap: _onNavItemTapped, // Pass the onTap callback
      ),
      backgroundColor: Colors.grey[200], // Set the background color to a light gray
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}