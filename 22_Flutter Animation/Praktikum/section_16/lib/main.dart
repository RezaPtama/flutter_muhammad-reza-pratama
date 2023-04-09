
import 'package:flutter/material.dart';
import 'package:section_15/edit.dart';
import 'package:section_15/kontak.dart';
import 'package:flutter/services.dart';
import 'package:section_15/soalPrioritas.dart';

void main() {
  runApp(const MyApp());
}

// extension untuk mendapatkan huruf kapital pertama
extension StringExtension on String {
    String capitalize() {
      return "${this[0].toUpperCase()}${this.substring(1).toLowerCase()}";
    }
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contacs',
      theme: ThemeData.dark(),
      home: const MyHomePage(title: 'Contacs',),
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
  final formKey = GlobalKey<FormState>(); // formKey untuk menyimpan value
  final _namaController = TextEditingController(); // controller untuk nama
  final _nomorController = TextEditingController(); // controller untuk nomor telepon
  var selectedIndex = -1;

   List<ListContacs> kontak = List.empty(growable: true); // List dengan mengambil data dari class ListContacs 



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.all(10),
        children: <Widget>[

          Form( // menggunakan widget Form
            key: formKey, // memanggil variabel formKey
            child: Column( // agar widget berkolom
              children: <Widget>[
                const Icon(Icons.add_box,size: 50), // icon
                const Padding(padding: EdgeInsets.all(10), // spasi padding
                child: Text('CREATE NEW CONTACS',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),textAlign: TextAlign.center,), // Text
                ),
                Container( // untuk membuat box
                  child: Text(
                'A dialog is a type of modal window that appears in front of app content to provide critical information, or prompt fo a decision to be made'
                ),
                width: 350 // mendeklrasikan ukuran dari container
                ),
                const Padding(padding: EdgeInsets.all(10)),

                // Input Nama Kontak
                TextFormField(
                  onTapOutside: (event) => FocusScope.of(context).unfocus(),
                  maxLength: 15, // deklarasikan panjang karakter
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp('[a-aA-z ]')), // keyboard mengasih akses hanya a-z dan spasi
                    ],
                    controller: _namaController, // memanggil controller nama
                    textCapitalization: TextCapitalization.sentences, // agar keyboard huruf pertama kapital
                    // Dekorasi Text Field
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Nama',
                      hintText: 'Nama'
                    ),
                    //validator dari Input Nama Kontak
                    validator: (value){
                      if (value == null || value.isEmpty){ // jika text field kosong
                        return 'Data Tidak Boleh Kosong';
                      }
                      else if(value.length < 2){ // jika text field kurang dari 2 karakter
                        return 'Minimal 2 Karakter';
                      }
                      return null;
                    },
                  ),

                const Padding(padding: EdgeInsets.all(10)),


                // Input Nomor Telepon
                TextFormField(           
                  onTapOutside: (event) => FocusScope.of(context).unfocus(),
                  keyboardType: TextInputType.number, // keyboard nomor saja
                  maxLength: 15, // deklarasikan panjang karakter
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp('[0-9]')), // keyboard hanya mengasih akses untuk mengetikan angka 0-9 
                  ],
                  controller: _nomorController, // controller dari nomor telepon
                  // dekorasi dari text field
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Nomor Telepon',
                    hintText: 'Nomor Telepon'
                  ),
                  validator: (value){ // validator 
                    if (value == null || value.isEmpty){ // jika value kosong
                      return 'Data Tidak Boleh Kosong';
                    }
                    if(value.length < 8){ // jika panjang value kurang dari 8 karakter
                      return 'Minimal 8 Digit';
                    }
                    return null;
                  },
                ),
          
          
          
                const Padding(padding: EdgeInsets.all(10)),
                ],
            ),
          ),
          
          // Tombol Submit
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget> [

              
              // Menggunakan button timbul
              ElevatedButton(onPressed: (){
                  if (formKey.currentState!.validate()){ // mengambil validasi dari validator
                    String name = _namaController.text.trim();
                    String nomor = _nomorController.text.trim();
                    setState(() {
                      if(selectedIndex  < 0){ // jika index yang dipilih kurang dari 0
                        ScaffoldMessenger.of(context).showSnackBar( //menampilkan snackbar dibawah
                          const SnackBar(content: Text('Kontak Telah Ditambah')),
                        );
                      
                        kontak.add(ListContacs(nama: name,nomor: nomor)); // menambahkan value dari list kontak
                      }
                      else{
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Kontak Telah Update')),
                        );
                        kontak[selectedIndex] = (ListContacs(nama: name,nomor: nomor)); // untuk mengupdate data yang berada di list kontak
                        selectedIndex = -1; // mendeklrasikan kembali variabel kembali ke awal

                      }
                      _namaController.text = ''; // controller menjadi kosong
                      _nomorController.text = ''; // controller menjadi kosong
                      FocusScope.of(context).unfocus();
                    });
                 
                }
              }, child: Text('Submit',style: TextStyle(fontWeight: FontWeight.bold),),style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                
                ),
              ),

            ]
          ),
          Padding(padding: EdgeInsets.only(bottom: 50)),



          // LIST KONTAK
 
          Column( // menggunakan kolum agar bisa kebawah
            children: [
              if(kontak.isEmpty || kontak == null)...[ // jika List kontak kosong 
                Text('Anda Belum Menambahkan Kontak',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),textAlign: TextAlign.center,)
              ]
              else...[ // lainnya
              Padding(padding: EdgeInsets.all(15),
              child : Text('LIST CONTACS',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold)),
              ),

            
            for(int i = 0;i < kontak.length; i++) // perulangan untuk membuat List Contacs

            // widge List Contacs
            Padding(padding: EdgeInsets.all(15), // menggunakan padding agar ada spasi antara index
            child : Container( // menggunakan container
              child: Row( // menggunakan row agar bisa sebaris
                mainAxisAlignment: MainAxisAlignment.spaceBetween, // agar widget bisa memenuhi align
                children: [

                  // Icon Avatar bulat
                 CircleAvatar( // menggunakan Circle avatar
                    maxRadius: 30, // ukuran
                    backgroundColor: i%2==1 ?Colors.deepOrange : Colors.orangeAccent,// mendeklarsikan 2 background color
                    foregroundColor: Colors.white, 
                    child: Text(kontak[i].nama[0].capitalize(),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),), // mengambil huruf awalan dari nama
                  ),
             
                  

                  // Text Nama dan Nomor Telepon
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(kontak[i].nama.toString(),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),), // mengambil dari List kontak
                      Text(kontak[i].nomor.toString(),style: TextStyle(fontSize: 18,color: Color.fromARGB(134, 255, 255, 255)),) // mengambil dari List kontak
                    ],
                  ),


                  // Icon Button edit dan hapus
                 Row(
                    children: 
                      [
                        IconButton(onPressed: () async { // menggunakan icon button                          
                          _namaController.text = kontak[i].nama; //agar controller terisi dari index yang di pencet
                          _nomorController.text = kontak[i].nomor;

                          setState(() {
                            selectedIndex = i; // agar selectedIndex dari index List kontak
                          });
                     
                      }, icon: Icon(Icons.edit),alignment: Alignment.center), // menggunakan icon edit


                      IconButton(onPressed: () async {
                      setState(() {
                      kontak.removeAt(i); // untuk menghapus index List kontak yang dipilih
                      });
                      }, icon: Icon(Icons.delete_sharp),alignment: Alignment.center,), // menggunakan icon delete

                    ],
                  ),

                ],
              ),
            ),
            ),
          ]

            ],
          )
        ],
      ),

      // menggunakan drawer agar bisa ke route lain
      drawer: SafeArea(
        child: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              
              // Home
              ListTile(
                onTap: () {
                  Navigator.pop(context);
                },
                title: Row(
                  children: const [
                    Icon(Icons.home),
                    Padding(padding: EdgeInsets.only(left: 20)),
                    Text('Form'),
                  ],
                ),
              ),

              // advance form 1
              ListTile(
                onTap: (){
                  Navigator.of(context).push(
                    PageRouteBuilder(
                      pageBuilder: (context,animation,secondaryAnimation){
                        return const AdvanceForm();
                      },
                      transitionsBuilder: (context, animation, secondaryAnimation, child){
                        final tween = Tween(begin: const Offset(0, .5),end: Offset.zero);

                        return SlideTransition(
                          position: animation.drive(tween),child: child);
                      },
                      ),
                    );
                },
                title: Row(
                  children: const [
                    Icon(Icons.widgets),
                    Padding(padding: EdgeInsets.only(left: 20)),
                    Text('Advance Form'),
                  ],
                ),
              ),

              //advance form 2
              ListTile(
                onTap: (){
                  Navigator.of(context).push(
                    PageRouteBuilder(
                      pageBuilder: (context,animation,secondaryAnimation){
                        return const AdvanceForm2();
                      },
                      transitionsBuilder: (context, animation, secondaryAnimation, child){
                        final tween = Tween(begin: 0.0,end: 1.0);

                        return ScaleTransition(
                          scale: animation.drive(tween),child: child);
                      },
                      ),
                    );
                },
                title: Row(
                  children: const [
                    Icon(Icons.now_widgets),
                    Padding(padding: EdgeInsets.only(left: 20)),
                    Text('Advance Form 2'),
                  ],
                ),
              )


            ],
          ),
        ),

      ),
    );
  }
}