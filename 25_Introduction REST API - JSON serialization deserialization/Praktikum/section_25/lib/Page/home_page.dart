import 'package:flutter/material.dart';
import 'package:section_25/Page/soal_eksplorasi.dart';
import 'package:section_25/Page/soal_prioritas1.dart';
import 'package:section_25/Page/soal_prioritas2.dart';

class Dashboard extends StatefulWidget {
  final String firstname;
  final String lastname;
  final String image;
  const Dashboard({
    Key? key,
    required this.firstname,
    required this.lastname,
    required this.image
    }) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Selamat Datang"),
        centerTitle: true,
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget> [
              CircleAvatar(
                backgroundColor: Colors.black,
                backgroundImage: NetworkImage(widget.image),
                foregroundColor: Colors.black,
                radius: 75,
              ),
              Padding(padding: EdgeInsets.all(10)),
       
            Text("Hallo Selamat Datang\n ${widget.firstname} ${widget.lastname}",textAlign: TextAlign.center,style: TextStyle(fontSize: 30),),
            ElevatedButton(
              onPressed: (){
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => SoalPrioritas1())
                );
              }, 
              child: Text("Soal Prioritas 1")),
            ElevatedButton(
              onPressed: (){
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => SoalPrioritas2())
                );
              }, 
              child: Text("Soal Prioritas 2")),
            ElevatedButton(
              onPressed: (){
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => SoalEksplorasi())
                );
              }, 
              child: Text("Soal Eksplorasi")),
          ],
        ),
      ),
    );
  }
}
