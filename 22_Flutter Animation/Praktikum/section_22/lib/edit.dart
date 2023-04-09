import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:open_file/open_file.dart';
import 'package:intl/intl.dart';
import 'dart:io';

// class untuk data List
class SubmitForm{
  String datePicker;
  String colorPicker;
  String filePicker;

  SubmitForm({
    required this.datePicker,
    required this.colorPicker,
    required this.filePicker,
  });
}


class AdvanceForm extends StatefulWidget {
  const AdvanceForm({super.key});

  @override
  State<AdvanceForm> createState() => AdvanceFormState();
}

class AdvanceFormState extends State<AdvanceForm> {
  final formKey = GlobalKey<FormState>(); 

  // date Picker controller
  final _dateController = TextEditingController();
  DateTime _dueDate = DateTime.now();
  final currentDate = DateTime.now();
  
  // Color Picker controller 
  final _colorController = TextEditingController();
  Color _currentColor = Colors.orange;
  
  // showDialog untuk Color Picker
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

  // file picker controller
  final _txtFilePicker = TextEditingController();
  // fungsi pickfile
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


  // List dari submit Form 
  List<SubmitForm> submitFrom = List.empty(growable: true);

  // variable untuk textStyle
  final fontstyle = const TextStyle(
    fontSize: 20,
  ); 
  
  



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Interactive Widgets"),
      ),

      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget> [

                  // Date Picker
                  Padding(padding: EdgeInsets.only(bottom: 15,top: 15),
                  child: Text('Pilih Tanggal',style: fontstyle,)),
                  buildDatePicker(context),

                  // Color picker 
                  Padding(padding: EdgeInsets.only(bottom: 15,top: 15),
                  child: Text('Pilih Warna',style: fontstyle,)),
                  buildColorPicker(context),
                  
                  //File picker
                  Padding(padding: EdgeInsets.only(bottom: 15,top: 15),
                  child: Text('Pilih File',style: fontstyle,)),
                  buildFilePicker(),

                  Padding(padding: EdgeInsets.only(bottom: 30)),


                  // Tombol Submit
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: 
                      [
                       ElevatedButton(
                        onPressed: (){
                        if(formKey.currentState!.validate()){
                        setState(() {
                          submitFrom.add(SubmitForm // menambahkan List dari controller
                          (datePicker: _dateController.text,
                           colorPicker: _colorController.text,
                          filePicker: _txtFilePicker.text));
                        });
                        }
                      },
                      child: Text("Submit",style: fontstyle)),
                    ],
                  ),

                  // Menampilkan Value dari date , color, dan file
                  Padding(padding: EdgeInsets.only(bottom: 30)),
                  if(submitFrom.isEmpty)...[ // jika List submitfrom kosong
                    Text('')
                  ]else...[ //lainnya
                  
                  Text ('Anda Memilih Tanggal',style: fontstyle,),
                  Padding(padding: EdgeInsets.only(bottom: 10)),
                  Text ('${submitFrom[0].datePicker}',style: fontstyle,),
                  Padding(padding: EdgeInsets.only(bottom: 10)),
                    Text('Anda Memilih Warna ',style: fontstyle,),
                  Padding(padding: EdgeInsets.only(bottom: 10)),

                    CircleAvatar(
                    backgroundColor: _currentColor,
                    maxRadius: 20,
                    ),

                  
                  Padding(padding: EdgeInsets.only(bottom: 10)),
                  Text("File Anda ",style: fontstyle,),

                  ElevatedButton.icon(
                      onPressed: (){
                        OpenFile.open(submitFrom[0].filePicker);
                      },
                      icon: Icon(Icons.open_in_new),
                      label: Text("OpenFile")),
                  ],

                ]
              )
            )
  
              
          ),
        ],
      ),
    );
  }




///////////////////////////////////////////////////////////////




  //Builder Widget

  // Build widget Date Picker
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
                  hintText: 'DD-MM-YYYY',
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

  // Build widget file picker

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

  //build widget Color Picker

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