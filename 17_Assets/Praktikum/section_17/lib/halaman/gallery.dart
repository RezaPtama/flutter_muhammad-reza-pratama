import 'package:flutter/material.dart';
import 'package:section_13/halaman/newImage.dart';
import 'package:section_13/main.dart';


class Gambar{
  final String gambar;
  final String name;

  Gambar({required this.gambar,required this.name});
  
}
class ItemImages {
  List<Gambar> itemGambar = [
    Gambar(gambar: "assets/gambar/pavilion.jpg",name: "Pavilion Gaming"),
    Gambar(gambar: "assets/gambar/supreme.png", name: "Supreme"),
    Gambar(gambar: "assets/gambar/taman.jpg",   name: "Heaven Garden "),
    Gambar(gambar: "assets/gambar/tropers.png", name: "Strom Tropers"),
    Gambar(gambar: "assets/gambar/pavilion.jpg",name: "Pavilion Gaming"),
    Gambar(gambar: "assets/gambar/supreme.png", name:  "Supreme"),
    Gambar(gambar: "assets/gambar/taman.jpg",   name: "Heaven Garden "),
    Gambar(gambar: "assets/gambar/tropers.png", name: "Strom Tropers"),
    Gambar(gambar: "assets/gambar/pavilion.jpg",name: "Pavilion Gaming"),
    Gambar(gambar: "assets/gambar/supreme.png", name:  "Supreme"),
    Gambar(gambar: "assets/gambar/taman.jpg",   name: "Heaven Garden "),
    Gambar(gambar: "assets/gambar/tropers.png", name: "Strom Tropers"),
  ];
}


class Gallery extends StatefulWidget {
  const Gallery({super.key});


  @override
  State<Gallery> createState() => _GaleryState();
}

class _GaleryState extends State<Gallery> {
  ItemImages a = ItemImages();

  Future <void> dialogBuilder(BuildContext context, int index){
    return showDialog(
      context: context,
       builder: (BuildContext context){
        return AlertDialog(
          title: Text('Gambar'),
          content: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: const[
              Text('Membuka Gambar Pada Halaman Baru ?'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: (){
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => NewImage(gambar: [a.itemGambar[index].gambar,a.itemGambar[index].name])),
                  );  
              },
               child: Text('IYA')
            ),

            TextButton(
              onPressed: (){
                Navigator.pop(context);
              },
               child: Text('TIDAK')
            ),
          ],
          

        );
       }
    );
  }

  // Modal Bottom Sheet
  void modalBottom (int index){
    showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25))
      ),
      context: context,
       builder: (BuildContext context){
        return SizedBox(
          height: double.infinity,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: <Widget> [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(padding: const EdgeInsets.all(10),
                    child: IconButton(
                      onPressed: (){
                        Navigator.pop(context);
                      },
                    icon: const Icon(Icons.close)),
                    ),
                  ],
                ),
                const Padding(padding: EdgeInsets.all(20)),
                InkWell(
                  onTap: () {
                    dialogBuilder(context,index);
                  },
                  child: Image(image: AssetImage(a.itemGambar[index].gambar)),
                ),
                const Padding(padding: EdgeInsets.all(15)),
                Text(a.itemGambar[index].name,style: const TextStyle(fontSize: 25,fontWeight: FontWeight.bold),)
              ],
            ),
          ),
        );
       }
       );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
        ),
        padding: const EdgeInsets.all(10),
        primary: false,
        itemCount:a.itemGambar.length,
        itemBuilder: (context,index){
          return GestureDetector(
            child: InkWell(
              onTap: () {
                modalBottom(index);
              },
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(a.itemGambar[index].gambar)
                  )
                ),
              ),
            )
          );
        }
      ),
      drawer: const BuildDrawer(),
    );
  }
}