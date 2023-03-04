import 'dart:io';
import 'dart:math';
import 'dart:async';

  // membuat function hasil()
  Future <int> hasil() =>
    Future.delayed(Duration (seconds: 1),()=>1); // Memberi delay durasi sebanyak 1 second


Future <int> faktorial(int faktor)async{ // membuat function future asinkron untuk faktorial
    var fak = await hasil(); // memanggil function hasil()
    for(int i = 1; i<=faktor; i++) // looping untuk rumus faktorial
    {
      fak *= i; // rumus faktorial
    }
    return fak; // mengembalikan nilai yang tersimpan dalam sebuah variabel kepada kode yang akan memanggil function tersebut
  }






void main() async{ // menggunakan asinkron

  //soal 1
  print('Soal No 1\n');
  print('Implementasi List dan Map (Collection)');

  // Membuat List didalam List.
  List <List> identitas = [
    [
      'Reza Pratama', //List pertama
      22,
    ]
    ,
    [
      'Malang',
      'Laki-laki', //List kedua
    ],

  ];

  var hasil = Map<String, dynamic>(); // Membuat Map dengan menggunakan List identitas
  hasil = 
  {
    // Mendeklarasikan Map dengan list yang sudah dibuat berupa key-value
    'Nama' : identitas[0][0],
    'Umur' : identitas[0][1],
    'Alamat' : identitas[1][0],
    'Jenis Kelamin' : identitas[1][1],
  };
  print(hasil); // Menampilkan collection Map

  print('\nSoal No 2\n');
  print('Menghitung Rata-Rata Nilai dengan pembulatan keatas');

  List<int> nilai = []; // List untuk dimasukan hasil
  List<String> mapel = ['IPA','IPS','MTK','PKN','BIOLOGI','PENJAS']; // List Mata pelajaran


  //perulangan for untuk menambah value List nilai
  for(int a = 0; a <6; a++){ 
    stdout.write('Masukan nilai ${mapel[a]} : ');
    int value = int.parse(stdin.readLineSync()!); //Input value List nilai
    nilai.add(value); // menambahkan Value pada List nilai
  }

  double sum = 0; // variabel rata-rata
  
  // Membuat map untuk menggabungkan List mapel dan juga List nilai
  var hasilNilai = Map<String, int>();

    hasilNilai = {
    mapel[0] : nilai[0],      
    mapel[1] : nilai[1],      
    mapel[2] : nilai[2],      
    mapel[3] : nilai[3],      
    mapel[4] : nilai[4],      
    mapel[5] : nilai[5],      
  };


  // perulangan for untuk menjumlahkan semua value pada List nilai
   for(int a = 0; a <6; a++){ 
    sum = nilai[a] + sum;
  }


  print('Nilai yang di inputkan : ');

  print('\n$hasilNilai\n'); // Menampilkan map yang sudah diisi value.
  num rata = sum / 6;
  print('Rata-rata Nilai sebelum dibulatkan $rata');

  print('Rata-rata Nilai adalah ${rata.ceil()}');


  print('\nSoal No 3\n');
  print('Faktorial Menggunakan Asinkron\n');
  stdout.write('Masukan Angka : '); 
  int angka = int.parse(stdin.readLineSync()!); // Input user angka
  print('Prosess...\n');
  stdout.write('Hasil dari Faktorial adalah : ');
  print(await faktorial(angka)); // Memanggil function faktroial
  
}