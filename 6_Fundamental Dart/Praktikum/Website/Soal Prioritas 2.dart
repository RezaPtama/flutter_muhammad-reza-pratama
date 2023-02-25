import 'dart:io';


void main(){
    
  print('Soal No 1\n');
  print('Menyambung Kata');

    stdout.write("Masukan kata pertama\t: ");
    String kata1 = stdin.readLineSync(); // input kata pertama
    
    stdout.write("Masukan kata kedua\t: ");
    String kata2 = stdin.readLineSync(); // input kata kedua
   
    stdout.write("Masukan kata ketiga\t: ");
    String kata3 = stdin.readLineSync(); // input kata ketiga
    
print('\nOutput : $kata1 $kata2 $kata3'); // menampilkan serta menggabungkan kata pertama, kedua, dan ketiga
 
print('\nSoal No 2'); 
print('\nMenentukan Volume Tabung');

    stdout.write("Masukan jari-jari tabung : ");
    double jari = double.parse(stdin.readLineSync()); // input jari-jari tabung
    stdout.write("Masukan tinggi tabung : ");
    double tinggi = double.parse(stdin.readLineSync()); // input tinggi tabung 
    
    double phi = 3.14; // deklrasi phi untuk lingkaran
    double volume; 
    
    volume = phi*jari*jari*tinggi; // rumus volume tabung
    
    print("Volume Tabung adalah : $volume"); // menampilkan hasil 
 
}