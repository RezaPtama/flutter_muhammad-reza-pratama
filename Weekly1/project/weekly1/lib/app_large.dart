import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class AppLargeText extends StatelessWidget {
  final double size;
  final String text;
  final Color color;
  const AppLargeText({
    Key?key,
    this.size = 30,
    required this.text,
    this.color = Colors.black,
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: size,
        fontWeight: FontWeight.bold
      ),
    );
  }
}

                    // RotatedBox(
                    //   quarterTurns: 3,
                    //   child: Container(
                    //     height: 400,
                    //     width: 400,
                    //     decoration: const BoxDecoration(
                    //       image: DecorationImage(
                    //         image: AssetImage("assets/gambar/formaja.png"),
                    //         fit: BoxFit.cover
                    //       ),
                    //     ),
                    //   ),
                    // ),
          
                    // Container(
                    //   width: 70,
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //     children: List.generate(3, (indexDots){
                    //         return Container(
                    //           width: index == indexDots ? 30 : 15,
                    //           height: 8,
                    //           decoration: BoxDecoration(
                    //             borderRadius: BorderRadius.circular(8),
                    //             color: index == indexDots ? Colors.blue : Colors.white54
                    //           ),
                    //         );
                    //       }),
                    //   ),
                    // ),
                    // SizedBox(height: 100),
          
                    // SizedBox(
                    //   width: 380,
                    //   height: 60,
                    //   child: ElevatedButton(
                    //     style: ElevatedButton.styleFrom(
                    //       shape: StadiumBorder(),
                    //       backgroundColor: Color.fromARGB(255, 34, 53, 109),
                    //       side: BorderSide(width: 3),
                    //     ),
                    //     onPressed: (){
                    //       Navigator.push(
                    //         context,
                    //         MaterialPageRoute(builder: (context) => Dashboard())
                    //       );
                    //     }, 
                    //     child: Text("GET STARTED",style : TextStyle(fontSize: 18))
                    //     )
                    //   ),