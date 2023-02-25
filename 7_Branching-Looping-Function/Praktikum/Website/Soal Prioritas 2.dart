import 'dart:io';
import 'dart:core';

// Function
void luasLingkaran(double r){
  
  double phi = 3.14;
  double luas;
  
  luas = phi * r * r; //rumus luas lingkaran
  print('luas lingkaran dari $r adalah = $luas'); // menampilkan hasil
}


void main()
{
  print('Tugas Looping\n');
  //Soal No 1
  print("Soal No 1");
  int baris = 15; // menentukan baris dari piramid
  for(int a=1; a<= baris; a+=2){
    
    print(" " * (baris-a) + "* " * a);
    
  }
  //soal No 2
  print("\nSoal No 2\n");
  int baris1 = 15; // menentukan baris pada jam pasir
  //perulangan decrement membuat segitiga terbalik
  for(int b=baris1; b >1; b-=2)
  {
    print(" " * (baris1-b) + "0 " * b);
  }
  //perulangan increment membuat segitiga
  for(int c=1; c<=baris1; c+=2)
  {
    print(" " * (baris1-c) + "0 " * c);
  }

  //Soal No 3
  print("\nSoal No 3\n");
  
  //tipe data
  double faktorial1 = 1;
  double faktorial2 = 1;
  double faktorial3 = 1;
  int angka1 = 10;
  int angka2 = 40;
  int angka3 = 50;
  
  // stdout.write('Masukan Angka : ');
  // int angka = int.parse(stdin.readLineSync());
  
  //angka 1
  for(int i=1; i<=angka1; i++){ //perulangan untuk menentukan faktorial
    faktorial1 *= i; //rumus faktorial
  }
  // angka 2
  for(int i=1; i<=angka2; i++){ //perulangan untuk menentukan faktorial
    faktorial2 *= i; //rumus faktorial
  }
  //angka 3
  for(int i=1; i<=angka3; i++){ //perulangan untuk menentukan faktorial
    faktorial3 *= i; //rumus faktorial
  }
  print('faktorial dari $angka1' + ' adalah $faktorial1');
  print('faktorial dari $angka2' + ' adalah $faktorial2');
  print('faktorial dari $angka3' + ' adalah $faktorial3');

  //Function
  print('\nTugas Function\n');

  luasLingkaran(27); //pemanggilan function luasLingkaran dan menetapkan nilai
}