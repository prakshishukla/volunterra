import 'package:flutter/material.dart';

import 'logIn.dart';

class SignUp extends StatelessWidget {

  SignUp() {
    //SignUp(),
  }

@override
Widget build(BuildContext context) {
  return Center(
    child: SingleChildScrollView(  // Add this
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: Material(child: Text(
              "Welcome to VolunTerra!",
              style: TextStyle(color: Colors.green, fontSize: 25,backgroundColor: Colors.white),
            ),)
          ),
          const Padding(
            padding: EdgeInsets.all(10.0),
            child:Material (child: Text(
              "Sign up Here",
              style: TextStyle(color: Colors.green, fontSize: 25,backgroundColor: Colors.white),
            ),)
          ),
          Card(
            margin: const EdgeInsets.all(20.0),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: TextField(
                      decoration: InputDecoration(labelText: 'Name'),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: TextField(
                      decoration: InputDecoration(labelText: 'Email'),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: TextField(
                      decoration: InputDecoration(labelText: 'Password'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: ElevatedButton(
                      onPressed: () {
                        // Handle signup logic here
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.green),
                        foregroundColor:
                            MaterialStateProperty.all(Colors.white),
                      ),
                      child: const Text('Sign Up!'),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Already have an account?"),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
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
                      )
                    ],
                  )
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