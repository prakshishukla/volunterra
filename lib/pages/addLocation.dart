import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import '../firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:geocoding/geocoding.dart'; // For native geocoding
import 'package:http/http.dart' as http; // For using Google API for web

class AddLocationPage extends StatefulWidget {
  const AddLocationPage({Key? key}) : super(key: key);

  @override
  _AddLocationPageState createState() => _AddLocationPageState();
}

class _AddLocationPageState extends State<AddLocationPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _addressController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _orgNameController = TextEditingController();
  bool _isLoading = false;

  // Add your Google API key here if you are using the web fallback
  final String _googleApiKey = 'AIzaSyADBPc3yqH6zr8meS5k1gnij_Hp00IE00o';

  // Fallback function to get coordinates for the web
  Future<Map<String, double>> _getCoordinatesFromAddress(String address) async {
    if (kIsWeb) {
      final Uri url = Uri.parse(
        'https://maps.googleapis.com/maps/api/geocode/json?address=${Uri.encodeComponent(address)}&key=$_googleApiKey',
      );
      final http.Response response = await http.get(url);

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        if (data['status'] == 'OK') {
          final latLng = data['results'][0]['geometry']['location'];
          return {
            'latitude': latLng['lat'],
            'longitude': latLng['lng'],
          };
        } else {
          throw Exception('Failed to retrieve coordinates. Status: ${data['status']}');
        }
      } else {
        throw Exception('Failed to connect to the geocoding service.');
      }
    } else {
      // For mobile or other platforms, use geocoding package
      List<Location> locations = await locationFromAddress(address);
      return {
        'latitude': locations.first.latitude,
        'longitude': locations.first.longitude,
      };
    }
  }

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      try {
        // Ensure Firebase is properly initialized for web
        if (!kIsWeb) {
          await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
        }

        // Use Firestore instance
        final firestore = FirebaseFirestore.instance;

        // Get coordinates from address (handling both web and mobile platforms)
        Map<String, double> coordinates = await _getCoordinatesFromAddress(_addressController.text);

        double latitude = coordinates['latitude']!;
        double longitude = coordinates['longitude']!;
        
        // Log the coordinates
        print('Coordinates received: Latitude - $latitude, Longitude - $longitude');

        // Submit data to Firestore
        await firestore.collection('Locations').add({
          'name': _nameController.text,
          'address': _addressController.text,
          'description': _descriptionController.text,
          'organization': _orgNameController.text,
          'latitude': latitude,
          'longitude': longitude,
        });

        // Clear the form fields
        _descriptionController.clear();
        _orgNameController.clear();
        _nameController.clear();
        _addressController.clear();

        // Show success message
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Location added successfully!')),
        );
      } on FirebaseException catch (e) {
        print('Firebase error: ${e.code} - ${e.message}');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Firebase error: ${e.message}')),
        );
      } on Exception catch (e) {
        print('Error submitting form: $e');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: ${e.toString()}')),
        );
      } finally {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
        ThemeData(primarySwatch: Colors.green,);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Location'),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'Location Name',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a location name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _orgNameController,
                decoration: const InputDecoration(
                  labelText: 'Organization/Organizer Name',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _addressController,
                decoration: const InputDecoration(
                  labelText: 'Address',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an address';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _descriptionController,
                decoration: const InputDecoration(
                  labelText: 'Description',
                  border: OutlineInputBorder(),
                ),
                maxLines: 3,
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: _isLoading ? null : _submitForm,
                child: _isLoading
                    ? CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      )
                    : const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _addressController.dispose();
    _descriptionController.dispose();
    _orgNameController.dispose();
    super.dispose();
  }
}
