import 'dart:io';

class BangunRuang { // membuat class BangunRuang
  int panjang = 0; // atribut panjang
  int lebar = 0; // atribut lebar
  int tinggi = 0; // atribut tinggi

  volume(){ // membuat method volume
    print('Tidak Diketahui');
  }


}

class Kubus extends BangunRuang{ // membuat class Kubus dengan mewariskan dari class BangunRuang
  int sisi = 0; // atribut sisi

  @override //override 
  volume() { // mengambil pewarisan method volume dari class BangunRuang
    return sisi * sisi * sisi; // rumus volume dari kubus
  }
}

class Balok extends BangunRuang { // membuat class Balok dengan mewariskan dari class BangunRuang
  @override //override
  volume() { // mengambil pewarisan method volume dari class BangunRuang
    return panjang * lebar * tinggi; // rumus volume dari Balok
  }
}

void main() { 
  var bangun = Kubus(); // mendeklrasikan var dengan nama bangun dengan memanggil class Kubus
  bangun.sisi = 10; // mengubah nilai dari atribut sisi
  stdout.write('Volume Bangun Kubus ');
  print(bangun.volume()); // menampilkan output hasil volume kubus

  var bangun1 = Balok(); // mendeklrasikan var dengan nama bangun1 dengan memanggil class Balok
  bangun1.panjang = 10; // mengubah nilai dari atribut panjang
  bangun1.lebar = 20; // mengubah nilai dari atribut lebar
  bangun1.tinggi = 30; // mengubah nilai dari atribut tinggi
  stdout.write('Volume Bangun Balok ');
  print(bangun1.volume()); // menampilkan output hasil volume kubus
}