

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:intl/intl.dart';
import 'package:section_13/main.dart';
import 'package:uuid/uuid.dart';
import 'dart:io';
import 'advanceForm.dart';



class AddAdvance extends StatefulWidget {
  final Function(TaskFormModel) onCreate;
  final TaskManagerForm manager;
  final selectedIndex;
  const AddAdvance({
    Key ? key,
    required this.manager,
    required this.selectedIndex,
    required this.onCreate,
    }) : super(key: key);


  @override
  State<AddAdvance> createState() => _AddAdvanceState();
}




class _AddAdvanceState extends State<AddAdvance> {
  var selectedIndex = -1;

  final formKey = GlobalKey<FormState>();

  // controler nama
  final _namaController = TextEditingController();

  // controler nama
  final _nomorController = TextEditingController();

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
  
  String _taskName = '';
  String _taskNomor = '';
  String _taskDatePicker = '';
  String _taskColorPicker = '';
  String _taskFilePicker = '';

  // initstate
   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _namaController.addListener((){
      setState(() {
        _taskName = _namaController.text;        
      });
    });
    _nomorController.addListener((){
      setState(() {
        _taskName = _nomorController.text;        
      });
    });
    _colorController.addListener((){
      setState(() {
        _taskColorPicker = _colorController.text;        
      });
    });
    _dateController.addListener((){
      setState(() {
        _taskDatePicker = _dateController.text;        
      });
    });
    _txtFilePicker.addListener((){
      setState(() {
        _taskFilePicker = _txtFilePicker.text;        
      });
    });

    if(widget.selectedIndex < 0){
    }
    else{
      _namaController.text = widget.manager.taskModels[widget.selectedIndex].nama;
      _nomorController.text = widget.manager.taskModels[widget.selectedIndex].nomor;
      _colorController.text = widget.manager.taskModels[widget.selectedIndex].colorPicker.toString();
      _dateController.text = widget.manager.taskModels[widget.selectedIndex].datePicker;
      _txtFilePicker.text = widget.manager.taskModels[widget.selectedIndex].filePicker;
    }
  }

//dispose
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _namaController.dispose();
    _nomorController.dispose();
    _colorController.dispose();
    _dateController.dispose();
    _txtFilePicker.dispose();
  }



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
          
          //form
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
                final taskItem = TaskFormModel(
                  id: const Uuid().v1(),
                  nama: _namaController.text.capitalize(),
                  nomor: _nomorController.text,
                  datePicker: _dateController.text,
                  colorPicker: _currentColor,
                  filePicker: _txtFilePicker.text,
                );
                widget.onCreate(taskItem);
                setState(() {
                  if(widget.selectedIndex < 0){
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Data Telah Di Tambah')),
                    );
                  }else{
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Data Telah Di Update')),
                    );
                  }
                });
              }, child: Text('Submit',style: TextStyle(fontWeight: FontWeight.bold),),style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                
                ),
              ),

            ],
          ),
          Padding(padding: EdgeInsets.only(bottom: 50)),
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
                  labelText: 'Tangga Lahir',
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