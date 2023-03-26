
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:section_15/main.dart';
import 'package:file_picker/file_picker.dart';
import 'package:open_file/open_file.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:intl/intl.dart';
import 'dart:io';



class AdvanceForm2 extends StatefulWidget {
  const AdvanceForm2({super.key});


  @override
  State<AdvanceForm2> createState() => _AdvanceForm2State();
}

// membuat class SoalPrioritas
class SoalPrioritas{
  String nama;
  String nomor;
  String datePicker;
  String colorPicker;
  String filePicker;


  SoalPrioritas({
    required this.nama,
    required this.nomor,
    required this.datePicker,
    required this.colorPicker,
    required this.filePicker,
  });
}

class _AdvanceForm2State extends State<AdvanceForm2> {
  var selectedIndex = -1;

  final formKey = GlobalKey<FormState>();

  // controler nama
  final _namaController = TextEditingController();

  // controler nama
  final _nomorController = TextEditingController();

  // list dengan instance class Soalprioritas
  List<SoalPrioritas> kontak = List.empty(growable: true);
  
  // membuat list dari instance color
  List<Color> _listColor = List.empty(growable: true);


  // controler date picker
  final _dateController = TextEditingController();
  DateTime _dueDate = DateTime.now();
  final currentDate = DateTime.now();

  // controler Color picker
  final _colorController = TextEditingController();
  Color _currentColor = Colors.orange;
  //show dialog untuk Color picker
  Future <void> _dialogBuilder(BuildContext context){
    return showDialog(
      context: context, 
      builder: (BuildContext context){
        return AlertDialog(
          title: const Text('Pick Your Color'),
          content: ColorPicker(
            pickerColor: _currentColor,
            onColorChanged: (color){
              setState(() {
                _currentColor = color;
                _colorController.text = color.toString();
              });
            },
          ),
          actions: <Widget> [
            TextButton(onPressed: (){
              Navigator.pop(context);
            }, child: const Text('Save',style: TextStyle(fontSize: 20),))
          ],
        );
      });
  }

  // controler file picker
  final _txtFilePicker = TextEditingController();
  void _pickfile() async {
    var filePickerVal;
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if(result != null){
      setState(() {
       _txtFilePicker.text = result.files.single.path.toString();
       filePickerVal = File(result.files.single.path.toString());
      });

    }
  }

  //variable untuk textstyle
  final fontstyle = const TextStyle(
    fontSize: 20,
  ); 
  



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Advance Form 2'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: <Widget>[

          Form(
            key: formKey,
            child: Column(
              children: <Widget>[
                const Icon(Icons.add_box,size: 50),
                const Padding(padding: EdgeInsets.all(10),
                child: Text('CREATE NEW CONTACS',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                ),
                Container(
                  child: Text(
                  'A dialog is a type of modal window that appears in front of app content to provide critical information, or prompt fo a decision to be made'
                ),
                width: 350,
                ),
                const Padding(padding: EdgeInsets.all(10)),

                // Input Nama Kontak
                TextFormField(
                  onTapOutside: (event) => FocusScope.of(context).unfocus(),
                  maxLength: 15,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp('[a-aA-z ]')),
                    ],
                    controller: _namaController,
                    textCapitalization: TextCapitalization.sentences,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Nama',
                      hintText: 'Nama'
                    ),
                    validator: (value){
                      if (value == null || value.isEmpty){
                        return 'Data Tidak Boleh Kosong';
                      }
                      else if(value.length < 2){
                        return 'Minimal 2 Karakter';
                      }
                      return null;
                    },
                  ),
                const Padding(padding: EdgeInsets.all(10)),

                // Input Nomor Telepon
                TextFormField(           
                  onTapOutside: (event) => FocusScope.of(context).unfocus(),
                  keyboardType: TextInputType.number,
                  maxLength: 15,     
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp('[0-9]')),
                  ],
                  controller: _nomorController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Nomor Telepon',
                    hintText: 'Nomor Telepon'
                  ),
                  validator: (value){
                    if (value == null || value.isEmpty){
                      return 'Data Tidak Boleh Kosong';
                    }
                    if(value.length < 8){
                      return 'Minimal 8 Digit';
                    }
                    return null;
                  },
                ),

                // Date Picker
                Padding(padding: EdgeInsets.only(bottom: 30)),
                buildDatePicker(context),

                // Color Picker
                Padding(padding: EdgeInsets.only(bottom: 30)),
                buildColorPicker(context),
                // File Picker
                Padding(padding: EdgeInsets.only(bottom: 30)),
                buildFilePicker(),

                const Padding(padding: EdgeInsets.all(10)),
                ],
            ),
          ),
          

          // Tombol untuk Submit
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget> [

              ElevatedButton(onPressed: (){
                  if (formKey.currentState!.validate()){
                    String name = _namaController.text.trim();
                    String nomor = _nomorController.text.trim();
                    String date = _dateController.text.trim();
                    String color = _colorController.text.trim();
                    String file = _txtFilePicker.text.trim();
                    setState(() {
                      if(selectedIndex  < 0){
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Kontak Telah Ditambah')),
                        );
                      
                        kontak.add(
                          SoalPrioritas(
                            nama: name,
                            nomor: nomor,
                            datePicker: date,
                            colorPicker: color,
                            filePicker: file,
                            ));
                        _listColor.add(_currentColor);
                      }
                      else{
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Kontak Telah Update')),
                        );
                        kontak[selectedIndex] =  SoalPrioritas(
                            nama: name,
                            nomor: nomor,
                            datePicker: date,
                            colorPicker: color,
                            filePicker: file,
                            );
                        _listColor[selectedIndex] = _currentColor;
                        selectedIndex = -1;

                      }
                      _namaController.text = '';
                      _nomorController.text = '';
                      _dateController.text = '';
                      _colorController.text = '';
                      _txtFilePicker.text = '';
                      FocusScope.of(context).unfocus();
                    });
                 
                }
              }, child: Text('Submit',style: TextStyle(fontWeight: FontWeight.bold),),style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                
                ),
              ),

            ],
          ),
          Padding(padding: EdgeInsets.only(bottom: 50)),
          Column(
            children: [
              if(kontak.isEmpty || kontak == null)...[
                Text('Anda Belum Menambahkan Kontak',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),textAlign: TextAlign.center,)
              ]
              else...[
              Padding(padding: EdgeInsets.all(15),
              child : Text('LIST CONTACS',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold)),
              ),

            for(int i = 0;i < kontak.length; i++) // perulangan untuk membuat List Contacs

            Padding(padding: EdgeInsets.all(15),
            child : Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  // Icon Avatar
                 CircleAvatar(
                    maxRadius: 30,
                    backgroundColor: _listColor[i],
                    foregroundColor: Colors.white,
                    child: Text(kontak[i].nama[0].capitalize(),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
                  ),
             

                  // Text Nama dan Nomor Telepon
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(kontak[i].nama.toString(),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                      Text(kontak[i].nomor.toString(),style: TextStyle(fontSize: 13,color: Color.fromARGB(134, 255, 255, 255))),
                      Text(kontak[i].datePicker.toString(),style: TextStyle(fontSize: 15,color: Colors.amber)),
                    ],
                  ),


                  // Icon Button
                  
                 Row(
                    children: 
                      [
                        IconButton(onPressed: (){
                          OpenFile.open(kontak[i].filePicker);

                        }, icon: Icon(Icons.open_in_new)),
                        IconButton(onPressed: () async {                          
                          _namaController.text = kontak[i].nama;
                          _nomorController.text = kontak[i].nomor;
                          _dateController.text = kontak[i].datePicker;
                          _colorController.text = kontak[i].colorPicker;
                          _txtFilePicker.text = kontak[i].filePicker;

                          setState(() {
                            selectedIndex = i;
                          });
                     
                      }, icon: Icon(Icons.edit),alignment: Alignment.center),


                      IconButton(onPressed: () async {
                      setState(() {
                      kontak.removeAt(i);
                      });
                      }, icon: Icon(Icons.delete_sharp),alignment: Alignment.center,),

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
    );
  }



  ////////////////////////////////
  

  // Date Picker
  Widget buildDatePicker(context) {
    return Padding(
      padding: const EdgeInsets.all(0),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
                onTapOutside: (event) => FocusScope.of(context).unfocus(),
                readOnly: true,
                controller: _dateController,
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Tanggal harus diisi';
                  } else {
                    return null;
                  }
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(5.0),
                      ),
                      borderSide: BorderSide(width: 2)),
                  hintText: 'Pilih Tanggal',
                  labelText: 'Tanggal',
                  contentPadding: EdgeInsets.all(10.0),
                ),
                style: const TextStyle(fontSize: 16.0),
                onTap: () async {
                   DateTime? selectDate = await showDatePicker(
                        context: context, 
                        initialDate: currentDate, 
                        firstDate: DateTime(1990), 
                        lastDate: DateTime(currentDate.year + 5)
                        );
                        if(selectDate != null){
                          print(selectDate);
                          String formatDate = DateFormat('dd-MM-yyyy').format(selectDate);
                          setState(() {
                            _dateController.text = formatDate;
                          });
                        }
                        else{
                          print('Belum Mengisi Tanggal');
                        }
                },
                ),
          ),
          const SizedBox(width: 5),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Colors.lightBlue,
                  minimumSize: const Size(70, 48),
                  maximumSize: const Size(70, 48)),
              onPressed: ()async {
                 DateTime? selectDate = await showDatePicker(
                        context: context, 
                        initialDate: currentDate, 
                        firstDate: DateTime(1990), 
                        lastDate: DateTime(currentDate.year + 5)
                        );
                        if(selectDate != null){
                          print(selectDate);
                          String formatDate = DateFormat('dd-MM-yyyy').format(selectDate);
                          setState(() {
                            _dateController.text = formatDate;
                          });
                        }
                        else{
                          print('Belum Mengisi Tanggal');
                        }
              },
              child: const Icon(
                Icons.calendar_month,
                color: Colors.white,
                size: 24.0,
              ))
        ],
      ),
    );
  }

  //file picker

  Widget buildFilePicker() {
    return Padding(
      padding: const EdgeInsets.all(0),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
                onTapOutside: (event) => FocusScope.of(context).unfocus(),
                readOnly: true,
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'File harus diupload';
                  } else {
                    return null;
                  }
                },
                controller: _txtFilePicker,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(5.0),
                      ),
                      borderSide: BorderSide(color: Colors.white, width: 2)),
                  hintText: 'Upload File',
                  labelText: 'File',
                  contentPadding: EdgeInsets.all(10.0),
                ),
                style: const TextStyle(fontSize: 16.0),
                onTap: () {
                  _pickfile();
                },
                ),
          ),
          const SizedBox(width: 5),
          ElevatedButton.icon(
            icon: const Icon(
              Icons.upload_file,
              color: Colors.white,
              size: 24.0,
            ),
            label: const Text('Pilih File', style: TextStyle(fontSize: 16.0)),
            onPressed: () {
              _pickfile();
            },
            style: ElevatedButton.styleFrom(
              primary: Colors.lightBlue,
              minimumSize: const Size(122, 48),
              maximumSize: const Size(122, 48),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
            ),
          ),
        ],
      ),
    );
  }

  //Color Picker

  Widget buildColorPicker (BuildContext context){
    return Padding(
      padding: EdgeInsets.all(0),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
                controller: _colorController,
                 autocorrect: false,
                 autofocus: true,
                 readOnly: true,
                 validator: (String? value){
                  if(value == null || value.isEmpty){
                    return 'Data Tidak Boleh Kosong';
                  } else{
                    return null;
                  }
                 },
                 decoration: InputDecoration(
                   icon: CircleAvatar(backgroundColor: _currentColor,maxRadius: 30,),
                   border: OutlineInputBorder(),
                   hintText: 'Pick Color',
                   labelText: 'Warna',
                  ),
                onTap: () {
                    _dialogBuilder(context);
                  },
                ),
            )
        ],

      ),
    
    );
  }
}