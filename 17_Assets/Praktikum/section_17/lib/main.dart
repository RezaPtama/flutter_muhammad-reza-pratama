
import 'package:flutter/material.dart';
import 'package:section_13/halaman/advanceForm.dart';
import 'halaman/contacs.dart';
import 'halaman/gallery.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(const MyApp());
}

extension StringExtension on String {
    String capitalize() {
      return "${this[0].toUpperCase()}${this.substring(1).toLowerCase()}";
    }
}

class TaskManager with ChangeNotifier {
  final _taskModels = <TaskModel>[];
  List<TaskModel> get taskModels => List.unmodifiable(_taskModels);

  void deleteTask(int index){
    _taskModels.removeAt(index);
    notifyListeners();
  }

  void addTask(TaskModel task){
    _taskModels.add(task);
    notifyListeners();
  }
  
  void updateTask(TaskModel task,int index){
    _taskModels[index] = task;
    notifyListeners();
  }
}

class TaskModel {
  final String id;
  late final String nama;
  late final String nomor;
  

  TaskModel({required this.id,required this.nama,required this.nomor});
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => TaskManager()),
        ChangeNotifierProvider(
          create: (context) => TaskManagerForm()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData.dark(
        ),
        home: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int _selectedIndex = 0;
 

  final PageStorageBucket _bucket = PageStorageBucket();

  void _OnTapIndex(int index){
    setState(() {
      _selectedIndex = index;
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title : _selectedIndex == 0 ? Text("Contacts") : _selectedIndex == 1 ? Text('Data Diri') : Text('Galery'),
      ),
      body: PageStorage(
        bucket: _bucket,
        child: buildContactsScreen(),
      ),
      
      drawer: const BuildDrawer(),
      bottomNavigationBar: BuildBottomNavigation(context),
       
    );
  }

  // screen contacs
  Widget buildContactsScreen(){
    return Consumer<TaskManager>(
      builder: (context, manager, child){
      if(_selectedIndex == 0){
        if(manager.taskModels.isNotEmpty){
          return Contacs(manager: manager);
        }else{
          return const EmptyContacs();
        }
      }
      else{
        return Gallery();
      }
      },
    );
  }

  // Builder Bottom Navigation
  Widget BuildBottomNavigation (BuildContext context){
    return BottomNavigationBar(
      selectedItemColor: Colors.blue,
      showSelectedLabels: true,
      showUnselectedLabels: false,
      iconSize: 30,
          items: const <BottomNavigationBarItem> [
            BottomNavigationBarItem(icon: Icon(Icons.phone),label: 'Contacs',),
            // BottomNavigationBarItem(icon: Icon(Icons.person),label: 'Data Diri',),
            BottomNavigationBarItem(icon: Icon(Icons.photo),label: 'Gallery'),
          ],
          currentIndex: _selectedIndex,
          onTap: (int index){
            setState(() {
              _selectedIndex = index;
            });
          },
        );
  }


}


// Drawer
class BuildDrawer extends StatefulWidget {
  const BuildDrawer({super.key});

  @override
  State<BuildDrawer> createState() => _BuildDrawerState();
}

class _BuildDrawerState extends State<BuildDrawer> {
  @override
  Widget build(BuildContext context) {
      return SafeArea(
        child: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget> [
              
              // Home
              ListTile(
                onTap: () {
                  Navigator.pop(context);
                },
                title : Row(
                  children: const <Widget>[
                    Icon(Icons.home),
                    Padding(padding: EdgeInsets.only(left: 20)),
                    Text('Home'),
                  ],
                ),
              ),
              // Settings
              ListTile(
                onTap: () {
                  Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const AdvanceForm2()));
                },
                title : Row(
                  children: const <Widget>[
                    Icon(Icons.widgets),
                    Padding(padding: EdgeInsets.only(left: 20)),
                    Text('Form Data Diri'),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
  }
}