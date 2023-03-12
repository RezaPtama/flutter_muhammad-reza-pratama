import 'dart:io';

class BangunRuang {
  int panjang = 0;
  int lebar = 0;
  int tinggi = 0;

  volume(){
    print('Tidak Diketahui');
  }


}

class Kubus extends BangunRuang{
  int sisi = 0;
  @override
  volume() {
    return sisi * sisi * sisi;
  }
}

class Balok extends Kubus {
  @override
  volume() {
    return panjang * lebar * tinggi;
  }
}

void main(List<String> args) {
  var bangun = Kubus();
  bangun.sisi = 10;  
  stdout.write('Volume Bangun Kubus ');
  print(bangun.volume());

  var bangun1 = Balok();
  bangun1.panjang = 10;
  bangun1.lebar = 20;
  bangun1.tinggi = 30;
  stdout.write('Volume Bangun Balok ');
  print(bangun1.volume());
}