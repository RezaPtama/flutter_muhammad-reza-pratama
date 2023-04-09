import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:section_13/halaman/addAdvance.dart';
import 'package:open_file/open_file.dart';
import 'package:section_13/main.dart';


class TaskManagerForm with ChangeNotifier {
  final _taskModelsForm = <TaskFormModel>[];
  List<TaskFormModel> get taskModels => List.unmodifiable(_taskModelsForm);

  void deleteTask(int index){
    _taskModelsForm.removeAt(index);
    notifyListeners();
  }

  void addTask(TaskFormModel task){
    _taskModelsForm.add(task);
    notifyListeners();
  }
  
  void updateTask(TaskFormModel task,int index){
    _taskModelsForm[index] = task;
    notifyListeners();
  }
}

class TaskFormModel{
  final String id;
  final String nama;
  final String nomor;
  final String datePicker;
  final Color colorPicker;
  final String filePicker;

  TaskFormModel({
    required this.id,
    required this.nama,
    required this.nomor,
    required this.datePicker,
    required this.colorPicker,
    required this.filePicker,
  });
}


class AdvanceForm2 extends StatefulWidget {
  const AdvanceForm2({super.key});

  @override
  State<AdvanceForm2> createState() => _AdvanceForm2State();
}


class _AdvanceForm2State extends State<AdvanceForm2> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        body: buildFormScreens(),
      ),
    );
  }

  Widget buildFormScreens(){
    return Consumer<TaskManagerForm>(
      builder: (context, manager, child){
        if(manager.taskModels.isNotEmpty){
          return DataDiri(manager: manager);
        }else{
          return const EmptyForm();
        }

      },
    );
  }
}


// data diri
class DataDiri extends StatefulWidget {
  final TaskManagerForm manager;
  const DataDiri({Key?key,required this.manager}) : super(key: key);

  @override
  State<DataDiri> createState() => _DataDiriState();
}

class _DataDiriState extends State<DataDiri> {

  // membuat list dari instance color
  List<Color> _listColor = List.empty(growable: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: widget.manager.taskModels.length,
        itemBuilder: (contex,index){
          return Column(
                children: [

                Padding(padding: const EdgeInsets.all(15),
                child : Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      // Icon Avatar
                     CircleAvatar(
                        maxRadius: 30,
                        backgroundColor: widget.manager.taskModels[index].colorPicker,
                        foregroundColor: Colors.white,
                        child: Text(widget.manager.taskModels[index].nama[0].capitalize(),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
                      ),
                 

                      // Text Nama dan Nomor Telepon
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(widget.manager.taskModels[index].nama,style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                          Text(widget.manager.taskModels[index].nomor,style: const TextStyle(fontSize: 13,color: Color.fromARGB(134, 255, 255, 255))),
                          Text(widget.manager.taskModels[index].datePicker,style: const TextStyle(fontSize: 15,color: Colors.amber)),
                        ],
                      ),


                      // Icon Button
                     Row(
                        children: 
                          [
                            // Open File
                            IconButton(onPressed: (){
                              OpenFile.open(widget.manager.taskModels[index].filePicker);

                            }, icon: const Icon(Icons.open_in_new)),

                            // Edit Item
                            IconButton(onPressed: () async {
                            final item = widget.manager;
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => AddAdvance(
                                    onCreate: (task){
                                      item.updateTask(task, index);
                                      Navigator.pop(context);
                                    },
                                    manager: item,
                                    selectedIndex: index,
                                  )
                                )
                                );

                         
                          }, icon: const Icon(Icons.edit),alignment: Alignment.center),

                          // Hapus Item
                          IconButton(onPressed: () async {
                          showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            content: const Text('Delete Contact ?'),
                            actions: [
                              // YES BUTTON
                              TextButton(
                                onPressed: (){
                                  widget.manager.deleteTask(index);
                                  Navigator.pop(context);
                                  setState(() {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(content: Text('Kontak Telah Di Hapus')),
                                    );
                                  });
                                },
                                 child: const Text('YES')
                              ),
                              // NO
                              TextButton(
                                onPressed: (){
                                  Navigator.pop(context);
                                },
                                 child: const Text('NO')
                              ),
                            ],
                          ),
                        );
                          }, icon: const Icon(Icons.delete_sharp),alignment: Alignment.center,),

                        ],
                      ),

                    ],
                  ),
                ),
                ),
              ]
              );
            },

      ),
      floatingActionButton: BuildAddForms(),
    );
  }

    Widget BuildAddForms(){
      return FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: (){
          final manager = Provider.of<TaskManagerForm>(context,listen: false);
          Navigator.of(context).push(
            PageRouteBuilder(
              pageBuilder: (context,animation,secondaryAnimation) => AddAdvance
              (
                onCreate: (task){
                  manager.addTask(task);
                  Navigator.pop(context);
                },
                selectedIndex: -1,
                manager: manager,
              ),
              transitionsBuilder: (context, animation, secondaryAnimation, child){
                final tween = Tween(begin: const Offset(0, .5),end: Offset.zero);

                return SlideTransition(
                  position: animation.drive(tween),
                  child: child);
              },
            )
          );
        },
        child: Icon(Icons.add),
      );
  }
}








// empty form
class EmptyForm extends StatefulWidget {
  const EmptyForm({super.key});

  @override
  State<EmptyForm> createState() => _EmptyFormState();
}

class _EmptyFormState extends State<EmptyForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const  [
            Icon(Icons.no_accounts,size: 100),
            Padding(padding: EdgeInsets.all(10)),
            Text('Data Masih Kosong',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
          ],
        ),
      ),
      floatingActionButton: BuildAddForms(),
    );
  }
  
  Widget BuildAddForms(){
      return FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: (){
          final manager = Provider.of<TaskManagerForm>(context,listen: false);
          Navigator.of(context).push(
            PageRouteBuilder(
              pageBuilder: (context,animation,secondaryAnimation) => AddAdvance
              (
                onCreate: (task){
                  manager.addTask(task);
                  Navigator.pop(context);
                },
                selectedIndex: -1,
                manager: manager,
              ),
              transitionsBuilder: (context, animation, secondaryAnimation, child){
                final tween = Tween(begin: const Offset(0, .5),end: Offset.zero);

                return SlideTransition(
                  position: animation.drive(tween),
                  child: child);
              },
            )
          );
        },
        child: const Icon(Icons.add),
      );
  }
}