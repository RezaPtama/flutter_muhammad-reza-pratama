import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SoalPrioritas2 extends StatefulWidget {
  const SoalPrioritas2({super.key});

  @override
  State<SoalPrioritas2> createState() => _SoalPrioritas2State();
}

class _SoalPrioritas2State extends State<SoalPrioritas2> {

  final dio = Dio();
  var result ;

  Map<String,String> seed = {"seed" : "Jane"};
  
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Soal Prioritas 2"),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(padding: EdgeInsets.all(10)),
            if(result == null)...[
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.amber
                ),
                width: 200,
                height: 200,
                child: Icon(Icons.add_a_photo),
              )
            ]else...[
              SvgPicture.network(
                result,
                height: 200,
              ),
              Padding(padding: EdgeInsets.all(10)),
              Text(result.toString()),

            ],
            Padding(padding: EdgeInsets.all(10)),
            ElevatedButton(
              onPressed: ()async{
                final Response response =  await dio.get(
                  "https://api.dicebear.com/6.x/pixel-art/svg",
                  options: Options(),
                  queryParameters: seed
                );
                debugPrint(response.realUri.toString());
                setState(() {
                  result = response.realUri.toString();
                });
              },
              child: Text("Add Image")
            ),
          ],
        ),
      ),
    );
  }
}