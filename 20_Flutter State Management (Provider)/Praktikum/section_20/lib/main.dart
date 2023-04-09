
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
        title : _selectedIndex == 0 ? Text("Contacs") : _selectedIndex == 1 ? Text('Gallery') : Text('Data Diri'),
      ),
      body: PageStorage(
        bucket: _bucket,
        child: buildContactsScreen(),
      ),
      
      drawer: BuildDrawer(context),
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
      else if(_selectedIndex == 1){
        return Gallery();
      }
      else{
        return AdvanceForm2();
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
            BottomNavigationBarItem(icon: Icon(Icons.photo),label: 'Gallery'),
            BottomNavigationBarItem(icon: Icon(Icons.person),label: 'Data Diri',),
          ],
          currentIndex: _selectedIndex,
          onTap: (int index){
            setState(() {
              _selectedIndex = index;
            });
          },
        );
  }

    Widget BuildDrawer(BuildContext context){
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            // header
            Container(
              color: const Color.fromARGB(255, 34, 53, 109),
              padding: EdgeInsets.only(
                top: 24 + MediaQuery.of(context).padding.top,
                bottom: 24,
              ),
              child: Column(
                children: [
                  InkWell(
                    onTap: (){
                      DialogGambar();
                    },
                    child: const CircleAvatar(
                      backgroundImage: AssetImage("assets/gambar/tropers.png"),
                      radius: 52,
                      // backgroundColor: Colors.white70,
                      // child: Icon(Icons.add_a_photo),
                    ),
                  ),
                  const SizedBox(height: 12,),
                  Text("Muhammad Reza Pratama",style: const TextStyle(color: Colors.white,fontSize: 24,fontWeight: FontWeight.bold),),
                  Text("resapratama36@gmail.com",style: const TextStyle(color: Colors.white, fontSize: 18),),
                ],
              ),
            ),

            // menu items
            Container(
              padding: const EdgeInsets.all(15),
              child: Wrap(
                runSpacing: 8,
                children: [
                  ListTile(
                    leading: const Icon(Icons.home_outlined),
                    title: const Text('Home'),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: const Icon(Icons.person_outline_outlined),
                    title: const Text('Profile'),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: const Icon(Icons.favorite_border_outlined),
                    title: const Text('Contacts'),
                    onTap: () {
                      Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AdvanceForm2())
                      );
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.settings_outlined),
                    title: const Text('Settings'),
                    onTap: () {},
                  ),
                ],
              ),
            ),
            
          ],
        ),
      ),
    );
  }

  Future<void> DialogGambar(){
    return showDialog(
      context: context,
       builder: (BuildContext context){
        return AlertDialog(
          content: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset("assets/gambar/tropers.png")
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: ()=>Navigator.pop(context),
              child: const Text("Close",style: TextStyle(fontSize: 20),))
          ],

          
        );
       });
  }


}
