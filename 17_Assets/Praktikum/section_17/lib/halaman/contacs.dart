
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:section_13/halaman/addContact.dart';
import 'package:section_13/main.dart';



class Contacs extends StatefulWidget {
  final TaskManager manager;
  const Contacs({Key?key,required this.manager}) :super(key: key);

  @override
  State<Contacs> createState() => _ContacsState();
}

class _ContacsState extends State<Contacs> {  
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: SafeArea(
          child: ListView.builder(
            padding: const EdgeInsets.all(20),
            itemCount: widget.manager.taskModels.length,
            itemBuilder: (context, index){
              return Container(
                padding: EdgeInsets.only(bottom: 35),
                child: Column(
            children: [
            Padding(padding: EdgeInsets.zero,
            child : Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  // Icon Avatar
                 CircleAvatar(
                    maxRadius: 30,
                    backgroundColor: index%2==1 ?Colors.deepOrange : Colors.orangeAccent,
                    foregroundColor: Colors.white,
                    // child: Text(listcontacs[i]['nama'][0].toString().capitalize(),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
                    child: Text(widget.manager.taskModels[index].nama[0].capitalize(),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
                  ),
             

                  // Text Nama dan Nomor Telepon
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(widget.manager.taskModels[index].nama,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                      Text(widget.manager.taskModels[index].nomor,style: TextStyle(fontSize: 18,color: Color.fromARGB(134, 255, 255, 255)),)
                    ],
                  ),


                  // Icon Button
                  
                 Row(
                    children: 
                      [
                        // Edit Button
                        IconButton(onPressed: () async {
                          final taskItems = widget.manager;
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AddContacs(
                                onCreate: (task){
                                  widget.manager.updateTask(task,index);
                                  Navigator.pop(context);
                                },
                                selectedIndex: index,
                                manager: widget.manager,
                              )
                            )
                          );

                          
                          setState(() {
                            // selectedIndex = index;
                          });
                     
                      }, icon: Icon(Icons.edit),alignment: Alignment.center),

                      //Delete Button
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
          // ]

            ],
          )
              );
            },

          ),
        ),
        drawer: const BuildDrawer(),
        floatingActionButton: BuildAddContacs(),
      );
  }

   Widget BuildAddContacs(){
      return FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: (){
          final manager = Provider.of<TaskManager>(context,listen: false);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddContacs
              (
                onCreate: (task){
                  manager.addTask(task);
                  Navigator.pop(context);
                },
                selectedIndex: -1,
                manager: manager,
              )
          )
        );
        },
        child: const Icon(Icons.add),
      );
  }
}

class EmptyContacs extends StatefulWidget {
  const EmptyContacs({super.key});

  @override
  State<EmptyContacs> createState() => _EmptyContacsState();
}

class _EmptyContacsState extends State<EmptyContacs> {
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
      floatingActionButton: BuildAddContacs(),
    );
  }

    Widget BuildAddContacs(){
      return FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: (){
          final manager = Provider.of<TaskManager>(context,listen: false);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddContacs
              (
                onCreate: (task){
                  manager.addTask(task);
                  Navigator.pop(context);
                },
                selectedIndex: -1,
                manager: manager,
              )
            )
          );
        },
        child: const Icon(Icons.add),
      );
    }
}









