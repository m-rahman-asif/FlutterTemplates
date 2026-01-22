import 'package:flutter/material.dart';
import 'package:flutter_templates/home_screen.dart';
import 'package:flutter_templates/signup_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreen();
}

class _LoginScreen extends State<LoginScreen> {
  String email="", password="";
  final _formkey=GlobalKey<FormState>();
  TextEditingController emailController=new TextEditingController();
  TextEditingController passwordController=new TextEditingController();
  login()async
  {
    try
    {
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
    }
    on FirebaseAuthException catch (e)
    {
      if(e.code=="user-not-found")
      {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Invalid email.")));
      }
      else if(e.code=="wrong-password")
      {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Wrong password.")));
      }
    }
  }


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
              child: Form(
                key: _formkey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Welcome"),
                    Text("Login"),
                    Text("Email"),
                    TextFormField(
                      controller: emailController,
                      validator: (value)
                      {
                        if(value==null || value.isEmpty)
                        {
                          return "Please enter email";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: "Enter Email",
                        suffixIcon: Icon(Icons.email),
                      ),
                    ),
                    SizedBox(height: 20),
                    Text("Password"),
                    TextFormField(
                      controller: passwordController,
                      validator: (value)
                      {
                        if(value==null || value.isEmpty)
                        {
                          return "Please enter password";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: "Enter Password",
                        suffixIcon: Icon(Icons.password),
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [Text("Forgot password?")],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                          ),
                          child: Text(
                            'Login',
                            style: TextStyle(color: Colors.black),
                          ),
                          onPressed: () {
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
                            if(_formkey.currentState!.validate())
                            {
                              setState(() {
                                email=emailController.text;
                                password=passwordController.text;
                              });
                            }
                            login();
                          },
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [Text("Don't have an account?")],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>SignupScreen()));
                            
                          },
                          child: Text("Sign Up", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold))
                          )
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
