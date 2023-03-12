import 'dart:async';
import 'dart:io';


class Buku{ // Membuat class buku
  //atribut
  String nama = ''; 
  String alamat = '';
  int Id;
  String judul;
  String penerbit;
  int harga;
  String kategori;


//constructor
  Buku({
    this.Id = 0,
    this.judul = '',
    this.penerbit = '',
    this.harga = 0,
    this.kategori = '',
  });
  List <Buku> dataBuku = []; //List dataBuku
  List <Buku> daftarBeli = []; //List daftarBeli
  

  void inputData(){ //method untuk menginput data costumer
    print('\nInput Data Costumer ');
    stdout.write('Masukan Nama Anda : '); 
    this.nama = stdin.readLineSync()!; // input nama 
    stdout.write('Masukan Alamat Anda : ');
    this.alamat = stdin.readLineSync()!; // input alamat

    print('\nSelamat Datang ${this.nama} dan Selamat Berbelanja');
  }

  void menambahBuku(){ //method untuk menambahkan Buku ke keranjang
    stdout.write('\nMasukan ID buku yang ingin di tambah : ');
    int tambah = int.parse(stdin.readLineSync()!); //input id
    if(tambah == 0 || tambah > 4){
      print('Input Salah');
    }else{
      daftarBeli.add(dataBuku.firstWhere((element) => element.Id == tambah)); //menambahkan value daftarBeli dari dataBuku dengan menggunakan atribut id
      print('Anda menambah buku ${daftarBeli.firstWhere((element) => element.Id == tambah).judul} ke Keranjang');
    }
  }

  void tambahData(Buku buku){ //method untuk menambahkan value List dataBuku
    dataBuku.add(buku);
  }

  void menghapusBuku(){ // method untuk mengahpus kan data buku dari keranjang
    keranjang();
    if(daftarBeli.isEmpty){ //branch kondisi if
      stdout.write('');
    }else{
    stdout.write('\nMasukan ID Buku yang ingin di hapus dari keranjang : ');
    int hapus = int.parse(stdin.readLineSync()!); // input id
      if(hapus == 0){
        print('Input Anda Salah');
      }else{
      print('Menghapus Data Buku ${daftarBeli.firstWhere((element) => element.Id == hapus).judul} dari Keranjang');
      daftarBeli.removeWhere((element) => element.Id == hapus); //menghapus value daftar beli dari daftar buku dengan menggunakan atribut id
      }
    }
  }
  void daftarBuku(){ //method untuk melihat semua daftar buku
    print('\nDaftar Semua Buku ');
    for(int i = 0; i<dataBuku.length;i++){ //dengan cara perulangan for
    print('');
    // mengambil value
    print('ID\t : ${dataBuku[i].Id}'); 
    print('Judul\t : ${dataBuku[i].judul}');
    print('Penerbit : ${dataBuku[i].penerbit}');
    print('Harga\t : ${dataBuku[i].harga}');
    print('Kategori : ${dataBuku[i].kategori}');
    }
  }
  void keranjang(){
    if(daftarBeli.isEmpty){
      print("\nKeranjang belanjaan Anda Kosong");
    }else{
    print('\nKeranjang belanjaan Anda');
    for(int i = 0; i<daftarBeli.length;i++){ //dengan cara perulangan for
    print('');
    // mengambil value
    print('ID\t : ${daftarBeli[i].Id}');
    print('Judul\t : ${daftarBeli[i].judul}');
    print('Penerbit : ${daftarBeli[i].penerbit}');
    print('Harga\t : ${daftarBeli[i].harga}');
    print('Kategori : ${daftarBeli[i].kategori}');
    }
    }
  }
  void totalHarga(){ //method untuk mengatahui total dari harga buku
    int jumlah = 0;
    for(int j = 0;j<daftarBeli.length;j++){ // dengan cara perulangan for
      jumlah = daftarBeli.toList()[j].harga + jumlah; //menambahkan semua value harga
    }
    print('Jumlah Harga adalah : Rp.$jumlah');
  }

  void keluar(){ //methout keluar untuk melakukan checkout atau print
    print('\nTerimakasih Sudah Berbelanja di Toko Kami\n');
    print('Nama Pengunjung : ${this.nama}');
    stdout.write('Buku yang di beli : ');
    for(int i = 0;i<daftarBeli.length;i++){
      stdout.write(daftarBeli[i].judul + ' ');
    }
    print('');
    totalHarga();
    print('\nPesanan akan di antar ke alamat : ${this.alamat}\n');
  }
}

void main(List<String> args) {
  Buku b = Buku();
  //Menambah value daftarBuku dengan menggunkaan parameter
  b.tambahData(Buku(Id: 1,judul: 'IPA',penerbit: 'SIDU',harga: 30000,kategori: 'Mata Pelajaran'));
  b.tambahData(Buku(Id: 2,judul: 'IPS',penerbit:'Erlangga',harga: 40000,kategori: 'Mata Pelajaran'));
  b.tambahData(Buku(Id: 3,judul: 'PAI',penerbit:'Edu',harga: 35000,kategori: 'Mata Pelajaran'));
  
  b.inputData(); //memanggil method input data

  while(1<2){ //dengan perulang while
  print('\n[1] Menampilkan Semua Data Buku di toko');
  print('[2] Memasukan Data Buku ke keranjang');
  print('[3] Menghapus Data Buku dari keranjang');
  print('[4] Melihat Keranjang Belanja');
  print('[0] Checkout');
  stdout.write('Pilih : ');
  int pilih = int.parse(stdin.readLineSync()!); //input swicth case
  switch(pilih){ // switch
    
    case 1 : {b.daftarBuku();} // case 1 dengan memanggil method daftarBuku()
    break;
    
    case 2 : {b.menambahBuku();} // case 1 dengan memanggil method menambahBuku()
    break;

    case 3 : {b.menghapusBuku();} // case 1 dengan memanggil method menghapusBuku()
    break;

    case 4 : {b.keranjang();}// case 1 dengan memanggil method keranjang()
    break;
    
    case 0 : {b.keluar(); exit(0);}// case 1 dengan memanggil method keluar()

    default : {print('Input Salah');}
    break;
  }
  }
}