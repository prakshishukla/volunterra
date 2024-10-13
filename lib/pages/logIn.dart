import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:volunterra/CustomNavBar.dart';
import 'package:volunterra/pages/authenticationService.dart';
import 'package:volunterra/pages/signUp.dart';

class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool _isLoading = false; 
  String? _errorMessage; 

  Future<void> _login() async {
    setState(() {
      _isLoading = true; // Set loading state
      _errorMessage = null; // Reset error message
    });

    try {
      await AuthService().signInWithEmailAndPassword(
        emailController.text.trim(),
        passwordController.text.trim(),
      );
    Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => CustomNavBar()), // Navigate to CustomNavBar
        );

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
    return Center(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: Material(
                child: Text(
                  "Welcome Back to VolunTerra!",
                  style: TextStyle(color: Colors.green, fontSize: 25, backgroundColor: Colors.white),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Material(
                child: Text(
                  "Login Here",
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
                        onPressed: _isLoading ? null : _login, // Disable button when loading
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Colors.green),
                          foregroundColor: MaterialStateProperty.all(Colors.white),
                        ),
                        child: _isLoading 
                          ? const CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.white))
                          : const Text('Login!'),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Don't have an account?"),
                        TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SignUp(),
                              ),
                            );
                          },
                          child: const Text(
                            "Sign Up",
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
