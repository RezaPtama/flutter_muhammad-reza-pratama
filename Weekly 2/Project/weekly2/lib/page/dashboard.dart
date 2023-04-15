
import 'package:flutter/material.dart';
import 'package:weekly1/fonts/fonts_text.dart';
import 'package:weekly1/helper/report.dart';
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
  List<String> image = [
    "welcome.png",
    "japan.png",
  ];


  TextStyle fontGede = const TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,
    color: Colors.white
  );
  TextStyle fontKecil = const TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.bold,
    color: Colors.white70
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          "assets/gambar/logoJapan.png",
          fit: BoxFit.contain,
          height: 42,
        ),
        centerTitle: true,
        shape : const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(bottom: Radius.circular(40))),
        toolbarHeight: 130,
        elevation: 0,
        shadowColor: Colors.black,
        backgroundColor: Color(0xffF57752),
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
                [
                  Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 500,
                        child: Stack(
                          children: [
                            Container(
                              color: Colors.black,
                              height: 500,
                              width: double.infinity,
                              child: Image.asset(
                                "assets/gambar/japan2.png",
                                opacity: AlwaysStoppedAnimation(.7),
                                fit: BoxFit.cover,
                              ),
                            ),
                            Center(
                              child: Container(
                                height: 500,
                                width: 500,
                                alignment: Alignment.center,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const FontGede(color: Colors.white,align: TextAlign.center,text: 
                                      "Temukan Passionmu, Nikmati Pengalaman Tak Terlupakan di Jepang"
                                    ),
                                    const Padding(padding: EdgeInsets.only(bottom: 15)),
                                    const FontKecil(size: 14,align: TextAlign.center,color: Colors.white70,text: 
                                      "Terdapat berbagai pilihan kota menarik seperti Tokyo, Fuji, Osaka, Kyoto, Hokkaido, Nagano, Nagoya, Takayama, Hiroshima, Nagasaki, Kawasaki, Nikko dan masih banyak lagi. Dapatkan Promo Private Tour Harga termurah. Hubungi kami untuk mendapatkan penawaran spesial berbagai jenis tour jepang mulai dari family trip jepang anda, Muslim Tour Jepang, Private Tour Jepang hingga Group Tour Komunitas anda.",
                                    ),
                                    const Padding(padding: EdgeInsets.only(bottom: 15)),
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Color(0xffF57752)
                                      ),
                                      onPressed: (){}, 
                                      child: FontKecil(color: Colors.white,align: TextAlign.start,text: "Pelajari Lebih Lanjut")
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Padding(padding: EdgeInsets.only(bottom: 20)),
                            Text("Contact Us",style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold),),
                            Padding(padding: EdgeInsets.only(bottom: 20)),
                            SizedBox(width: 300,
                            child: Text(
                              "Need to get in touch with us? Either fill out the form with your inquiry or find the departemen email you'd like to contact below",
                              style: TextStyle(fontSize: 15,color: Colors.white54),
                              )),
                          ],
                        ),
                      ),
                      const SizedBox(height: 100),
                
                      Container(
                        padding: EdgeInsets.all(14.0),
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
                        width: 250,
                        child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xffF57752)
                          ),
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
                      ),
                      Padding(padding: EdgeInsets.only(bottom: 10)),
                      Container(
                        alignment: Alignment.center,
                        height: 500,
                        width: double.infinity,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("About Us", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                            Padding(padding: EdgeInsets.all(20)),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                SizedBox(
                                  height: 300,
                                  width: 200,
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15.0)
                                    ),
                                    elevation: 8,
                                    shadowColor: Colors.black,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          padding: EdgeInsets.all(5),
                                          child: Column(
                                            children: const [
                                              Icon(Icons.park_rounded,size: 35,color: Colors.amber),
                                              FontGede(text: "Paket Gold",size: 20),
                                              Padding(padding: EdgeInsets.all(5)),
                                              FontKecil(align: TextAlign.start,size:15,text: 
                                                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Pretium lectus quam id leo in vitae."
                                              ),

                                            ],
                                          ),
                                        ),
                                        Container(
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: Color(0xffF57752)
                                            ),
                                            onPressed: (){},
                                            child: const FontKecil(color: Colors.white,text: "Pilih Paket"),
                                          ),
                                        )
                                      
                                        
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 300,
                                  width: 200,
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15.0)
                                    ),
                                    elevation: 8,
                                    shadowColor: Colors.black,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          padding: EdgeInsets.all(5),
                                          child: Column(
                                            children: const [
                                              Icon(Icons.card_travel,size: 35,color: Colors.amber),
                                              FontGede(text: "Paket Platinum",size: 20),
                                              Padding(padding: EdgeInsets.all(5)),
                                              FontKecil(align: TextAlign.start,size:15,text: 
                                                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Pretium lectus quam id leo in vitae."
                                              ),

                                            ],
                                          ),
                                        ),
                                        Container(
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: Color(0xffF57752)
                                            ),
                                            onPressed: (){},
                                            child: const FontKecil(color: Colors.white,text: "Pilih Paket"),
                                          ),
                                        )
                                      
                                        
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      )

                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      drawer: BuildDrawer(0),
    );
  }

  Widget BuildDrawer(int index){
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
                      DialogGambar(index);
                    },
                    child: const CircleAvatar(
                      backgroundImage: AssetImage("assets/gambar/welcome.png"),
                      radius: 52,
                      // backgroundColor: Colors.white70,
                      // child: Icon(Icons.add_a_photo),
                    ),
                  ),
                  const SizedBox(height: 12,),
                  Text("Muhammad Reza Pratama",style: const TextStyle(color: Colors.white,fontSize: 24,fontWeight: FontWeight.bold),),
                  Text("resapratama@gmail.com",style: const TextStyle(color: Colors.white, fontSize: 18),),
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
                    leading: const Icon(Icons.search_outlined),
                    title: const Text('Search'),
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

  Future<void> DialogGambar(index){
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
                Image.asset("assets/gambar/" + image[index],
                height: 300,
                fit: BoxFit.contain,
              )
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