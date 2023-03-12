import 'dart:async';
import 'dart:io';

// Soal No 1
class Calculator { // class Calculator
     double bil1 = 0; //property bilangan 1
     double bil2 = 0; //property bilangan 2

    penjumlahan(bil1,bil2) { // Method penjumlahan dengan parameter dari property
      print('Penjumlahan dari $bil1 + $bil2 = ${bil1 + bil2} ');
    }
    pengurangan(bil1,bil2) { // Method pengurangan dengan parameter dari property
      print('Pengurangan dari $bil1 - $bil2 = ${bil1 - bil2} ');
    }
    perkalian(bil1,bil2) { // Method perkalian dengan parameter dari property
      print('Perkalian dari $bil1 x $bil2 = ${bil1 * bil2} ');
    }
    pembagian(bil1,bil2) { // Method penjumlapembagianhan dengan parameter dari property
      print('Pembagian dari $bil1 : $bil2 = ${bil1 / bil2} ');
    }
   
}


// Soal No 2
class Course {
 //atribut
 int id;
 String judul;
 String deskripsi;

//constructor
 Course({
  this.id = 0,
  this.judul = '',
  this.deskripsi = '',
 });
}

class Student { //class student
  String nama = 'Muhammad Reza Pratama'; //atribut
  String kelas = 'D'; //atribut
  List <Course> daftarCourse = []; //List daftar Course
  Set <Course> course = {}; //Set Course agar tidak terjadi duplikasi

  menambahCourse(Course course){ //method untuk menambahkan value List daftar Course
  daftarCourse.add(course);
  }

  mengambilCourse(){ //method untuk menambahkan value set Course dari List daftarCourse 
    stdout.write('\nMasukan ID Course yang ingin kamu tambah : ');
    int tambah = int.parse(stdin.readLineSync()!); //input id
    if(tambah == 0 || tambah > 4){
      print('Input Salah');
    }else{
      course.add(daftarCourse.firstWhere((element) => element.id == tambah)); //menambahkan value set course dari daftar course dengan menggunakan atribut id
      print('Kamu menambah Course ${course.firstWhere((element) => element.id == tambah).judul}');
    }
  }

  menghapusCourse(){ // Method untuk mengahapus course yang sudah diambil
    melihatCourse(); // method melihatCourse();
    if(course.isEmpty){ // branch kondisi if
      stdout.write('');
    }else{
    stdout.write('\nMasukan ID Course yang ingin kamu hapus : ');
    int hapus = int.parse(stdin.readLineSync()!); //input data Id
      if(hapus == 0){
        print('Input Anda Salah');
      }else{
      print('Menghapus Course ${course.firstWhere((element) => element.id == hapus).judul}');
      course.removeWhere((element) => element.id == hapus); //menghapus value set course dari daftar Course dengan menggunakan atribut id
      }
    }
  }

  melihatCourse(){ //method untuk melihat Course yang sudah di tambahkan
    if(course.isEmpty){
      print('\nKamu belum mengambil Course');
    }else{
      print('\nDaftar Course yang sudah kamu ambil');
      for(int i = 0; i<course.length;i++){ // dengan cara perulangan for
        print('');
        print('Id\t : ${course.toList()[i].id}'); //mengambil value id
        print('Judul\t : ${course.toList()[i].judul}'); //mengambil value judul
        print('Deskrisi : ${course.toList()[i].deskripsi}'); //mengambil value deskripsi
      }
    }
  }
 
  daftarKelas(){ //method untuk melihat daftar Course
    print('\nDaftar Course yang tersedia');
    for(int i = 0; i<daftarCourse.length;i++){ // dengan cara perulangan for
      print('');
      print('Id\t : ${daftarCourse.toList()[i].id}'); //mengambil value id
      print('Judul\t : ${daftarCourse.toList()[i].judul}'); //mengambil value judul
      print('Deskrisi : ${daftarCourse.toList()[i].deskripsi}'); //mengambil value deskripsi
    }
  }

  profilStudents(){ //method untuk menampilkan profil student
    print('\nTerimakasih Sudah mengambil Course di Alta.id');
    print('Nama Lengkap\t: $nama'); // menampilkan nama
    print('Kelas\t\t: $kelas'); // menampilkan kelas
    for(int x = 0; x<course.length;x++){ //dengan cara perulangan untuk mengambil course yang diambil
    print('Course\t\t: ${course.toList()[x].judul}'); //mengambil value judul
    }
    print('');
  }


}


void main(List<String> args) {

  print('===== Soal No 1 =====');
  print('Calculator\n');
  var calculator = Calculator(); // memanggil class Calculator();
  calculator.penjumlahan(3,4); //memanggil method penjumlahan dengan parameter
  calculator.pengurangan(20, 10); //memanggil method pengurangan dengan parameter
  calculator.perkalian(8, 7); //memanggil method perkalian dengan parameter
  calculator.pembagian(20,5); //memanggil method pembagian dengan parameter


  print('===== Soal No 2 =====');
  var a = Student(); //memanggil class Student();

  //menambahkan value dari daftar course dengan menggunakan parameter
  a.menambahCourse(Course(id: 1,judul: 'Flutter', deskripsi: 'Front-End Mobile')); 
  a.menambahCourse(Course(id: 2,judul: 'UI/UX', deskripsi: 'Design UI/UX Mobile'));
  a.menambahCourse(Course(id: 3,judul: 'Golang', deskripsi: 'Back-End Mobile'));

    print('\nSelamat Datang ${a.nama} dari Kelas ${a.kelas}');
    while(1 < 2 ){ //menggunakan perulangan while 
    print('\n[1] Menambah Course');
    print('[2] Melihat Course Kamu');
    print('[3] Menghapus Course');
    print('[4] Melihat Daftar Course');
    print('[0] Keluar');
    stdout.write('Pilih : ');
    int pilih = int.parse(stdin.readLineSync()!); //input switch case

    switch(pilih) { //switch case
      case 1 : { a.mengambilCourse();} // case 1 dengan memanggil method mengambilCourse()
      break; 
     
      case 2 : { a.melihatCourse(); } // case 2 dengan memanggil method melihatCourse()
      break; 
     
      case 3 : {  a.menghapusCourse(); } // case 3 dengan memanggil method menghapusCourse()
      break; 
     
      case 4 : { a.daftarKelas(); } // case 4 dengan memanggil method daftarkelas()
      break;

      case 0 :{ a.profilStudents();exit(0);} // case 0 dengan memanggil method profilStudents() dan juga method exit untuk menghentikan tugas
     
      default: { print("Input Salah"); } //default case
      break; 
   }
    }
}