import 'dart:async';

Future <int> perkalian (List <int> data,int pengali) async{ // menggunakan asyncronous future karena membawa return dari fungsi async
  // melakukan looping pada list data secara asyncronous
  return Future.delayed(Duration(seconds: 1),(){ // menambahkan delay 1 sec
    return pengali * data[0] ; // perkalian data dan pengali
   });

}


void main() async{

  List <int?> hasil = []; // membuat list untuk memasukan value dari hasil
  print('Menambahkan Value List hasil');
  for(int i = 1; i<6; i++){
  print(await perkalian([i],3));
  hasil.add(await perkalian([i],3)); // menambahkan value dari hasil perkalian
 }
  print('Data dimasukan ke dalam list hasil');
  print(hasil); // menampilkan list dari data yang sudah di dapat
 
}