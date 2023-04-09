import 'package:flutter/material.dart';
import 'package:weekly1/dashboard.dart';
import 'package:weekly1/welcome.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Code Competence 1',
      theme: ThemeData.dark(
      ),
      home: const WelcomePage(),
    );
  }
}

