import 'package:flutter/material.dart';
import 'package:section_13/halaman/gallery.dart';

class NewImage extends StatefulWidget {
  const NewImage({super.key,required this.gambar});
  final List gambar;

  @override
  State<NewImage> createState() => _NewImageState();
}

class _NewImageState extends State<NewImage> {
  @override

  Widget build(BuildContext context) {
    ItemImages a = ItemImages();
    return Scaffold(
      appBar: AppBar(
        title: Text('Gambar')),

      body: ListView(
        padding: EdgeInsets.all(10),
        children: [
          Container(
            margin: EdgeInsets.all(30),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget> [
              Text(widget.gambar[1],style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
              Padding(padding: EdgeInsets.all(30)),
              Image(
                width: double.infinity,
                image: AssetImage(widget.gambar[0])
                ),

            ],
          )
        ],
      )

    );
  }
}