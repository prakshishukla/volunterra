import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  late GoogleMapController mapController;

  // Initial position of the map
  final LatLng _center = const LatLng(47.655548, -122.303200);

  // List of markers to display on the map
  final Set<Marker> _markers = {};

  // Method to handle the creation of the Google Map controller
  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    _fetchLocations(); // Fetch and display the locations when the map is created
  }

  // Method to fetch locations from Firestore
  Future<void> _fetchLocations() async {
    try {
      // Fetch all locations from Firestore
      final QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('Locations').get();

      // Iterate through the locations and add them as markers
      snapshot.docs.forEach((doc) {
        final data = doc.data() as Map<String, dynamic>;
        final double latitude = data['latitude'];
        final double longitude = data['longitude'];
        final String address = data['address'];
        final String organization = data['organization'];
        final String name = data['name'] ?? 'Unnamed Location';

        // Add a marker for each location
        _markers.add(
          Marker(
            markerId: MarkerId(doc.id),
            position: LatLng(latitude, longitude),
            infoWindow: InfoWindow(
              title: name,
              snippet: '$organization | $address',
            ),
          ),
        );
      });

      // Update the map with the new markers
      setState(() {});
    } catch (e) {
      print('Error fetching locations: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Google Maps Demo'),
      ),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: _center, // Center of the map
          zoom: 13.5, // Initial zoom level
        ),
        markers: _markers, // Display markers on the map
      ),
    );
  }
}
