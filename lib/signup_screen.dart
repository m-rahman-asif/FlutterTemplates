import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_templates/home_screen.dart';
import 'package:flutter_templates/login_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});
  @override
  State<SignupScreen> createState() => _SignupScreen();
}

class _SignupScreen extends State<SignupScreen> {
  String email="", password="", name="";
  TextEditingController emailController=new TextEditingController();
  TextEditingController passwordController=new TextEditingController();
  TextEditingController nameController=new TextEditingController();
  final _formkey=GlobalKey<FormState>();

  signup()async
  {
    if(password!=null)
    {
      try
      {
        UserCredential userCredential=await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Registration Successful!")));
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
      }
      on FirebaseException catch(e)
      {
        if(e.code=="email-already-in-use")
        {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Account already exits!")));
        }
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
                    Text("Create Your Account"),
                    Text("Full Name"),
                    TextFormField(
                      controller: nameController,
                      validator: (value)
                      {
                        if(value==null || value.isEmpty)
                        {
                          return "Please enter your name";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: "Enter Name",
                      ),
                    ),
                    SizedBox(height: 20),
                    Text("Email"),
                    TextFormField(
                      controller: emailController,
                      validator: (value)
                      {
                        if(value==null || value.isEmpty)
                        {
                          return "Please enter your email";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: "Enter Email",
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
                    Text("Confirm Password"),
                    TextFormField(
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
                          onPressed: () {
                            if(_formkey.currentState!.validate())
                            {
                              setState(() {
                                email=emailController.text;
                                name=nameController.text;
                                password=passwordController.text;
                              });
                            }
                            signup();
                          },
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
            ),
          ],
        ),
      ),
    );
  }
}
