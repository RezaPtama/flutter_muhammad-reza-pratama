import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:section_25/Page/soal_prioritas1.dart';
import 'package:section_25/Page/soal_prioritas2.dart';
import 'Auth/login.dart';

void main() {
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Login(),
    );
  }
}