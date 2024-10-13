import 'package:flutter/material.dart';
import 'package:volunterra/pages/signUp.dart';

class LogIn extends StatelessWidget {

  const LogIn({Key? key}) : super(key: key);

@override
Widget build(BuildContext context) {
  return Center(
    child: SingleChildScrollView(  // Add this
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: Material( child: Text(
              "Welcome Back to VolunTerra!",
              style: TextStyle(color: Colors.green, fontSize: 25,backgroundColor: Colors.white),
            ),)
          ),
          const Padding(
            padding: EdgeInsets.all(10.0),
            child: Material( child: Text(
              "Login Here",
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
                      child: const Text('Login!'),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don't have an account?"),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignUp(),
                            ),
                          );
                        },
                        child: const Text(
                          "Sign Up",
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