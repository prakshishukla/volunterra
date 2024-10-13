import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:volunterra/CustomNavBar.dart';
import 'package:volunterra/pages/map.dart';
import 'logIn.dart';
import 'authenticationService.dart'; // Assuming you have an authentication service
import 'package:cloud_firestore/cloud_firestore.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool _isLoading = false; // State for loading indicator
  String? _errorMessage; // State for error message

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> createUser(String uid, Map<String, dynamic> data) {
    return _db.collection('users').doc(uid).set({'uid': uid, ...data}, SetOptions(merge: true));
  }

  Future<void> _signUp() async {
    setState(() {
      _isLoading = true; // Set loading state
      _errorMessage = null; // Reset error message
    });
    try {
      // Perform sign up using the AuthService
      User? user = await AuthService().registerWithEmailAndPassword(
        emailController.text.trim(),
        passwordController.text.trim(),
      );

  if(user != null) {
      // After successful signup, create a user document in Firestore
      await createUser(user.uid, {
        'name': nameController.text.trim(),
        'email': emailController.text.trim(),
      });

      // Navigate back or to another screen after signup
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => CustomNavBar()), // Navigate to CustomNavBar
        );
  }
    } catch (e) {
      setState(() {
        _errorMessage = e.toString(); // Set error message
      });
    } finally {
      setState(() {
        _isLoading = false; // Reset loading state
      });
    }
  }

  @override
  Widget build(BuildContext context) {
        ThemeData(primarySwatch: Colors.green,);
    return Center(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: Material(
                child: Text(
                  "Welcome to VolunTerra!",
                  style: TextStyle(color: Colors.green, fontSize: 25, backgroundColor: Colors.white),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Material(
                child: Text(
                  "Sign up Here",
                  style: TextStyle(color: Colors.green, fontSize: 25, backgroundColor: Colors.white),
                ),
              ),
            ),
            Card(
              margin: const EdgeInsets.all(20.0),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextField(
                        controller: nameController,
                        decoration: InputDecoration(
                          labelText: 'Name',
                          errorText: _errorMessage, // Show error message if any
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextField(
                        controller: emailController,
                        decoration: InputDecoration(
                          labelText: 'Email',
                          errorText: _errorMessage, // Show error message if any
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextField(
                        controller: passwordController,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          errorText: _errorMessage, // Show error message if any
                        ),
                        obscureText: true, // Hide the password input
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: ElevatedButton(
                        onPressed: _isLoading ? null : _signUp, // Disable button when loading
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Colors.green),
                          foregroundColor: MaterialStateProperty.all(Colors.white),
                        ),
                        child: _isLoading 
                          ? const CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.white))
                          : const Text('Sign Up!'),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Already have an account?"),
                        TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LogIn(),
                              ),
                            );
                          },
                          child: const Text(
                            "Login",
                            style: TextStyle(color: Colors.blue),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
