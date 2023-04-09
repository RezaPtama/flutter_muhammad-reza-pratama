
import 'package:flutter/material.dart';
import 'report.dart';
class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final _formKey = GlobalKey<FormState>();
  var _FirstNamaController = TextEditingController();
  var _LastNamaController = TextEditingController();
  var _emailController = TextEditingController();
  var _ReportController = TextEditingController();

  List<Report> dataDiri = [];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Trip To Japan'),
        centerTitle: true,
        shape : const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(bottom: Radius.circular(40))),
        toolbarHeight: 130,
        elevation: 0,
        // backgroundColor: Color(0xffF57752),
        actions: [
          IconButton(onPressed: (){}, icon: const Icon(Icons.search)),
          IconButton(onPressed: (){}, icon: const Icon(Icons.notifications)),
          
        ],
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            child: Image.asset(
              'assets/gambar/japan_home.png',
              opacity: const AlwaysStoppedAnimation(.4),
              fit: BoxFit.cover,
              ),
          ),
          Form(
            key: _formKey,
            child: ListView(
              children: 
                [Container(
                  padding: const EdgeInsets.all(14),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Padding(padding: EdgeInsets.only(bottom: 20)),
                            Text("Contact Us",style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold),),
                            Padding(padding: EdgeInsets.only(bottom: 20)),
                            SizedBox(width: 250,
                            child: Text(
                              "Need to get in touch with us? Either fill out the form with your inquiry or find the departemen email you'd like to contact below",
                              style: TextStyle(fontSize: 15,color: Colors.white54),
                              )),
                          ],
                        ),
                      ),
                      const SizedBox(height: 100),
                
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children:  [
                                    const Text("First Name*"),
                                    const Padding(padding: EdgeInsets.only(bottom:  10)),
                                    SizedBox(
                                      width: 180,
                                      child :TextFormField(
                                        controller: _FirstNamaController,
                                        textInputAction: TextInputAction.next,
                                        decoration: const InputDecoration(
                                          border: OutlineInputBorder(),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text("Last Name*"),
                                    const Padding(padding: EdgeInsets.only(bottom:  10)),
                                    SizedBox(
                                      width: 180,
                                      child :TextFormField(
                                        controller: _LastNamaController,
                                        textInputAction: TextInputAction.next,
                                        decoration: const InputDecoration(
                                          border: OutlineInputBorder(),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),               
                              ],
                            ),  
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children:  [
                                    const Padding(padding: EdgeInsets.only(bottom:  10)),
                                    const Text("Email*"),
                                    const Padding(padding: EdgeInsets.only(bottom:  10)),
                                    SizedBox(
                                      child :TextFormField(
                                        keyboardType: TextInputType.emailAddress,
                                        controller: _emailController,
                                        textInputAction: TextInputAction.next,
                                        decoration: const InputDecoration(
                                          border: OutlineInputBorder(),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),               
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Padding(padding: EdgeInsets.only(bottom:  10)),
                                    const Text("What can we help you with ?"),
                                    const Padding(padding: EdgeInsets.only(bottom:  10)),
                                    SizedBox(
                                      height: 100,
                                      child :TextFormField(
                                        controller: _ReportController,
                                        decoration: const InputDecoration(
                                          border: OutlineInputBorder(),
                                        ),
                                        maxLines: 5,
                                        minLines: 1,
                                      ),
                                    ),
                                  ],
                                ),               
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 50,
                        width: double.infinity,
                        child: ElevatedButton.icon(
                          onPressed: (){
                            var firstName = _FirstNamaController.text;
                            var lastName = _LastNamaController.text;
                            var email = _emailController.text;
                            var report = _ReportController.text;
                            if (_formKey.currentState!.validate()) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Processing Data')),
                            );
                            setState(() {
                            dataDiri.add(Report(firstName: firstName, lastName: lastName, email: email, report: report));  
                            });
                            }
                            _FirstNamaController.text = '';
                            _LastNamaController.text = '';
                            _ReportController.text = '';
                            _emailController.text ='';
                            DialogDataDiri();

                          }, 
                          label: const Text("Submit",style: TextStyle(fontSize: 18)),
                          icon: const Icon(Icons.send),
                        )
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      drawer: BuildDrawer(context),
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
                  if(dataDiri.isEmpty || dataDiri.length == 0)...[
                    const Text('CODE COMPETENCE 1',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),)
                  ]else...[
                  InkWell(
                    onTap: (){
                      DialogGambar();
                    },
                    child: const CircleAvatar(
                      backgroundImage: AssetImage("assets/gambar/welcome.png"),
                      radius: 52,
                      // backgroundColor: Colors.white70,
                      // child: Icon(Icons.add_a_photo),
                    ),
                  ),
                  const SizedBox(height: 12,),
                  Text(dataDiri.last.firstName + " " + dataDiri.last.lastName,style: const TextStyle(color: Colors.white,fontSize: 24,fontWeight: FontWeight.bold),),
                  Text(dataDiri.last.email,style: const TextStyle(color: Colors.white, fontSize: 18),),
                  ]
                  
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
                    onTap: () {
                      DialogDataDiri();
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.favorite_border_outlined),
                    title: const Text('Favourites'),
                    onTap: () {},
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

  Future<void> DialogDataDiri(){
    return showDialog(
      context: context,
       builder: (BuildContext context){
        return AlertDialog(
          title: const Text('Terimakasih Sudah Mengisi Form',),
          content: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Nama\t: "+dataDiri.last.firstName+" "+dataDiri.last.lastName),
              const Padding(padding: EdgeInsets.only(bottom: 10)),
              Text("Email\t: "+dataDiri.last.email),
              const Padding(padding: EdgeInsets.only(bottom: 10)),
              Text("Tanggapan anda\t: \n"+dataDiri.last.report),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: ()=>Navigator.pop(context),
              child: const Text("Close",style: TextStyle(fontSize: 20),))
          ],

          
        );
       });
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
                Image.asset("assets/gambar/welcome.png")
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