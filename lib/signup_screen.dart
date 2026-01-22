import 'package:flutter/material.dart';
import 'package:flutter_templates/login_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});
  @override
  State<SignupScreen> createState() => _SignupScreen();
}

class _SignupScreen extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(""),
            Padding(
              padding: const EdgeInsets.only(left: 30.0, right: 30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Welcome"),
                  Text("Create Your Account"),
                  Text("Full Name"),
                  TextField(
                    decoration: InputDecoration(
                      hintText: "Enter Name",
                    ),
                  ),
                  SizedBox(height: 20),
                  Text("Email"),
                  TextField(
                    decoration: InputDecoration(
                      hintText: "Enter Email",
                    ),
                  ),
                  SizedBox(height: 20),
                  Text("Password"),
                  TextField(
                    decoration: InputDecoration(
                      hintText: "Enter Password",
                      suffixIcon: Icon(Icons.password),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text("Confirm Password"),
                  TextField(
                    decoration: InputDecoration(
                      hintText: "Rewrite Password",
                      suffixIcon: Icon(Icons.password),
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                        ),
                        child: Text(
                          'SIGN UP',
                          style: TextStyle(color: Colors.black),
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [Text("Already Sign Up?")],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
                        },
                        child: Text("Login", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold))
                        )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
