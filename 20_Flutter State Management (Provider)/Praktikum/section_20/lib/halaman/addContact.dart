
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:section_13/main.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:uuid/uuid.dart';

class AddContacs extends StatefulWidget {
  final Function(TaskModel) onCreate;
  final TaskManager manager;
  final selectedIndex;
  const AddContacs({
    Key ? key,
    required this.onCreate,
    required this.selectedIndex,
    required this.manager,
  }) : super(key: key);

  @override
  State<AddContacs> createState() => _AddContacsState();
}

class _AddContacsState extends State<AddContacs> {
  final formKey = GlobalKey<FormState>();
  final _namaController = TextEditingController();
  final _nomorController = TextEditingController();
  // var selectedIndex = -1;
  // int _selectedIndex = 0;
  String _taskName = '';
  String _taskNomor = '';
  late final item = TaskManager();


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
    if(widget.selectedIndex < 0){
    }
    else{
      _namaController.text = widget.manager.taskModels[widget.selectedIndex].nama;
      _nomorController.text = widget.manager.taskModels[widget.selectedIndex].nomor;
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _namaController.dispose();
    _nomorController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Contacs'),
      ),
      body: ListView(
        children: [
          Form(
            key: formKey,
            child: Container(
              margin: EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget> [
            
                  const Padding(padding: EdgeInsets.only(top: 25)),
                  // icon
                  const Icon(Icons.add_box,size: 50),
                  const Padding(padding: EdgeInsets.all(10),
                  child: Text('CREATE NEW CONTACS',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),textAlign: TextAlign.center),
                  ),
            
                const SizedBox(
                  width: 350,
                  child: Text(
                  'A dialog is a type of modal window that appears in front of app content to provide critical information, or prompt fo a decision to be made'
                  )
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
                      textCapitalization: TextCapitalization.words,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Nama',
                        hintText: 'Nama'
                      ),
                      validator: (String? value){
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
                      else if(value.length < 11){
                        return 'Minimal 8 Digit';
                      }
                      else if(value[0] != '0'){
                        return 'Menggunakan angka 0 di depan';
                      }
                      return null;
                    },
                  ),
                const Padding(padding: EdgeInsets.all(10)),
            
                // Submit
                ElevatedButton(onPressed: (){
                  final taskItem = TaskModel(id: const Uuid().v1(),
                  nama: _namaController.text.capitalize(),
                  nomor: _nomorController.text);
                  widget.onCreate(taskItem);
                  setState(() {
                    if(widget.selectedIndex < 0){
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Kontak Telah Di Tambah')),
                      );
                    }else{
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Kontak Telah Di Update')),
                      );
                    }
                  });
                },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    ),
            
                  child: const Text('Submit',style: TextStyle(fontWeight: FontWeight.bold),),
                ),
            
            
                ],
              ),
            ),
          ),

        ],

      )
    );
  }
}
