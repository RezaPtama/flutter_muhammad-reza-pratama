import 'dart:io';
  
void main() {

//Tipe data yang digunakan
int kelilingPersegi;
int luasPersegi;
int kelilingPersegiPjg;
int luasPersegiPjg;

print('Soal No 1\n');



//Luas dan Keliling Persegi
print('Menentukan Luas dan Keliling Persegi');
stdout.write('Masukan Sisi Persegi : '); 
int sisiPersegi = int.parse(stdin.readLineSync()); //Input Sisi Persegi

//Keliling
kelilingPersegi = 4*sisiPersegi;
print('keliling Persegi adalah : ${kelilingPersegi}');

//Luas
luasPersegi = sisiPersegi*sisiPersegi;
print('Luas Persegi adalah : ${luasPersegi}');

print('');

//Luas dan Keliling Persegi Panjang
print('Menentukan Luas dan Keliling Persegi Panjang');

stdout.write('Masukan Panjang dari Persegi Panjang : ');
int panjang = int.parse(stdin.readLineSync()); //Input sisi panjang persegi panjang

stdout.write('Masukan Lebar dari Persegi Panjang : ');
int lebar = int.parse(stdin.readLineSync()); //Input sisi lebar persegi panjang

//Keliling
kelilingPersegiPjg = 2 *(lebar + panjang);
print('Keliling Persegi panjang adalah : ${kelilingPersegiPjg}'); //Print hasil

//Luas
luasPersegiPjg = panjang * lebar;
print('Luas Persegi Panjang adalah : ${luasPersegiPjg}'); //Print hasil

print('\nSoal No 2\n');

//Tipe data yang digunakan
double kelilingLingkaran;
double luasLingkaran;

//untuk mendeklarasikan variabel phi
double phi = 22 / 7;

//Luas dan Keliling lingkaran
print('Menentukan Luas dan Keliling Lingkaran');

stdout.write('Masukan jari-jari lingkaran : ');
int jari = int.parse(stdin.readLineSync());//Input jari-jari lingkaran


//rumus Luas dan Keliling
kelilingLingkaran = 2*phi*jari;
luasLingkaran = phi*jari*jari;

//print Hasil
print('Keliling Lingkaran adalah : ${kelilingLingkaran}');
print('Luas Lingkaran adalah : ${luasLingkaran}');
}