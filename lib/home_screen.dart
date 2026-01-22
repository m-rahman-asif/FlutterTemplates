import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_templates/models.dart'; 
import 'package:http/http.dart' as http;


class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

Future<Album>fetchAlbum()async
{
  final response=await http.get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));
  if(response.statusCode==200)
  {
    print(response.statusCode);
    return Album.fromJson(jsonDecode(response.body));
  }
  else
  {
    throw Exception("Failed to fetch data");
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home")),
      body: ElevatedButton(onPressed: () {
        fetchAlbum().then((value){
         print(value.id);
         print(value.title);
         print(value.userId); 
        });
      }, 
      child: Text("Click here")),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.av_timer_outlined), label: 'Camera'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
        ],
      ),
    );
  }
}
