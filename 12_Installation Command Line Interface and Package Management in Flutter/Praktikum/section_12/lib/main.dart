import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget { // menggunakan stateless widget
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp( // Membangun Aplikasi dengan desain material untuk Android
      theme: ThemeData.dark(), // digunakan untuk menggunakan tema gelap
      home: const MyHomePage(title: 'Hallo Altera'),  // mendeklarasikan text pada title berupa String
    );
  }
}

class MyHomePage extends StatefulWidget { // menggunakan stateful widget
  const MyHomePage({super.key, required this.title});
  final String title; // menggunakan tipe data string 

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( // app bar berada di atas
        title: Text(widget.title), // menampilkan text pada app bar dengan mengambil dari class widget
      ),
      body: Center( // body berada di bawah appbar
        child: Column( 
          mainAxisAlignment: MainAxisAlignment.center, //digunakan agar widget berada ditengah
          children: const <Widget>[
            Text(
              'Nama saya adalah Muhammad Reza Pratama', // digunakan untuk menampilkan text
               style: TextStyle(fontSize: 20) // digunakan untuk mengubah ukuran dari text
            ),
            Text(
              'Dari Kelas Flutter D', // digunakan untuk menampilkan text
               style: TextStyle(fontSize: 20) // digunakan untuk mengubah ukuran dari text
            ),
          ],
        ),
      ),
    );
  }
}
