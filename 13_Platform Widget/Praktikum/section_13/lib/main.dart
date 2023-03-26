import 'package:flutter/material.dart';
import 'package:section_13/cuperIos.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark(), // Tema Dark
      home: const MyHomePage(title: 'Material App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  // List
  static List<Map> phone = [
    {
      'nama' : 'Leane Graham',
      'nomor' : '010-692-6593'
    },
    {
      'nama' : 'Ervin Howell',
      'nomor' : '010-692-6593 x56442'
    },
    {
      'nama' : 'Clementine Bauch',
      'nomor' : '1-463-123-4447'
    },
    {
      'nama' : 'Patricia Lebsack',
      'nomor' : '493-170-9623 x156'
    },
    {
      'nama' : 'Chelsey Dietrich',
      'nomor' : '(254)954-1289'
    },
    {
      'nama' : 'Mrs. Dennis Schulist',
      'nomor' : '1-499-935-8478 x6430'
    },
    {
      'nama' : 'Kurtis Weissnat',
      'nomor' : '210.067.6132'
    }
  ];


  // Fungsi untuk Bottom Navigation Bar
  void _OnTapIndex(int index){
    setState(() {
      _selectedIndex = index;
    });
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ), 
        body: SafeArea(
          child: ListView( // Menggunakan ListView
            padding: const EdgeInsets.all(10), // menggunakan padding agar ada jarak spasi
            children: [
              for (int i=0; i<phone.length;i++) // looping tampilan
                Container( // menggunakan container
                  padding: EdgeInsets.only(bottom : 35),
                  child: Row( // menggunakan row agar widget se baris
                    mainAxisAlignment: MainAxisAlignment.start, // agar align menjadi di samping kiri
                    children: [
                      ElevatedButton(onPressed: (){}, // untuk membuat avatar 
                      child: Icon(Icons.person,color: Colors.white,size: 30,),
                      style: ElevatedButton.styleFrom(
                        shape: CircleBorder(),
                        padding: EdgeInsets.all(20),
                        backgroundColor: Colors.green
                      ),
                      ),
                      Padding(padding: EdgeInsets.only(left: 10)),
                      Column( // menggunakan column agar ber kolom
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget> [
                          Text(phone[i]['nama'],style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),), // Memanggil list dengan key nama
                          const Padding(padding: EdgeInsets.only(bottom: 5)),
                          Text(phone[i]['nomor'],style: TextStyle(fontSize: 18,color: Color.fromARGB(179, 255, 255, 255)),), // Memanggil list dengan key nama
                        ],
                      )
                    ],
                  ),
                ),
            ],
          ),
        ),
        
        // Bottom Navigation Bar
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem> [
            BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.settings),label: 'Settings'),
          ],
          currentIndex: _selectedIndex,
          onTap: _OnTapIndex,
        ),

        //Drawer
        drawer: SafeArea(
          child: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget> [
                // Home
                ListTile(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  title : Row(
                    children: const <Widget>[
                      Icon(Icons.home),
                      Padding(padding: EdgeInsets.only(left: 20)),
                      Text('Home'),
                    ],
                  ),
                ),

                //Setting
                ListTile(
                  onTap: () {
                    Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Ios()));
                  },
                  title : Row(
                    children: const <Widget>[
                      Icon(Icons.settings),
                      Padding(padding: EdgeInsets.only(left: 20)),
                      Text('Settings'),
                    ],
                  ),
                ),
              ],
            ),
            ),
        ),
      );
  }
}