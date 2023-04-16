

import 'dart:convert';
import 'dart:ffi';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:section_25/API/contact_api.dart';

class SoalPrioritas1 extends StatefulWidget {
  const SoalPrioritas1({super.key});

  @override
  State<SoalPrioritas1> createState() => _SoalPrioritas1State();
}

class _SoalPrioritas1State extends State<SoalPrioritas1> {

  final dio = Dio();
  var result1;
  var result2;
  var result3;
  List dataBase = [];


  @override
  void initState() {
    super.initState();
    
  }

  TextStyle fontGede = const  TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,
  );

  TextStyle fontKecil = const TextStyle(
    fontSize: 20,
    color: Colors.black54
  );


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Soal Prioritas 1"),
      ),

      body: ListView(
        children: [
          Padding(padding: EdgeInsets.all(20)),
          Container(
            decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black,
                  blurRadius: 20.0
                )
              ]
            ),
            height: 300,
            child: Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              elevation: 8,
              shadowColor: Colors.black,
              child: Column(
                children: [
                  Text("Soal Nomor 1", style: fontGede,),
                  Text("POST", style: fontKecil),
                  ElevatedButton(
                    onPressed: () async {
                      String name = "Reza Pratama";
                      String phone = "08123456789";
                      final Response response = await dio.post(
                        'https://my-json-server.typicode.com/hadihammurabi/flutter-webservice/contacts',
                        data: {
                          "name" : name,
                          "phone" : phone
                        },
                        options: Options(
                          validateStatus: (status) => true, 
                        ),
                      );
                      debugPrint(response.data.toString());
                      setState(() {
                        result1 = response.data.toString();
                      });
                    },
                    child: Text("POST")
                  ),
                  Text(result1.toString(),style: fontKecil,)
               ],
              ),
            ),
          ),
          Padding(padding: EdgeInsets.all(20)),
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black,
                  blurRadius: 20.0
                )
              ]
            ),
            height: 300,
            child: Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              elevation: 8,
              shadowColor: Colors.black,
              child: Column(
                children: [
                  Text("Soal Nomor 2", style: fontGede,),
                  Text("Mengubah bentuk JSON dalam bentuk Object",style: fontKecil,textAlign: TextAlign.center,),
                  ElevatedButton(
                    onPressed: () async {
                      String dataJSON =  
                        '{"id": 2,"name": "John Thor","phone": "0857676565688"}';
                      Map<String,dynamic> dataMap = jsonDecode(dataJSON) as Map<String, dynamic>;
                      debugPrint(dataMap.toString());
                      setState(() {
                       result2 = dataMap;
                      });
                    },
                    child: Text("GET")
                  ),
                  Text(result2.toString(),style: fontKecil,),
                ],
              ),
            ),
          ),
          Padding(padding: EdgeInsets.all(20)),
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black,
                  blurRadius: 20.0
                )
              ]
            ),
            height: 300,
            child: Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              elevation: 8,
              shadowColor: Colors.black,
              child: Column(
                children: [
                  Text("Soal Nomor 3", style: fontGede,),
                  Text("PUT request",style: fontKecil,textAlign: TextAlign.center,),
                  ElevatedButton(
                    onPressed: () async {
                      final Response response = await dio.put(
                        'https://jsonplaceholder.typicode.com/posts/1',
                        data: {
                          'title' : 'foo',
                          'body' : 'bar',
                          'userId' : 1,
                        },
                        options: Options(
                          headers: {
                            Headers.contentTypeHeader : "application/json"
                          },
                          validateStatus: (status) => true, 
                        )
                      );
                      debugPrint(response.data.toString());
                        setState(() {
                          result3 = response.data.toString();
                      });
                    },
                    child: Text("PUT")
                  ),
                  Text(result3.toString(),style: fontKecil,),
                ],
              ),
            ),
          ),
        ],
      )

    );
  }
}