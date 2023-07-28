import 'package:apitutorials/Credential/signup.dart';
import 'package:apitutorials/Credential/upload_image.dart';
import 'package:apitutorials/Models/example_three.dart';
import 'package:apitutorials/Models/example_two.dart';
import 'package:apitutorials/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
       primarySwatch: Colors.blue
      ),
      home: UploadImageScreen()
    );
  }
}




