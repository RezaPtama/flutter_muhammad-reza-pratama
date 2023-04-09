import 'dart:async';
import 'dart:ffi';
import 'dart:io';
import 'package:flutter/material.dart';
import 'dashboard.dart';



class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {

  PageController _pageController = PageController(
    initialPage: 0,
  );

@override
void dispose(){
  _pageController.dispose();
  super.dispose();
}

  List images = [
    "japan.png",
    "japan2.png",
    "japan3.png",
  ];

  List <Widget> welcomePage = [
    const Page1(),
    const Page2(),
    const Page3()

  ];

 int _selectedIndex = 0;
 
void nextPage(int index){
  _pageController.animateToPage(_pageController.page!.toInt() + 1, 
  duration: Duration(milliseconds: 400), curve: Curves.linear);
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
            controller: _pageController,
            // physics: NeverScrollableScrollPhysics(),
            itemCount: welcomePage.length,
            itemBuilder: (context,index){
              return SafeArea(
                child: Stack(
                  children: [
                    Container(
                      height: 500,
                      decoration: BoxDecoration(
                        image: DecorationImage
                        (
                          image: AssetImage("assets/gambar/"+images[index]),
                          fit: BoxFit.cover
                        ),
                      ),
                    ),

                    Positioned(
                      bottom: 0,
                      right: 0,
                      left: 0,
                      child: Container(
                        height: 350,
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 230, 230, 230),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(50),
                            topRight: Radius.circular(50),
                          )
                        ),
                        child: Container(
                          margin: const EdgeInsets.only(left: 30,right: 30,top: 20),
                          child: Column(
                            mainAxisAlignment : MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              welcomePage.elementAt(index),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: 70,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: List.generate(3, (indexDots){
                                          return Container(
                                            width: index == indexDots ? 30 : 15,
                                            height: 8,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(8),
                                              color: index == indexDots ? Colors.blue : Color.fromARGB(100, 33, 149, 243)
                                            ),
                                          );
                                        }),
                                    ),
                                  ),
                                  if(index == 2)...[
                                    SizedBox(
                                      height: 50,
                                      width: 100,
                                      child: ElevatedButton(
                                        onPressed: (){
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(builder: (context) => Dashboard()));
                                        },
                                        child: Text('Get Start'),
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.blue,
                                          shape: StadiumBorder(),
                                        ),
                                      ),
                                    )
                                  ]
                                  else...[
                                  IconButton(
                                    splashColor: Colors.blue,
                                    highlightColor: Colors.amber,
                                    onPressed: (){
                                      setState(() {
                                        nextPage(index);
                                      });
                                    }, 
                                    icon: Icon(Icons.arrow_forward),
                                    color: Colors.black,
                                    iconSize: 35,
                                  ),
                                  ],
                                ],
                              ),
                            ],
                          )

                          
                        ),
                      ),
                    ),
                    
                  ],
                ),
              );
            }),
      );
  }
}

class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Padding(padding: EdgeInsets.only(top: 20)),
        Text(
          "Selamat Datang \n(いらっしゃいませ)",
          style: TextStyle(fontSize: 30,color: Colors.black,fontWeight: FontWeight.bold),
        ),
        Padding(padding: EdgeInsets.only(top: 20)),
        SizedBox(
          width: 350,
          child: Text(
            'Selamat Datang pengguna baru, rasakan sensai liburan ke Jepang bersama keluarga dengan penawaran yang sangat baik',
            style: TextStyle(fontSize: 18, color: Colors.black54),
            ),
        ),
        SizedBox(height: 70),
      ],
    );
  }
}
class Page2 extends StatefulWidget {
  const Page2({super.key});

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Padding(padding: EdgeInsets.only(top: 20)),
        Text(
          "Japan",
          style: TextStyle(fontSize: 30,color: Colors.black,fontWeight: FontWeight.bold),
        ),
        Padding(padding: EdgeInsets.only(top: 20)),
        SizedBox(
          width: 350,
          child: Text(
            'Jepang merupakan negara yang dikenal sebagai negeri sakura, karena sakura adalah bunga khas Jepang. Bunga sakura melambangkan keindahan ',
            style: TextStyle(fontSize: 18, color: Colors.black54),
            ),
        ),
        SizedBox(height: 90),
      ],
    );
  }
}
class Page3 extends StatefulWidget {
  const Page3({super.key});

  @override
  State<Page3> createState() => _Page3State();
}

class _Page3State extends State<Page3> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Padding(padding: EdgeInsets.only(top: 20)),
        Text(
          "Fuji Mountain",
          style: TextStyle(fontSize: 30,color: Colors.black,fontWeight: FontWeight.bold),
        ),
        Padding(padding: EdgeInsets.only(top: 20)),
        SizedBox(
          width: 350,
          child: Text(
            'Puncak tertinggi di Jepang adalah Gunung Fuji yang tingginya mencapai 3.776 m diatas permukaan laut.',
            style: TextStyle(fontSize: 18, color: Colors.black54),
            ),
        ),
        SizedBox(height: 110),
      ],
    );
  }
}